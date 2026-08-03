# Tema inicial e faixa de navegação

## Objetivo

Fazer o site abrir em tema claro na primeira visita, continuar a recordar a escolha feita pelo visitante e adaptar a faixa de navegação ao tema ativo.

## Comportamento aprovado

- Se ainda não existir uma preferência guardada, iniciar o site em tema claro.
- Depois de o visitante alternar o tema, guardar a escolha no navegador.
- Nas visitas seguintes, restaurar a última escolha guardada.
- Manter o botão atual de alternância entre os temas claro e escuro.

## Aparência da faixa

- No tema claro, usar uma faixa clara translúcida, texto e ícones escuros e uma borda inferior discreta.
- No tema escuro, manter a faixa escura translúcida, texto e ícones claros e a borda inferior adequada ao fundo escuro.
- Ao fazer scroll, aumentar ligeiramente a opacidade da faixa sem mudar o tema.
- Manter o verde da marca nos estados ativos e interativos.

## Compatibilidade

- Não alterar o conteúdo, a estrutura do menu, o hero, os formulários ou outras páginas.
- Preservar os comportamentos atuais de desktop e mobile.
- Evitar uma apresentação inicial em tema escuro antes de o JavaScript aplicar o tema guardado.

## Verificação

- Sem preferência guardada, confirmar que a página abre em tema claro.
- Alternar para escuro, recarregar e confirmar que o tema escuro é restaurado.
- Alternar para claro, recarregar e confirmar que o tema claro é restaurado.
- Confirmar cores, contraste e estado após scroll da faixa nos dois temas.
- Confirmar que o menu mobile e o botão de tema continuam funcionais.
