MIME-Version: 1.0
From: wandyflowxx <notifications@github.com>
To: actions/starter-workflows <starter-workflows@noreply.github.com>
Date: Sat, 25 Oct 2025 08:44:32 -0700
Subject: Re: [actions/starter-workflows] Linkedin Pages update Verified  (PR #3085)
Message-ID: <actions/starter-workflows/pull/3085/c3446848945@github.com>
In-Reply-To: <actions/starter-workflows/pull/3085@github.com>
References: <actions/starter-workflows/pull/3085@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fcf05ff3fef_40ace110069645"; charset="UTF-8"

wandyflowxx left a comment (actions/starter-workflows#3085)

> ## Prerrequisitos
> * [x] Antes de enviar un nuevo flujo de trabajo, solicite unirse al Programa de socios tecnológicos de GitHub: [partner.github.com/apply]( https://partner.github.com/apply?partnershipType=Technology+Partner beIN Media Group [).](bein.com)
> 
> ### **Tenga en cuenta que, por el momento, solo aceptamos nuevos flujos de trabajo iniciales para el escaneo de código. Se admiten actualizaciones de los flujos de trabajo iniciales existentes.**
> ## Tareas
> **Para _todos_ los flujos de trabajo, el flujo de trabajo:**
> 
> * [x] Debe estar contenido en un `.yml`archivo cuyo nombre de archivo sea el idioma o la plataforma, en minúsculas [_(_](https://en.wikipedia.org/wiki/Kebab_case) por ejemplo, [`docker-image.yml`](https://github.com/actions/starter-workflows/blob/main/ci/docker-image.yml)). Los caracteres especiales deben eliminarse o reemplazarse por palabras según corresponda (por ejemplo, ".net" en lugar de ".NET").
> * [x] Se deben utilizar mayúsculas y minúsculas para los nombres de los flujos de trabajo y pasos (por ejemplo, "Ejecutar pruebas").
> * [x] Debe nombrarse _únicamente_ con el nombre del lenguaje o plataforma (por ejemplo, "Go", no "Go CI" o "Go Build").
> * [x] Se deben incluir comentarios en el flujo de trabajo para cualquier parte que no sea obvia o que pueda necesitar una aclaración.
> * [x] Se deben especificar [los permisos](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#modifying-the-permissions-for-the-github_token) con menos privilegios para `GITHUB_TOKEN`que el flujo de trabajo se ejecute correctamente.
> 
> **Para los flujos de trabajo _de CI_ , el flujo de trabajo:**
> 
> * [x] Debe conservarse en [el `ci`directorio](https://github.com/actions/starter-workflows/tree/main/ci) .
> * [x] Debe incluir un `ci/properties/*.properties.json`archivo coincidente (por ejemplo, [`ci/properties/docker-publish.properties.json`](https://github.com/actions/starter-workflows/blob/main/ci/properties/docker-publish.properties.json)).
> * [ ] Debería continuar `push`hacia `branches: [ $default-branch ]`y `pull_request`hacia `branches: [ $default-branch ]`.
> * [x] Los flujos de trabajo de empaquetado deben ejecutarse `release`con `types: [ created ]`.
> * [x] Los flujos de trabajo de publicación deben tener un nombre de archivo que sea el nombre del idioma o la plataforma, en minúsculas, seguido de "-publish" (por ejemplo, [`docker-publish.yml`](https://github.com/actions/starter-workflows/blob/main/ci/docker-publish.yml)).
> 
> **Para los flujos de trabajo _de escaneo de código_ , el flujo de trabajo:**
> 
> * [x] Debe conservarse en [el `code-scanning`directorio](https://github.com/actions/starter-workflows/tree/main/code-scanning) .
> * [x] Debe incluir un `code-scanning/properties/*.properties.json`archivo coincidente (por ejemplo, [`code-scanning/properties/codeql.properties.json`](https://github.com/actions/starter-workflows/blob/main/code-scanning/properties/codeql.properties.json)), con propiedades configuradas de la siguiente manera:
>   
>   * [x]  `name`:Nombre de la integración de escaneo de código.
>   * [x]  `creator`:Nombre de la organización/usuario que produce la integración de escaneo de código.
>   * [x]  `description`:Breve descripción de la integración de escaneo de código.
>   * [x]  `categories`:Matriz de idiomas admitidos por la integración de escaneo de código.
>   * [x]  `iconName`: Name of the SVG logo representing the Code Scanning integration. This SVG logo must be present in [the `icons` directory](https://github.com/actions/starter-workflows/tree/main/icons).
> * [x]  Should run on `push` to `branches: [ $default-branch, $protected-branches ]` and `pull_request` to `branches: [ $default-branch ]`. We also recommend a `schedule` trigger of `cron: $cron-weekly` (for example, [`codeql.yml`](https://github.com/actions/starter-workflows/blob/c59b62dee0eae1f9f368b7011cf05c2fc42cf084/code-scanning/codeql.yml#L14-L21)).
> 
> **Some general notes:**
> 
> * [x]  This workflow must _only_ use actions that are produced by GitHub, [in the `actions` organization](https://github.com/actions), **or**
> * [ ]  This workflow must _only_ use actions that are produced by the language or ecosystem that the workflow supports.  These actions must be [published to the GitHub Marketplace](https://github.com/marketplace?type=actions).  We require that these actions be referenced using the full 40 character hash of the action's commit instead of a tag.  Additionally, workflows must include the following comment at the top of the workflow file:
>   ```
>   # This workflow uses actions that are not certified by GitHub.
>   # They are provided by a third-party and are governed by
>   # separate terms of service, privacy policy, and support
>   # documentation.
>   ```
> * [x]  Automation and CI workflows should not send data to any 3rd party service except for the purposes of installing dependencies.
> * [x]  Automation and CI workflows cannot be dependent on a paid service or product.



> [mohammedameenk44@beinmediagroup.com](mailto:mohammedameenk44@beinmediagroup.com)



-- 
Reply to this email directly or view it on GitHub:
https://github.com/actions/starter-workflows/pull/3085#issuecomment-3446848945
You are receiving this because you are subscribed to this thread.

Message ID: <actions/starter-workflows/pull/3085/c3446848945@github.com>