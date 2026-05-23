---
name: humanize
description: "Rewrite AI-generated text to read like a human wrote it. Targets the structural tells of machine text: template phrasing, uniform sentence cadence, predictable word sequences, and mechanical transitions. Use when the user pastes AI text and wants it humanized, says 'make this sound human', 'rewrite this', 'humanize this', or invokes /humanize."
triggers:
  - "humanize this"
  - "make this sound human"
  - "rewrite this to sound human"
  - "this sounds too AI"
  - "/humanize"
user-invocable: true
argument-hint: "[--tone casual|formal|neutral] [--intensity light|deep] [--register technical|marketing|essay|email] [text or file]"
---

Rewrite AI-generated text so it reads as naturally human. Preserve all original meaning, facts, and the author's stated positions. Change structure, rhythm, word choice, and rhetorical patterns. Not what is said.

## Why AI Text Reads as AI

Two measurable signatures: **perplexity** (AI picks the statistically likely token; humans reach for the second-choice word, domain jargon, or a fresh image) and **burstiness** (AI produces uniform cadence; humans alternate fragments with sprawling clauses). Beyond metrics: template phrases, binary foil constructions, and predictable paragraph architecture. The rules below target each one.

---

## The Fourteen Rules

Apply every rule that triggers. They are cumulative.

### Rule 1 — Kill Template Phrases

Cut or replace on sight.

| Phrase | Action |
|--------|--------|
| it is important to note / it is worth noting / keep in mind | Drop; state the claim directly |
| in conclusion / to summarize / overall | Cut the signpost; write the conclusion |
| this is crucial / essential / vital | State WHY it matters |
| certainly / absolutely / of course | Cut |
| as an AI language model / I would be happy to / feel free to | Cut |
| in today's fast-paced world / in the ever-evolving landscape / in the world of / in the realm of | Cut entirely |
| when it comes to / navigate the complexities of | Cut; rewrite the sentence |
| embark on a journey | start, begin |
| at the heart of / stands as a testament to | be specific |
| underscores the importance of / plays a pivotal role | state why it matters |
| speaks volumes | say what it means |
| cutting-edge / state-of-the-art / game-changer / groundbreaking / revolutionary / transformative / paradigm shift | name the specific thing |
| rich tapestry / synergy | cut |
| ecosystem (outside biology/software) | market, network, scene |
| unlock the potential of / harness the power of / elevate / empower | be specific about how |
| journey (as metaphor) | cut the metaphor |
| utilize | use |
| leverage (verb) | use, apply, draw on |
| facilitate | help, enable, let |
| furthermore / moreover / additionally / in addition | also, and — or cut |
| a plethora of / a myriad of | many, dozens, countless |
| robust (outside engineering) | strong, reliable, solid |
| seamless / seamlessly | smooth, easy — or cut |
| comprehensive / holistic | full, complete — or list what it covers |
| vibrant (filler) | cut or name the specific quality |
| foster | grow, build, encourage, spark |
| delve into / dive deep into | explore, examine, dig into |
| ensure (overused) | make sure — or rewrite as active |
| stakeholders | name them: teams, customers, investors, users |
| actionable insights | name the action |
| best practices | name the practice |

### Rule 2 — Break the Binary Foil

Ban: "it is not X, it is Y" and all variants ("this isn't just about X, it's about Y," "not only X, but also Y," "more than X, it's Y"). Strip every instance. Assert Y directly. When the contrast matters, build it through a separate sentence that arrives at the distinction.

**Before:** *This isn't just a refactor. It's a rethink of how the module talks to the rest of the system.*
**After:** *The refactor changes how the module talks to the rest of the system. The team rewrote the internals; the boundary followed.*

### Rule 3 — Em-Dashes and Tricolons

**Em-dashes (—): banned.** No standard keyboard produces one; the character appears in prose only through software substitution or AI generation. Replace with a period, comma, semicolon, or colon depending on the relationship between the clauses.

**Rule of three:** Audit every tricolon. Humans use them, so keep some; break the pattern by using two items, four, or folding one item into a longer clause.

**Before:** *The system is fast, reliable, and scalable. It handles requests, queues jobs, and logs events — quickly, cleanly, and at scale.*
**After:** *The system handles thousands of requests per second without dropping any. Jobs queue cleanly. Logs land where they should.*

### Rule 4 — Break the Cadence (Burstiness)

Three or more consecutive sentences within five words of each other in length require restructuring. Target mix within a paragraph: at least one fragment under seven words, at least one sentence over twenty words with a subordinate clause, and varied lengths between them.

**Before:** *The system processes requests in real time. It handles many connections at once. Each request is logged for debugging. The response goes back to the client.*
**After:** *The system handles thousands of live connections at once. Every request logs on the way through, and the client receives a response before the next one lands. Fast. Sometimes too fast for the dashboards.*

### Rule 5 — Vary Sentence Openings

When more than half a paragraph's sentences open with the subject, rotate: time marker ("by the time the request lands"), condition ("if the cache is cold"), concession ("even when it works"), participle ("running on a single thread"), prepositional phrase ("under load, the buffer"), conjunction ("and that's the problem"), question ("why does this matter?").

Kill the **"While X, Y" opener** — an AI signature. Replace with "even though," "although," or two separate sentences.

### Rule 6 — Increase Lexical Surprise

Disrupt the most-probable next word. Swap generic verbs for specific ones: *said → admitted, conceded, blurted; showed → exposed, betrayed; helped → freed up, unblocked.* Trade abstract nouns for concrete images: "improves performance" → "cuts p99 from 800ms to 90ms." Add a number, named example, or measurable result where the source stays vague. One unexpected word per paragraph changes the texture.

### Rule 7 — Cut Hedging and False Balance

| Hedged | Direct |
|--------|--------|
| it seems that / it appears that | state it |
| it could be argued / one might say / some would argue | state the argument, or name who argues it |
| this may suggest | drop the qualifier |
| generally speaking / for the most part / in many cases | quantify or drop |
| it is generally accepted that | drop; make the claim |
| there are several factors / it depends on many factors | name the factors |

**False balance:** cut manufactured both-sides framing. Take the position the evidence supports.

### Rule 8 — Prefer Active Voice

Convert passive to active wherever an agent exists. Keep passive only when the agent is unknown, irrelevant, or foregrounded intentionally.

| Passive | Active |
|---------|--------|
| the request is processed by the server | the server processes the request |
| it was decided that | the team decided |
| mistakes were made | name who made them |
| the feature is utilized by users | users use the feature |

### Rule 9 — Restructure Lists

- **2 items:** fold into a sentence with "and" or "or"
- **3 items:** sentence with commas
- **4–6 items:** bullets; vary item length and opening word
- **7+ items:** use a table, or ask whether they're truly distinct

Break the AI bullet pattern of **bold noun + colon** (`**Performance:** the system...`). Open some bullets with a verb, some with a full sentence, some with a fragment.

### Rule 10 — Thin the Transitions

Cut on sight: *furthermore, moreover, additionally, as a result, consequently, therefore, thus, hence, subsequently, finally, in summary, to conclude, overall, ultimately, notably, importantly.*

Replace with a line break, a short declarative that implies the connection, a *this/that* reference to the prior idea, or nothing. Logic carries transitions; words marking them announce their absence.

### Rule 11 — Stop the Summary Echo

Two forms: (1) **opening echo** — restating the prompt before answering; (2) **closing echo** — ending a paragraph by paraphrasing the topic sentence. Cut both. End on the strongest concrete point. Trust the reader.

### Rule 12 — Cut Throat-Clearing

Cut: *"before we dive in," "it's helpful to understand that," "let's take a moment," "first, let's define," "to better understand X."*

Test: remove the first sentence of every paragraph. The paragraph is usually stronger without it.

### Rule 13 — Add Point of View

AI writes from nowhere. Humans write from somewhere. Inject — where the register allows — a clear stance, a preference, or an editorial aside. Even a single word ("regrettably," "oddly," "finally") grounds a paragraph in a perspective. For technical writing, POV is stated defaults and named tradeoffs: "use Postgres unless you have a specific reason not to."

### Rule 14 — Add One Authentic Imperfection Per Paragraph

Humans don't write in perfect parallel. Options:

- A fragment. Like this.
- A sentence that restarts at a new angle: "Or rather, what I mean is..."
- A parenthetical aside (even when it breaks flow)
- A sentence that runs a beat longer than strict editing would allow

One per paragraph. Discipline matters.

---

## Register Adjustments

| Register | Weight high | Weight low | Notes |
|---|---|---|---|
| Technical docs | Lexical precision (R6), active voice (R8) | List restructuring (R9) | Keep necessary jargon; cut decorative jargon. Code blocks, commands, signatures: untouchable. |
| Essays | Cadence (R4), point of view (R13) | Sentence length caps | Essay without stance is brochure. Concrete detail over abstraction. |
| Marketing | Template phrases (R1), binary foil (R2) | Fragments (R14) | One specific claim over ten hedged ones. Name outcomes and numbers. |
| Emails | Stated ask (R13), hedging (R7) | Formality | State the ask in sentence one or two. Single point per paragraph. Contractions on. |
| Default | All rules at standard intensity | — | Neutral register, contractions in moderation. |

---

## Process

1. **Read the full text.** Identify the 3–5 worst tells before touching anything.
2. **Delete pass first.** Cut 15–30% before rewriting a word: template phrases, throat-clearing, summary echoes, hedges, transition words. Most AI text improves from subtraction alone.
3. **Rewrite paragraphs as units.** Sentence-by-sentence edits leave AI syntax intact; rebuild rhythm from scratch.
4. **Run the checklist.** Verify each rule triggered or note why it didn't.
5. **Read aloud (mentally).** Where you stumble, fix. Two-read sentences: simplify or split.
6. **Preserve facts exactly.** Never change what is asserted — only how.

## Output Format

1. The rewritten text in a fenced code block (or markdown block if the source was markdown), ready to copy.
2. **What changed** — 3–6 bullets naming specific transforms: *"Cut 9 template phrases, 2 binary foil constructions. Folded two 3-item lists into prose. Broke uniform cadence in paragraphs 2 and 4. Added POV in opening."*

### Intensity Modes

- **light:** Rules 1, 3, 4. Leave structure intact.
- **default:** All fourteen rules at standard application.
- **deep:** Restructure at the paragraph level, bolder lexical choices, stronger POV, more imperfection.

---

## Constraints

**Never change:** proper nouns, brand names, code, commands, file paths, URLs, function signatures, numbers, dates, citations, quotations, the author's stated opinions, technical definitions, legal language, the original language.

**Never do:** add slang that doesn't fit the register; introduce factual errors in pursuit of voice; flip register without instruction; add ironic asides to formal documents; fake emotion the author didn't signal; replace one cliché with another ("leverage" → "harness" is no improvement); make changes unjustifiable against a specific rule.

---

## Quick-Reference Checklist

- [ ] No template phrases or buzzwords (Rule 1)
- [ ] No binary foil constructions (Rule 2)
- [ ] No em-dashes; tricolons varied (Rule 3)
- [ ] No three consecutive sentences within 5 words of each other (Rule 4)
- [ ] Sentence openings varied; no "While X, Y" openers (Rule 5)
- [ ] At least one specific word, number, or concrete image per paragraph (Rule 6)
- [ ] No hedging phrases; no false balance (Rule 7)
- [ ] Passive converted to active wherever an agent exists (Rule 8)
- [ ] 2–3 item lists folded into prose; 7+ into a table (Rule 9)
- [ ] Transition words gone or replaced (Rule 10)
- [ ] No opening or closing summary echoes (Rule 11)
- [ ] No throat-clearing preamble (Rule 12)
- [ ] POV present: a stance, preference, or perspective grounds the text (Rule 13)
- [ ] One authentic variation per paragraph (Rule 14)
- [ ] Tense and person consistent throughout
- [ ] All original facts, numbers, names, citations, and positions preserved exactly
