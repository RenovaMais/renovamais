---
name: renovamais-website
version: 1.0.0
description: Skill mestre para construção e manutenção do site institucional da Renova+ (RenovaMais Alves Melo, Lda.) — empresa de construção, renovação e reabilitação no distrito de Lisboa, Portugal. Usar sempre que se criar, editar ou expandir qualquer ficheiro do site.
author: Alex Alves Melo
language: pt-PT
stack: HTML5 / CSS3 / JavaScript (Vanilla) — sem frameworks
deploy: Vercel
domain: renovamais.pt
---

# SKILL MESTRE — SITE RENOVA+

> Esta skill define TUDO o que o Claude Code precisa de saber para construir e manter o site da Renova+. Nunca inicies trabalho no projeto sem ler esta skill na íntegra. Cada secção é obrigatória.

---

## 1. IDENTIDADE DA EMPRESA

| Campo | Valor |
|---|---|
| Nome comercial | Renova+ |
| Nome legal | RenovaMais Alves Melo, Lda. (em incorporação) |
| Tagline | Renovação Que Transforma |
| Setor | Construção Civil, Renovação e Reabilitação |
| Zona de atuação | Distrito de Lisboa — Lisboa, Sintra, Cascais, Oeiras, Loures, Amadora, Setúbal |
| Público-alvo principal | Proprietários de imóveis (residencial), investidores imobiliários, clientes expat/estrangeiros em Portugal |
| Tom de voz | Profissional, direto, confiante, sem exageros. PT-PT correto. Nunca usar "você" — usar "si" ou construções impessoais. |
| Proposta de valor | Equipa especializada, prazos cumpridos, orçamento transparente, qualidade comprovada em Lisboa |

---

## 2. BRAND IDENTITY — REGRAS ABSOLUTAS

### 2.1 Paleta de Cores

```css
:root {
  /* Primárias */
  --color-lime:     #A8FF00;   /* Verde lima — acento principal, CTAs, destaques */
  --color-black:    #0D0D0D;   /* Fundo principal dark */
  --color-dark:     #1A1A1A;   /* Cards, secções alternadas */
  --color-white:    #FFFFFF;   /* Texto principal sobre fundo escuro */

  /* Secundárias */
  --color-gray-1:   #2A2A2A;   /* Bordas, separadores */
  --color-gray-2:   #4A4A4A;   /* Texto secundário */
  --color-gray-3:   #8A8A8A;   /* Placeholders, legendas */
  --color-lime-dark:#6FAB00;   /* Estado hover dos elementos lima */
  --color-lime-glow:rgba(168,255,0,0.15); /* Glow/halo nos elementos de destaque */

  /* Gradientes */
  --gradient-lime:  linear-gradient(135deg, #A8FF00 0%, #6FAB00 100%);
  --gradient-dark:  linear-gradient(180deg, #0D0D0D 0%, #1A1A1A 100%);
  --gradient-hero:  linear-gradient(135deg, #0D0D0D 60%, #1a2a00 100%);
}
```

**REGRAS DE USO:**
- Fundo do site: sempre `--color-black` ou `--color-dark`
- NUNCA fundo branco como tema principal — o site é dark-first
- `--color-lime` APENAS para: CTAs primários, ícones de destaque, hover states, underlines de secção, badges
- Texto corrido: `--color-white`
- Texto secundário/subtítulos: `--color-gray-3`
- NUNCA usar o lima em blocos de texto corrido — só em elementos de UI pontuais

### 2.2 Tipografia

```css
/* Import obrigatório no <head> de todos os ficheiros */
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;600;700;900&family=Montserrat:wght@400;500;600;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

:root {
  --font-display:  'Exo 2', sans-serif;    /* Títulos H1, H2, nome da marca */
  --font-body:     'Montserrat', sans-serif; /* Corpo de texto, menus, botões */
  --font-light:    'Poppins', sans-serif;  /* Subtítulos, captions, notas */
}
```

**Hierarquia tipográfica:**
| Elemento | Font | Weight | Size (desktop) | Transform |
|---|---|---|---|---|
| H1 hero | Exo 2 | 900 | clamp(2.5rem, 5vw, 4rem) | uppercase |
| H2 secção | Exo 2 | 700 | clamp(1.8rem, 3vw, 2.5rem) | — |
| H3 card | Montserrat | 600 | 1.2rem | — |
| Body | Montserrat | 400 | 1rem / line-height 1.7 | — |
| Caption/label | Poppins | 300 | 0.85rem | uppercase + letter-spacing 2px |
| CTA botão | Montserrat | 700 | 1rem | uppercase |

### 2.3 Logo

O logótipo existe em duas versões:
- **Versão completa**: Símbolo R + "Renova+" + "RENOVAÇÃO QUE TRANSFORMA"
- **Versão ícone**: Apenas o símbolo R circular

**Regras de uso do logo:**
- Sempre sobre fundo escuro (`--color-black` ou `--color-dark`)
- Nunca comprimir, distorcer ou recolorir
- Espaço mínimo de proteção: 1× a altura da letra "R" em todos os lados
- No código, usar SVG inline ou PNG com fundo transparente
- Navbar: versão compacta (ícone + "Renova+"), SEM tagline
- Hero e footer: versão completa com tagline

### 2.4 Elementos Visuais de Marca

```css
/* Linha decorativa de marca (usada em títulos de secção) */
.section-line {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 8px;
}
.section-line::before,
.section-line::after {
  content: '';
  height: 2px;
  width: 40px;
  background: var(--gradient-lime);
}

/* Badge/pill de destaque */
.badge-lime {
  background: var(--color-lime-glow);
  border: 1px solid var(--color-lime);
  color: var(--color-lime);
  font-family: var(--font-light);
  font-size: 0.75rem;
  letter-spacing: 2px;
  text-transform: uppercase;
  padding: 4px 14px;
  border-radius: 100px;
}

/* Glow effect em elementos de destaque */
.glow-lime {
  box-shadow: 0 0 20px var(--color-lime-glow), 0 0 60px rgba(168,255,0,0.05);
}
```

---

## 3. STACK TÉCNICO

### 3.1 Estrutura de Ficheiros

```
renovamais/
├── index.html              ← Landing page principal (one-page)
├── assets/
│   ├── css/
│   │   ├── reset.css       ← CSS reset + box-sizing
│   │   ├── variables.css   ← Todas as CSS vars (cores, fontes, espaçamento)
│   │   ├── base.css        ← Estilos globais, tipografia base
│   │   ├── components.css  ← Componentes reutilizáveis (btn, card, badge)
│   │   ├── sections.css    ← Estilos das secções do site
│   │   └── responsive.css  ← Media queries (mobile-first)
│   ├── js/
│   │   ├── main.js         ← Inicialização, scroll, navbar
│   │   ├── animations.js   ← Intersection Observer + animações de entrada
│   │   ├── form.js         ← Validação e submissão do formulário
│   │   └── counter.js      ← Animação dos números de estatísticas
│   ├── images/
│   │   ├── logo/           ← SVG e PNG do logótipo
│   │   ├── portfolio/      ← Fotos antes/depois dos projetos
│   │   ├── team/           ← Fotos da equipa
│   │   └── og-image.jpg    ← Imagem Open Graph (1200×630px)
│   └── fonts/              ← Fontes locais (fallback offline)
├── robots.txt
├── sitemap.xml
├── llms.txt                ← Para crawlers AI (GEO 2026)
└── vercel.json             ← Configuração de deploy
```

### 3.2 HTML Boilerplate Obrigatório

Cada HTML deve começar EXATAMENTE assim:

```html
<!DOCTYPE html>
<html lang="pt-PT" dir="ltr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!-- SEO PRIMARY -->
  <title>{{PAGE_TITLE}} | Renova+ — Construção e Reabilitação em Lisboa</title>
  <meta name="description" content="{{META_DESCRIPTION}}">
  <meta name="keywords" content="remodelação Lisboa, reabilitação Lisboa, obras Lisboa, construção civil Lisboa, renovação casa Lisboa, Sintra, Cascais, Oeiras">
  <meta name="author" content="Renova+ — RenovaMais Alves Melo, Lda.">
  <meta name="robots" content="index, follow">
  <link rel="canonical" href="https://renovamais.pt/{{PAGE_PATH}}">

  <!-- GEO: AI Search Optimization 2026 -->
  <meta name="geo.region" content="PT-11">
  <meta name="geo.placename" content="Lisboa, Portugal">
  <meta name="geo.position" content="38.7169;-9.1399">
  <meta name="ICBM" content="38.7169, -9.1399">

  <!-- OPEN GRAPH -->
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://renovamais.pt/">
  <meta property="og:title" content="Renova+ | Construção e Reabilitação em Lisboa">
  <meta property="og:description" content="Especialistas em renovação, remodelação e reabilitação de imóveis no distrito de Lisboa. Orçamento gratuito.">
  <meta property="og:image" content="https://renovamais.pt/assets/images/og-image.jpg">
  <meta property="og:locale" content="pt_PT">
  <meta property="og:site_name" content="Renova+">

  <!-- TWITTER CARD -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="Renova+ | Construção e Reabilitação em Lisboa">
  <meta name="twitter:description" content="Especialistas em renovação e reabilitação. Lisboa, Sintra, Cascais, Oeiras.">
  <meta name="twitter:image" content="https://renovamais.pt/assets/images/og-image.jpg">

  <!-- SCHEMA MARKUP JSON-LD (obrigatório em todas as páginas) -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "HomeAndConstructionBusiness",
    "@id": "https://renovamais.pt/#business",
    "name": "Renova+",
    "legalName": "RenovaMais Alves Melo, Lda.",
    "description": "Empresa especializada em construção, renovação, remodelação e reabilitação de imóveis no distrito de Lisboa, Portugal.",
    "url": "https://renovamais.pt",
    "telephone": "+351-{{TELEFONE}}",
    "email": "geral@renovamais.pt",
    "foundingDate": "2026",
    "slogan": "Renovação Que Transforma",
    "image": "https://renovamais.pt/assets/images/og-image.jpg",
    "logo": "https://renovamais.pt/assets/images/logo/renova-logo.png",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Lisboa",
      "addressRegion": "Lisboa",
      "addressCountry": "PT"
    },
    "areaServed": [
      {"@type": "City", "name": "Lisboa"},
      {"@type": "City", "name": "Sintra"},
      {"@type": "City", "name": "Cascais"},
      {"@type": "City", "name": "Oeiras"},
      {"@type": "City", "name": "Loures"},
      {"@type": "City", "name": "Amadora"}
    ],
    "hasOfferCatalog": {
      "@type": "OfferCatalog",
      "name": "Serviços de Construção e Reabilitação",
      "itemListElement": [
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Remodelação de Interiores"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Reabilitação de Edifícios"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Obras de Construção Civil"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Renovação de Casas de Banho e Cozinhas"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Pintura e Acabamentos"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "Instalações Eléctricas e Canalizações"}},
        {"@type": "Offer", "itemOffered": {"@type": "Service", "name": "AVAC e Climatização"}}
      ]
    },
    "sameAs": [
      "https://www.instagram.com/renovamais.pt",
      "https://www.facebook.com/renovamais.pt"
    ]
  }
  </script>

  <!-- PERFORMANCE -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;600;700;900&family=Montserrat:wght@400;500;600;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

  <!-- FAVICON -->
  <link rel="icon" type="image/svg+xml" href="/assets/images/logo/favicon.svg">
  <link rel="apple-touch-icon" href="/assets/images/logo/apple-touch-icon.png">
  <meta name="theme-color" content="#0D0D0D">

  <!-- CSS -->
  <link rel="stylesheet" href="/assets/css/reset.css">
  <link rel="stylesheet" href="/assets/css/variables.css">
  <link rel="stylesheet" href="/assets/css/base.css">
  <link rel="stylesheet" href="/assets/css/components.css">
  <link rel="stylesheet" href="/assets/css/sections.css">
  <link rel="stylesheet" href="/assets/css/responsive.css">
</head>
```

---

## 4. ESTRUTURA DE PÁGINAS — LANDING PAGE PRINCIPAL

A `index.html` é uma one-page com âncoras. Ordem das secções:

```
#inicio     → Hero (acima da dobra)
#servicos   → Serviços (cards)
#sobre      → Sobre Nós + números/stats
#portfolio  → Portfólio Antes/Depois
#processo   → Como Trabalhamos (steps)
#depoimentos → Testemunhos de clientes
#contacto   → Formulário + mapa + WhatsApp
```

### 4.1 Navbar

```html
<!-- Comportamento: transparente no topo, dark+blur ao scrollar -->
<nav id="navbar" class="navbar">
  <div class="container navbar__inner">
    <a href="#inicio" class="navbar__logo">
      <!-- SVG do logótipo versão compacta -->
    </a>
    <ul class="navbar__links">
      <li><a href="#servicos">Serviços</a></li>
      <li><a href="#sobre">Sobre Nós</a></li>
      <li><a href="#portfolio">Portfolio</a></li>
      <li><a href="#processo">Como Trabalhamos</a></li>
      <li><a href="#depoimentos">Clientes</a></li>
    </ul>
    <a href="#contacto" class="btn btn--primary navbar__cta">Orçamento Gratuito</a>
    <button class="navbar__hamburger" aria-label="Menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</nav>
```

**CSS da navbar:**
```css
.navbar {
  position: fixed;
  top: 0; left: 0; right: 0;
  z-index: 1000;
  padding: 20px 0;
  transition: all 0.3s ease;
}
.navbar.scrolled {
  background: rgba(13,13,13,0.95);
  backdrop-filter: blur(20px);
  padding: 12px 0;
  border-bottom: 1px solid var(--color-gray-1);
}
```

### 4.2 Hero Section

**Objetivo:** Converter visitante em lead em menos de 5 segundos.

```html
<section id="inicio" class="hero">
  <div class="hero__bg">
    <!-- Imagem de fundo: obra real ou texture escura + overlay -->
    <!-- Overlay obrigatório: linear-gradient(135deg, rgba(13,13,13,0.92) 0%, rgba(13,13,13,0.75) 100%) -->
  </div>
  <div class="container hero__content">
    <span class="badge-lime animate-fade-up">Lisboa · Sintra · Cascais · Oeiras</span>
    <h1 class="hero__title animate-fade-up">
      Renovamos o Seu Imóvel.<br>
      <span class="text-lime">Do Projeto à Entrega.</span>
    </h1>
    <p class="hero__subtitle animate-fade-up">
      Construção, remodelação e reabilitação de imóveis no distrito de Lisboa.<br>
      Orçamento gratuito em 48 horas. Prazos cumpridos. Qualidade garantida.
    </p>
    <div class="hero__actions animate-fade-up">
      <a href="#contacto" class="btn btn--primary btn--large">
        Pedir Orçamento Gratuito
        <svg><!-- seta → --></svg>
      </a>
      <a href="#portfolio" class="btn btn--ghost btn--large">
        Ver os Nossos Projetos
      </a>
    </div>
    <div class="hero__trust animate-fade-up">
      <!-- 3 trust indicators: anos experiência, obras concluídas, satisfação -->
    </div>
  </div>
  <!-- Scroll indicator animado -->
  <div class="hero__scroll-indicator"></div>
</section>
```

**Trust indicators do hero:**
```
✓ +50 Obras Concluídas    ✓ Orçamento em 48h    ✓ Garantia de Satisfação
```

### 4.3 Secção de Serviços

**8 serviços principais** com ícone SVG, título e descrição curta:

| Serviço | Ícone | Keywords SEO |
|---|---|---|
| Remodelação de Interiores | casa+pincel | remodelação interiores Lisboa |
| Reabilitação de Edifícios | prédio+seta | reabilitação edifícios Lisboa |
| Casas de Banho | duche | renovação WC Lisboa |
| Cozinhas | fogão | remodelação cozinha Lisboa |
| Pintura e Acabamentos | rolo | pintura paredes Lisboa |
| Electricidade e Canalizações | raio+gota | electricista Lisboa |
| AVAC e Climatização | ar | instalação ar condicionado Lisboa |
| Obras Chave-na-Mão | chave | obra chave na mão Lisboa |

**Card de serviço:**
```html
<article class="service-card">
  <div class="service-card__icon"><!-- SVG --></div>
  <h3 class="service-card__title">{{NOME_SERVIÇO}}</h3>
  <p class="service-card__desc">{{DESCRIÇÃO_CURTA}}</p>
  <a href="#contacto" class="service-card__link">
    Saber mais <span>→</span>
  </a>
</article>
```

### 4.4 Secção Sobre Nós

Estrutura: texto à esquerda + stats + imagem à direita.

**Texto obrigatório:**
> "A Renova+ nasce da paixão por transformar espaços e pela crença de que cada obra é uma oportunidade de superar expectativas. Atuamos no distrito de Lisboa com uma equipa especializada, materiais de primeira qualidade e um compromisso total com o cliente — do primeiro contacto à entrega final da obra."

**4 Estatísticas animadas (counter.js):**
```
+50       +100       48h        100%
Obras     Clientes   Orçamento  Satisfação
```

### 4.5 Portfolio — Antes/Depois

**Componente slider antes/depois** com drag handle.

```html
<div class="portfolio-card">
  <div class="before-after">
    <div class="before-after__before">
      <img src="..." alt="Antes da renovação — {{LOCAL}}">
      <span class="before-after__label">Antes</span>
    </div>
    <div class="before-after__after">
      <img src="..." alt="Depois da renovação — {{LOCAL}}">
      <span class="before-after__label">Depois</span>
    </div>
    <input type="range" class="before-after__slider" min="0" max="100" value="50">
  </div>
  <div class="portfolio-card__info">
    <h3>{{TÍTULO_PROJETO}}</h3>
    <p>{{LOCALIZAÇÃO}} · {{TIPO_OBRA}}</p>
  </div>
</div>
```

### 4.6 Como Trabalhamos (Processo)

**5 passos com numeração e linha conectora:**

```
1. Contacto     → 2. Visita Técnica → 3. Proposta    → 4. Obra        → 5. Entrega
   Gratuito         Sem compromisso     Detalhada        Acompanhada       Com Garantia
   24-48h           1-3 dias            Orçamento fixo    Prazos claros     Satisfação total
```

### 4.7 Depoimentos

Grid de 3 cards. Cada depoimento:
```html
<blockquote class="testimonial-card">
  <div class="testimonial-card__stars">★★★★★</div>
  <p class="testimonial-card__text">"{{TEXTO_DEPOIMENTO}}"</p>
  <footer class="testimonial-card__author">
    <strong>{{NOME_CLIENTE}}</strong>
    <span>{{LOCALIZAÇÃO}} · {{TIPO_OBRA}}</span>
  </footer>
</blockquote>
```

**Schema de review a adicionar dinamicamente:**
```json
{
  "@type": "Review",
  "reviewRating": {"@type": "Rating", "ratingValue": "5"},
  "author": {"@type": "Person", "name": "{{NOME}}"},
  "reviewBody": "{{TEXTO}}"
}
```

### 4.8 Formulário de Contacto

**Campos obrigatórios:**
```html
<form id="contact-form" novalidate>
  <div class="form-group">
    <label for="nome">Nome completo *</label>
    <input type="text" id="nome" name="nome" required autocomplete="name"
           placeholder="O seu nome">
  </div>
  <div class="form-group">
    <label for="telefone">Telemóvel *</label>
    <input type="tel" id="telefone" name="telefone" required autocomplete="tel"
           placeholder="+351 9XX XXX XXX">
  </div>
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" autocomplete="email"
           placeholder="email@exemplo.com">
  </div>
  <div class="form-group">
    <label for="localidade">Localidade da Obra *</label>
    <select id="localidade" name="localidade" required>
      <option value="">Selecione a localidade</option>
      <option>Lisboa</option>
      <option>Sintra</option>
      <option>Cascais</option>
      <option>Oeiras</option>
      <option>Loures</option>
      <option>Amadora</option>
      <option>Outra (Distrito Lisboa)</option>
    </select>
  </div>
  <div class="form-group">
    <label for="servico">Tipo de Obra *</label>
    <select id="servico" name="servico" required>
      <option value="">Selecione o tipo de obra</option>
      <option>Remodelação de Interiores</option>
      <option>Reabilitação de Edifício</option>
      <option>Casa de Banho</option>
      <option>Cozinha</option>
      <option>Pintura e Acabamentos</option>
      <option>Electricidade / Canalizações</option>
      <option>AVAC / Climatização</option>
      <option>Obra Chave-na-Mão</option>
      <option>Outro</option>
    </select>
  </div>
  <div class="form-group form-group--full">
    <label for="mensagem">Descrição do projeto</label>
    <textarea id="mensagem" name="mensagem" rows="4"
              placeholder="Descreva brevemente a sua obra..."></textarea>
  </div>
  <div class="form-group form-group--full">
    <label class="checkbox-label">
      <input type="checkbox" name="rgpd" required>
      Concordo com a <a href="/politica-privacidade.html">Política de Privacidade</a> *
    </label>
  </div>
  <button type="submit" class="btn btn--primary btn--large btn--full">
    Pedir Orçamento Gratuito
  </button>
</form>
```

**Submissão:** O formulário envia via `fetch()` para um endpoint Formspree (`https://formspree.io/f/{{ID}}`). Sem backend próprio na v1.

### 4.9 Footer

```html
<footer class="footer">
  <div class="container footer__grid">
    <!-- Col 1: Logo + tagline + redes -->
    <!-- Col 2: Serviços (lista de links âncora) -->
    <!-- Col 3: Zona de atuação -->
    <!-- Col 4: Contactos -->
  </div>
  <div class="footer__bottom">
    <p>© 2026 Renova+ · RenovaMais Alves Melo, Lda. · Todos os direitos reservados</p>
    <p>Construção e Reabilitação em Lisboa · renovamais.pt</p>
  </div>
</footer>
```

---

## 5. COMPONENTES REUTILIZÁVEIS

### 5.1 Botões

```css
.btn {
  font-family: var(--font-body);
  font-weight: 700;
  font-size: 0.95rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  padding: 14px 32px;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.25s ease;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
}

/* Primário: lima sólido */
.btn--primary {
  background: var(--color-lime);
  color: var(--color-black);
  border: 2px solid var(--color-lime);
}
.btn--primary:hover {
  background: var(--color-lime-dark);
  border-color: var(--color-lime-dark);
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(168,255,0,0.3);
}

/* Ghost: transparente com borda lima */
.btn--ghost {
  background: transparent;
  color: var(--color-white);
  border: 2px solid rgba(255,255,255,0.3);
}
.btn--ghost:hover {
  border-color: var(--color-lime);
  color: var(--color-lime);
}

/* Tamanhos */
.btn--large  { padding: 18px 40px; font-size: 1rem; }
.btn--small  { padding: 10px 20px; font-size: 0.85rem; }
.btn--full   { width: 100%; justify-content: center; }
```

### 5.2 Botão Flutuante WhatsApp

```html
<!-- Sempre presente, em todas as páginas, canto inferior direito -->
<a href="https://wa.me/351{{NUMERO_WHATSAPP}}?text=Olá%2C%20gostaria%20de%20pedir%20um%20orçamento."
   class="whatsapp-float"
   target="_blank"
   rel="noopener noreferrer"
   aria-label="Contactar via WhatsApp">
  <svg><!-- ícone WhatsApp --></svg>
  <span class="whatsapp-float__pulse"></span>
</a>
```

```css
.whatsapp-float {
  position: fixed;
  bottom: 30px;
  right: 30px;
  z-index: 999;
  width: 60px;
  height: 60px;
  background: #25D366;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 20px rgba(37,211,102,0.4);
  transition: transform 0.2s ease;
}
.whatsapp-float:hover { transform: scale(1.1); }

/* Pulse animado */
.whatsapp-float__pulse {
  position: absolute;
  width: 100%; height: 100%;
  border-radius: 50%;
  background: rgba(37,211,102,0.3);
  animation: pulse-whatsapp 2s infinite;
}
@keyframes pulse-whatsapp {
  0%   { transform: scale(1); opacity: 0.8; }
  100% { transform: scale(1.8); opacity: 0; }
}
```

### 5.3 Section Header Padrão

```html
<header class="section-header">
  <div class="section-line">
    <span class="badge-lime">{{LABEL_CURTO}}</span>
  </div>
  <h2 class="section-header__title">{{TÍTULO_PRINCIPAL}}</h2>
  <p class="section-header__sub">{{SUBTÍTULO_OPCIONAL}}</p>
</header>
```

---

## 6. ANIMAÇÕES E INTERATIVIDADE

### 6.1 Animações de Entrada (Intersection Observer)

```javascript
// animations.js — aplicar a TODOS os elementos com data-animate
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.15 });

document.querySelectorAll('[data-animate]').forEach(el => observer.observe(el));
```

```css
[data-animate] {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.6s ease, transform 0.6s ease;
}
[data-animate].is-visible {
  opacity: 1;
  transform: translateY(0);
}
/* Delays escalonados */
[data-animate-delay="1"] { transition-delay: 0.1s; }
[data-animate-delay="2"] { transition-delay: 0.2s; }
[data-animate-delay="3"] { transition-delay: 0.3s; }
```

### 6.2 Contador de Estatísticas

```javascript
// counter.js — ativa quando a secção fica visível
function animateCounter(el) {
  const target = parseInt(el.dataset.target);
  const duration = 2000;
  const step = target / (duration / 16);
  let current = 0;
  const timer = setInterval(() => {
    current += step;
    if (current >= target) { current = target; clearInterval(timer); }
    el.textContent = Math.floor(current) + (el.dataset.suffix || '');
  }, 16);
}
```

### 6.3 Navbar Scroll Behavior

```javascript
// main.js
window.addEventListener('scroll', () => {
  const navbar = document.getElementById('navbar');
  navbar.classList.toggle('scrolled', window.scrollY > 50);
});
```

---

## 7. RESPONSIVE / MOBILE-FIRST

### 7.1 Breakpoints

```css
/* Mobile first — escrever CSS base para mobile, depois expandir */
:root {
  --bp-sm:  480px;
  --bp-md:  768px;
  --bp-lg:  1024px;
  --bp-xl:  1280px;
  --bp-2xl: 1536px;
}

/* Container */
.container {
  width: 100%;
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 20px;
}
@media (min-width: 768px)  { .container { padding: 0 40px; } }
@media (min-width: 1280px) { .container { padding: 0 60px; } }
```

### 7.2 Regras Mobile Obrigatórias

- Menu hambúrguer abaixo de 768px
- Botão WhatsApp sempre visível (não esconder em mobile)
- Formulário: campos em coluna única em mobile
- Hero: h1 nunca abaixo de 2rem; CTA buttons em coluna
- Cards serviços: 1 col mobile → 2 col tablet → 4 col desktop
- Portfolio: 1 col mobile → 2 col desktop
- Touch targets mínimos: 44×44px
- Font-size mínimo: 16px (evita zoom automático iOS)

---

## 8. SEO AVANÇADO

### 8.1 Keywords por Secção

| Secção | Keyword Principal | Keywords Secundárias |
|---|---|---|
| Hero | construção civil Lisboa | renovação casa Lisboa, obras Lisboa |
| Serviços | remodelação interiores Lisboa | reabilitação edifícios Lisboa, obras banheiro Lisboa |
| Sobre | empresa construção Lisboa | empresa remodelação Lisboa, construtora Lisboa |
| Portfolio | obras antes depois Lisboa | remodelação fotos Lisboa |
| Contacto | orçamento obras Lisboa | pedido orçamento remodelação Lisboa grátis |

### 8.2 robots.txt

```
User-agent: *
Allow: /
Disallow: /obrigado.html
Sitemap: https://renovamais.pt/sitemap.xml
```

### 8.3 sitemap.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://renovamais.pt/</loc>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
```

### 8.4 llms.txt (GEO 2026 — crawlers AI)

```
# Renova+
> Empresa de construção, renovação e reabilitação no distrito de Lisboa, Portugal.

## Serviços principais
- Remodelação de interiores
- Reabilitação de edifícios
- Obras chave-na-mão
- AVAC e climatização
- Electricidade e canalizações

## Zona de atuação
Lisboa, Sintra, Cascais, Oeiras, Loures, Amadora

## Contacto
- Website: https://renovamais.pt
- Email: geral@renovamais.pt
- WhatsApp: +351 {{NUMERO}}
```

---

## 9. PERFORMANCE

### 9.1 Regras de Imagem

- Formato: **WebP** para todas as imagens (com fallback JPG via `<picture>`)
- Portfolio: máx. 800×600px, qualidade 80%
- Hero background: máx. 1920×1080px, qualidade 75%
- `loading="lazy"` em TODAS as imagens abaixo da dobra
- `loading="eager"` APENAS no logo e hero image
- `alt` obrigatório e descritivo em todas as imagens

```html
<picture>
  <source srcset="obra.webp" type="image/webp">
  <img src="obra.jpg" alt="Remodelação de casa de banho em Lisboa — Renova+"
       loading="lazy" width="800" height="600">
</picture>
```

### 9.2 CSS / JS

- CSS crítico (acima da dobra) inline no `<head>`
- JS no final do `<body>` com `defer`
- Sem jQuery, sem Bootstrap, sem frameworks pesadas
- CSS total < 50KB gzipped
- JS total < 30KB gzipped

### 9.3 vercel.json

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "X-Content-Type-Options", "value": "nosniff" },
        { "key": "X-Frame-Options", "value": "DENY" },
        { "key": "X-XSS-Protection", "value": "1; mode=block" },
        { "key": "Referrer-Policy", "value": "strict-origin-when-cross-origin" }
      ]
    },
    {
      "source": "/assets/(.*)",
      "headers": [
        { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
      ]
    }
  ]
}
```

---

## 10. ACESSIBILIDADE (WCAG 2.1 AA)

- Contraste mínimo: texto branco sobre `#0D0D0D` = ✓ (passe automático)
- `#A8FF00` sobre `#0D0D0D` = ratio 9.8:1 = ✓ AA+
- `aria-label` em todos os botões sem texto visível
- `role="navigation"` na `<nav>`
- Skip link no início do body: `<a href="#main" class="skip-link">Ir para o conteúdo</a>`
- Focus visible em todos os elementos interativos
- Formulário: `<label>` explícito para cada campo

---

## 11. DEPLOY — CHECKLIST PRÉ-LANÇAMENTO

Antes de fazer deploy no Vercel, verificar obrigatoriamente:

- [ ] Title tag única em cada página
- [ ] Meta description entre 150-160 caracteres
- [ ] Schema JSON-LD válido (testar em https://validator.schema.org)
- [ ] Open Graph image 1200×630px presente
- [ ] robots.txt acessível
- [ ] sitemap.xml acessível e com URLs corretas
- [ ] Todas as imagens com `alt` text
- [ ] Formulário testado (submissão real para Formspree)
- [ ] WhatsApp link com número correto
- [ ] Mobile: testar em 375px, 414px, 768px
- [ ] PageSpeed Insights: score > 90 mobile, > 95 desktop
- [ ] Ligar domínio renovamais.pt no painel Vercel
- [ ] HTTPS ativo (automático no Vercel)
- [ ] Criar ficha Google Business Profile após go-live

---

## 12. CONTEÚDO — TOM DE VOZ E REGRAS DE ESCRITA

- **Idioma:** Português de Portugal (PT-PT) — NUNCA PT-BR
- **Pronomes:** "si", "seu", "sua" — NUNCA "você"
- **Verbos:** conjugação europeia — "têm", "são", "estão"
- **Tom:** confiante e profissional, SEM exageros nem superlativos vazios
- **CTAs:** diretos e com benefício — "Pedir Orçamento Gratuito", "Ver os Nossos Projetos", "Fale Connosco"
- **EVITAR:** "somos os melhores", "empresa líder", "a mais conceituada" — sem prova
- **USAR:** factos concretos — "mais de 50 obras concluídas", "orçamento em 48 horas", "garantia de satisfação"
- **Urgência suave:** "Orçamento gratuito e sem compromisso" > "Contacte-nos hoje!"

---

## 13. REGRAS DO CLAUDE CODE PARA ESTE PROJETO

1. **Sempre consultar esta skill** antes de qualquer ficheiro novo ou edição
2. **Nunca alterar a paleta** sem confirmação explícita de Alex
3. **Nunca mudar para PT-BR** — o site é para Portugal
4. **Mobile-first sempre** — CSS base é para 375px, depois expande
5. **Zero frameworks externas** — HTML/CSS/JS puro
6. **Comentários em PT-PT** nos ficheiros de código
7. **Quando adicionar um serviço** ao portfólio, atualizar também o Schema JSON-LD
8. **Imagens placeholder:** usar `https://placehold.co/800x600/1A1A1A/A8FF00?text=Foto+Obra` enquanto não houver fotos reais
9. **Formspree ID:** substituir `{{ID}}` quando Alex fornecer
10. **Número de telefone/WhatsApp:** substituir `{{TELEFONE}}` / `{{NUMERO_WHATSAPP}}` quando Alex confirmar
