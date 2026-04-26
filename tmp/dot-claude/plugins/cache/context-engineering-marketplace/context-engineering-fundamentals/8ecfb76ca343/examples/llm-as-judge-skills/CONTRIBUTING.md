---
title: CONTRIBUTING
type: note
permalink: claude/tmp/dot-claude/plugins/cache/context-engineering-marketplace/context-engineering-fundamentals/8ecfb76ca343/examples/llm-as-judge-skills/contributing
---

# Contributing to LLM-as-a-Judge Skills

Thank you for your interest in contributing! This project is part of the [Agent Skills for Context Engineering](https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering) ecosystem.

## How to Contribute

### Reporting Issues

- Check existing issues first
- Provide clear reproduction steps
- Include test output if applicable

### Adding New Tools

1. **Create the implementation** in `src/tools/<category>/<tool-name>.ts`

   - Define input/output Zod schemas
   - Implement execute function with error handling
   - Include proper TypeScript types

1. **Export from index** in `src/tools/<category>/index.ts`

1. **Add documentation** in `tools/<category>/<tool-name>.md`

   - Purpose and when to use
   - Input/output specifications
   - Example usage

1. **Write tests** in `tests/`

   - Unit tests for schema validation
   - Integration tests with real API calls

### Code Style

- Run `npm run lint` before committing
- Run `npm run format` for consistent formatting
- Use TypeScript strict mode
- Add JSDoc comments for public APIs

### Pull Request Process

1. Fork the repository
1. Create a feature branch: `git checkout -b feature/my-feature`
1. Make your changes
1. Run tests: `npm test`
1. Commit: `git commit -m 'Add my feature'`
1. Push: `git push origin feature/my-feature`
1. Open a Pull Request

### Testing Guidelines

- Tests run against real OpenAI API (requires API key)
- Use `60000ms` timeout for single API calls
- Use `120000ms` timeout for multiple API calls
- Tests should be deterministic despite LLM variance

## Development Setup

```bash
# Clone
git clone https://github.com/muratcankoylan/llm-as-judge-skills.git
cd llm-as-judge-skills

# Install
npm install

# Configure
cp env.example .env
# Add your OPENAI_API_KEY to .env

# Build
npm run build

# Test
npm test
```

## Questions?

Open an issue or reach out via the main repository.
