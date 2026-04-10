#!/usr/bin/env node
// SearXNG MCP server — wraps searxng.aldervall.se

const readline = require('readline');
const https = require('https');

const BASE_URL = 'https://searxng.aldervall.se/search';

const rl = readline.createInterface({ input: process.stdin, terminal: false });

function send(msg) {
  process.stdout.write(JSON.stringify(msg) + '\n');
}

function search(query, categories = 'general') {
  return new Promise((resolve, reject) => {
    const params = new URLSearchParams({ q: query, format: 'json', categories });
    const reqUrl = `${BASE_URL}?${params}`;

    const headers = { 'User-Agent': 'Claude-MCP/1.0' };
    if (process.env.SEARXNG_COOKIE) headers['Cookie'] = process.env.SEARXNG_COOKIE;

    https.get(reqUrl, { headers }, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        reject(new Error(`Redirect to auth: ${res.headers.location}`));
        return;
      }
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          const results = (json.results || []).slice(0, 10).map(r =>
            `**${r.title}**\n${r.url}\n${r.content || ''}`.trim()
          ).join('\n\n');
          resolve(results || 'No results found');
        } catch (e) {
          reject(new Error(`Failed to parse response: ${e.message}`));
        }
      });
    }).on('error', reject);
  });
}

rl.on('line', async (line) => {
  let req;
  try { req = JSON.parse(line); } catch { return; }

  const { id, method, params } = req;

  if (method === 'initialize') {
    send({ jsonrpc: '2.0', id, result: {
      protocolVersion: '2024-11-05',
      capabilities: { tools: {} },
      serverInfo: { name: 'searxng', version: '1.0.0' }
    }});
  } else if (method === 'notifications/initialized') {
    // no-op
  } else if (method === 'tools/list') {
    send({ jsonrpc: '2.0', id, result: {
      tools: [{
        name: 'web_search',
        description: 'Search the web via SearXNG (searxng.aldervall.se)',
        inputSchema: {
          type: 'object',
          properties: {
            query: { type: 'string', description: 'Search query' },
            categories: {
              type: 'string',
              description: 'SearXNG category (general, images, news, etc.)',
              default: 'general'
            }
          },
          required: ['query']
        }
      }]
    }});
  } else if (method === 'tools/call') {
    const { name, arguments: args } = params;
    if (name === 'web_search') {
      try {
        const result = await search(args.query, args.categories);
        send({ jsonrpc: '2.0', id, result: { content: [{ type: 'text', text: result }] }});
      } catch (e) {
        send({ jsonrpc: '2.0', id, error: { code: -32603, message: e.message }});
      }
    } else {
      send({ jsonrpc: '2.0', id, error: { code: -32601, message: `Unknown tool: ${name}` }});
    }
  } else {
    if (id != null) {
      send({ jsonrpc: '2.0', id, error: { code: -32601, message: 'Method not found' }});
    }
  }
});
