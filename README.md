# Chá Revelação — Contador

Pequena página com contagem regressiva e imagem para usar em desktop e celular.

Arquivos principais
- `cha_revelacao.html` — página principal (contém a imagem embutida como data URI e referência ao `gravida.jpeg`).
- `gravida.jpeg` — imagem original (mantida no repositório).
- `gravida.b64.txt` — arquivo com a string base64 (opcional).

Como abrir no computador (desktop)
- Abrir diretamente: dê duplo-clique em `cha_revelacao.html` ou abra no navegador com `File > Open`.
- Servir via servidor local (recomendado para visualização por outros dispositivos na mesma rede):

  PowerShell (tem que ter Python instalado):

  ```powershell
  cd "c:\Users\Bea\Documents\ContagemChaRevelacao"
  python -m http.server 8000
  ```

  Em seguida abra no navegador: `http://localhost:8000/cha_revelacao.html`.

Como abrir no celular (Android / iPhone)
Opção A — copiar os arquivos para o celular
- Copie a pasta inteira `ContagemChaRevelacao` para o armazenamento do celular (via cabo USB ou transferir zip).
- No celular, abra o arquivo `cha_revelacao.html` com o navegador (geralmente o gerenciador de arquivos permite abrir com o Chrome/Safari).

Opção B — enviar por WhatsApp ou e-mail
- Envie o arquivo `cha_revelacao.html` por WhatsApp/Email (ou um ZIP com a pasta). Alguns previews podem não carregar imagens externas, mas como a imagem já está embutida no HTML (data URI), ela deve aparecer no preview e ao abrir o arquivo.

Opção C — servir no PC e acessar pelo celular (melhor experiência)
1. No PC, rode:

```powershell
cd "c:\Users\Bea\Documents\ContagemChaRevelacao"
python -m http.server 8000
```

2. Descubra o IP do seu PC na rede (no PowerShell):

```powershell
ipconfig
```

3. No celular (conectado à mesma rede Wi‑Fi), abra no navegador:

```
http://<IP-do-PC>:8000/cha_revelacao.html
```

Exemplo: `http://192.168.0.10:8000/cha_revelacao.html`.

Opção D — usar GitHub Pages
- No repositório GitHub (`laynnebeatriz/cha-revelacao-contador`) ative GitHub Pages nas configurações (`Settings > Pages`) apontando a branch `main` e a pasta `/` (root). Após alguns minutos, a página ficará disponível em `https://laynnebeatriz.github.io/cha-revelacao-contador/cha_revelacao.html`.

Observações importantes
- Você pediu para manter as imagens no repositório — `gravida.jpeg` e `gravida.b64.txt` permaneceram lá. Como a imagem também está embutida em `cha_revelacao.html`, a visualização funcionará em previews e quando o HTML for aberto isoladamente.
- Se quiser reduzir o tamanho do repositório, podemos remover `gravida.b64.txt` (arquivo redundante). Diga se quer que eu remova.

Precisa de algo mais?
- Posso criar um pequeno script `serve.ps1` com os comandos para facilitar o start do servidor local.
- Posso ativar/instruir passo a passo a configuração do GitHub Pages para você.
- Posso limpar o repositório removendo apenas `gravida.b64.txt`.

---
Criado automaticamente para ajudar na visualização em celular e desktop.