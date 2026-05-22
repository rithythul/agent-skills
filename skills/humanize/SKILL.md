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

Rewrite AI-generated text so it reads as naturally human. Preserve all original meaning, facts, and the author's stated positions. Change structure, rhythm, word choice, and rhetorical patterns — not what is said.

## Why AI Text Reads as AI

Two measurable signatures:

**Perplexity** — how predictable each next word is given what came before. AI picks the statistically likely token. Humans reach for the second- or third-choice word, domain jargon, idiom, or a fresh image.

**Burstiness** — variance in sentence length and structure. AI produces uniform cadence. Humans alternate punchy fragments with sprawling clauses.

Beyond metrics, AI has identifiable rhetorical habits — recurring constructions, signature phrases, and predictable paragraph architecture. The rules below target each one.

---

## The Fourteen Rules

Apply every rule that triggers. They are cumulative — skipping any leaves fingerprints.

### Rule 1 — Kill Template Phrases

Replace or cut on sight.

| AI phrase | Replace with |
|-----------|-------------|
| It is important to note that | Drop entirely, or state the claim directly |
| It is worth noting / mentioning | Cut |
| Keep in mind that | Cut, or "Remember:" if needed |
| In conclusion / To summarize / Overall | Cut the signpost; write the conclusion |
| This is crucial / essential / vital | State WHY it matters instead |
| Certainly / Absolutely / Of course | Cut |
| As an AI language model | Cut |
| I would be happy to / Feel free to | Cut |
| Delve into / Dive deep into / Deep dive | Use: explore, examine, dig into, look at |
| Utilize | Use: use |
| Leverage (as a verb) | Use: use, apply, draw on, exploit |
| Facilitate | Use: help, enable, allow, let, make possible |
| Furthermore / Moreover / Additionally / In addition | Use: Also, And, On top of that — or cut |
| In today's fast-paced world | Cut entirely |
| In the ever-evolving landscape of | Cut |
| In the world of / In the realm of | Cut |
| When it comes to | Cut and rewrite the sentence |
| Navigate the complexities of | Use: handle, work through, deal with |
| Embark on a journey | Use: start, begin |
| At the heart of | Use: central to, the core of — or be specific |
| Stands as a testament to | Use: shows, proves, demonstrates |
| Underscores the importance of | Use: shows why X matters |
| Plays a pivotal / crucial role | Use: matters because, drives, decides |
| Speaks volumes | Cut and say what it means |
| A plethora of / A myriad of / Myriad | Use: many, dozens of, a flood of, countless |
| Cutting-edge / State-of-the-art | Use: new, recent, latest — or name the specific tech |
| Game-changer / Game-changing | Cut and explain what changes |
| Groundbreaking / Revolutionary / Transformative | Be specific about what it broke/changed |
| Paradigm shift | Cut or be specific |
| Robust (outside engineering) | Use: strong, reliable, solid, durable |
| Seamless / Seamlessly | Use: smooth, easy, frictionless — or cut |
| Comprehensive / Holistic | Use: full, complete — or list what it covers |
| Vibrant (as filler) | Cut or be specific (vibrant red? vibrant scene?) |
| Rich tapestry / Tapestry of | Cut the metaphor entirely |
| Synergy / Synergistic | Cut |
| Ecosystem (outside biology/software) | Use: market, network, scene |
| Foster (foster growth, foster innovation) | Use: grow, build, encourage, spark |
| Unlock the potential of / Harness the power of | Use: use, tap, put to work |
| Elevate / Empower | Be specific about how |
| Ensure (overused) | Use: make sure, guarantee — or rewrite to be active |
| Stakeholders | Name them: teams, customers, investors, users |
| Actionable insights | Name the action |
| Best practices | Name the practice |
| Journey (as metaphor for any process) | Cut the metaphor |

### Rule 2 — Break the "It's Not X, It's Y" Construction

The single most viral AI tell since 2024. Variants:

- "This isn't just about X. It's about Y."
- "It's not X — it's Y."
- "Not only X, but also Y."
- "More than X, it's Y."

Strip every instance. Replace with a direct assertion of Y. If the contrast genuinely matters, build it differently — through example, comparison, or a separate sentence that arrives at the distinction.

**Before:** *This isn't just a refactor — it's a rethink of how the module talks to the rest of the system.*
**After:** *The refactor changes how the module talks to the rest of the system. The internals got rewritten; so did the boundary.*

### Rule 3 — Limit Em-Dashes and Tricolons

**Em-dashes (—):** AI sprinkles them everywhere. Cap at one per paragraph, max two per page. Replace with periods, commas, parentheses, or colons. Keep them only where they earn their weight (sharp aside, dramatic pause).

**Rule of three:** AI cannot resist "X, Y, and Z" lists. Audit every tricolon. Keep some — humans use them too — but break the pattern by:
- Using two items instead of three
- Using four
- Folding one item into a longer clause
- Letting one example stand alone

**Before:** *The system is fast, reliable, and scalable. It handles requests, queues jobs, and logs events — quickly, cleanly, and at scale.*
**After:** *The system handles thousands of requests per second without dropping any. Jobs queue cleanly. Logs land where they should.*

### Rule 4 — Break the Cadence (Burstiness)

If three or more consecutive sentences in a paragraph fall within five words of each other in length, restructure. Mix:

- 3–6 word fragments
- 8–15 word standard sentences
- 20–35 word sentences with subordinate clauses
- Occasional 40+ word sentences that earn their length

**Before (uniform, ~12 words each):**
*The system processes requests in real time. It handles many connections at once. Each request is logged for debugging. The response goes back to the client.*

**After (bursty):**
*The system juggles thousands of live connections without batching or queuing — every request gets logged on the way through, and the client sees a response before the next one lands. Fast. Sometimes too fast for the dashboards.*

### Rule 5 — Vary Sentence Openings

AI opens with the subject. Audit a paragraph: if more than half its sentences start with the subject (often "The..." or "This..."), rotate.

- Time marker: *"By the time the request lands..."*
- Condition: *"If the cache is cold..."*
- Concession: *"Even when it works..."*
- Participle: *"Running on a single thread..."*
- Prepositional: *"Under load, the buffer..."*
- Conjunction: *"And that's the problem."*
- Question: *"Why does this matter?"*

Also kill the **"While X, Y" opener** — another AI signature. Replace with "Even though," "Although," or two separate sentences.

### Rule 6 — Increase Lexical Surprise

Disrupt the most-probable next word.

- Swap generic verbs for specific ones: *said → admitted, conceded, blurted*; *showed → exposed, betrayed*; *helped → let, freed up, unblocked*
- Trade abstract nouns for concrete images: *"improves performance" → "cuts p99 from 800ms to 90ms"*
- Add a number, named example, or measurable result where AI stays vague
- Reach for the second- or third-choice word occasionally — not wrong, just not the obvious one
- Use domain jargon where it fits naturally; don't strip it for clarity

This is the single biggest perplexity lever. One unexpected word per paragraph changes the texture.

### Rule 7 — Cut Hedging and False Balance

AI hedges to seem cautious. Strip it.

| Hedged | Direct |
|--------|--------|
| It seems that | State it |
| It could be argued that | State the argument |
| One might say / Some would argue | Say it, or name who argues it |
| This may suggest / It appears that | Drop the qualifier |
| Generally speaking / For the most part | Quantify or drop |
| In many cases / Often | Quantify if possible |
| It is generally accepted that | Drop; make the claim |
| There are several factors to consider | List them, or drop |
| It depends on many factors | Name the factors that matter |

**False balance:** AI presents "both sides" even when one side is obviously right or there is no real debate. Cut the manufactured balance. Take the position the evidence supports.

### Rule 8 — Prefer Active Voice; Quarantine the Passive

AI overuses passive voice because it lets the model avoid naming an agent. Convert passive to active wherever an agent exists.

| Passive | Active |
|---------|--------|
| The request is processed by the server | The server processes the request |
| It was decided that | We decided / The team decided |
| Mistakes were made | Name who made them, or own them |
| The feature is utilized by users | Users use the feature (and kill "utilize") |

Keep passive only when: the agent is unknown, irrelevant, or deliberately obscured for emphasis on the object.

### Rule 9 — Restructure Lists

AI bullet-points everything. Humans use prose more than they bullet.

- **2 items:** fold into a sentence with "and" or "or"
- **3 items:** sentence with commas, or em-dash aside
- **4–6 items:** bullets are fine; vary item length and opening word
- **7+ items:** ask whether they're really distinct, or whether a table works better

Bullet items themselves: AI starts each with a bolded noun + colon (`**Performance:** the system...`). Break this. Open some bullets with a verb, some with a full sentence, some with a fragment. Vary length wildly between items.

### Rule 10 — Thin the Transitions

Cut on sight: *Furthermore, Moreover, Additionally, In addition, As a result, Consequently, Therefore, Thus, Hence, Subsequently, Finally, In summary, To conclude, Overall, Ultimately, Notably, Importantly.*

Replace with: a line break, a short declarative that implies the connection, a *This*/*That* reference to the prior idea, or nothing — let logic carry the transition.

### Rule 11 — Stop the Summary Echo

AI restates. Two forms:

1. **Opening echo:** restating the prompt/question before answering. ("You asked about X. X is...") Cut.
2. **Closing echo:** ending a paragraph by paraphrasing the topic sentence. ("So, as we've seen, X is indeed Y.") Cut.

End paragraphs on the strongest concrete point. Don't recap. Trust the reader.

### Rule 12 — Cut Throat-Clearing and Over-Explanation

AI explains obvious things and pre-justifies what it's about to say.

Cut phrases like: *"Before we dive in..." "It's helpful to understand that..." "Let's take a moment to..." "First, let's define..."* (unless a definition is genuinely needed).

Cut explanations of why you're explaining: *"To better understand X, it helps to know Y, which is important because..."* — just say Y, then X.

If the reader already knows it from context, don't restate it. Aggressive cut: try removing the first sentence of every paragraph. Often the paragraph is stronger without it.

### Rule 13 — Add Point of View

AI writes from nowhere. Humans write from somewhere.

Inject — where the register allows — a clear stance, a preference, a small piece of opinion, an aside about what surprised the writer, what didn't work, what they'd do differently. Even a single editorial word (*regrettably, oddly, finally, surprisingly*) can ground a paragraph in a perspective.

For technical docs, POV looks like: stating tradeoffs as opinions ("Use Postgres unless you have a reason not to"), recommending defaults, flagging gotchas the author hit personally.

For essays/marketing: clearer first-person presence, opinions stated as opinions, specific examples instead of universal claims.

### Rule 14 — Add One Authentic Imperfection Per Paragraph

Humans don't write in perfect parallel. They:
- Begin a thought and finish it differently
- Drop in a parenthetical aside (even when it breaks flow)
- Restart a sentence at a new angle: "Or rather — what I mean is..."
- Let a sentence run a beat longer than strict editing would allow
- Use a one-word sentence. Like this.
- Trail off with a "..." when the ending is implied

One controlled imperfection per paragraph makes prose feel written, not generated. One — not three. Discipline matters.

---

## Register-Specific Strategy

The same nine rules apply, but emphasis shifts.

### Technical Documentation
- Keep precision; don't sacrifice accuracy for cadence
- Prefer active voice strongly (Rule 8 weighted high)
- POV (Rule 13) = stated defaults, opinions on tradeoffs, "use X unless..."
- Keep necessary jargon; cut decorative jargon
- Lists are often genuinely useful here — don't fold them aggressively
- Code blocks, commands, signatures: untouchable

### Essays / Long-form
- Burstiness (Rule 4) weighted high — varied rhythm carries the read
- POV (Rule 13) weighted highest — essay without stance is brochure
- Imperfection (Rule 14) more generous; voice can be looser
- Sensory and concrete detail in place of abstraction

### Marketing Copy
- Cut every cliché in Rule 1 — buyers are inoculated against AI-marketing tone
- Specific numbers, named customers, concrete outcomes
- Shorter sentences, more fragments
- One bold claim is worth ten hedged ones
- Avoid Rule 2's "not just X, it's Y" — it's the marketing-AI signature

### Emails
- Casual register by default unless context says otherwise
- Drop greetings/sign-offs to their minimum
- Single point per paragraph
- Contractions on; hedging off
- POV = the sender's actual ask, stated plainly in the first or second sentence

### Default (no register specified)
- Neutral register, contractions in moderation
- Apply all rules at standard intensity

---

## Process

1. **Read the full text.** Identify the 3–5 worst tells before touching anything. Note the dominant patterns (em-dashes everywhere? all subject-first openings? bullet-heavy?).
2. **Delete pass first.** Cut 15–30% before rewriting a single word. Template phrases, throat-clearing, summary echoes, hedges, transition words — all gone. Most AI text gets dramatically better from subtraction alone.
3. **Rewrite paragraphs as units, not sentences.** Sentence-by-sentence edits leave AI syntax intact. Rebuild each paragraph's rhythm from scratch.
4. **Run the checklist.** Verify each rule was applied or note why it didn't trigger.
5. **Read aloud (mentally).** Where you stumble, fix. Where a sentence needs two reads, simplify or split.
6. **Preserve facts, claims, and positions exactly.** Never change what is asserted — only how.

## Output Format

Present:

1. The rewritten text in a fenced code block (or markdown block if the source was markdown), ready to copy.
2. **What changed** — 3–6 bullets naming specific transforms. Example: *"Cut 9 template phrases, 4 em-dashes, 2 'not just X, it's Y' constructions. Folded two 3-item lists into prose. Broke uniform cadence in paragraphs 2 and 4. Added POV in opening (stated preference for Postgres)."*

### Intensity Modes

- **light:** fix template phrases (Rule 1), em-dashes (Rule 3), worst cadence problems (Rule 4). Leave structure intact.
- **default:** all fourteen rules at standard application.
- **deep:** restructure at the paragraph level, make bolder lexical choices, inject stronger POV, allow more imperfection.

## What NOT to Change

- Proper nouns, brand names, product names
- Code, commands, file paths, URLs, function signatures
- Numbers, dates, citations, quotations
- The author's stated opinions and conclusions
- Technical definitions requiring precise wording
- Legal/compliance language where exact phrasing matters
- The original language (don't translate)

## What NOT to Do

- Don't add slang that doesn't fit the register
- Don't introduce factual errors in pursuit of "voice"
- Don't flip casual to formal or vice versa unless asked
- Don't add ironic asides to formal documents
- Don't fake emotion or personality the author didn't signal
- Don't replace one cliché with another (replacing "leverage" with "harness" is no improvement)
- Don't make changes you can't justify against a specific rule

---

## Quick-Reference Checklist

Before marking done:

- [ ] No phrases from Rule 1 remain
- [ ] No "it's not X, it's Y" constructions (Rule 2)
- [ ] Em-dashes capped (≤1 per paragraph); tricolons broken up (Rule 3)
- [ ] No three consecutive sentences within 5 words of each other in length (Rule 4)
- [ ] Sentence openings varied; no "While X, Y" openers (Rule 5)
- [ ] At least one unexpected word choice per paragraph; concrete over abstract (Rule 6)
- [ ] No hedging phrases; no false balance (Rule 7)
- [ ] Passive converted to active wherever an agent exists (Rule 8)
- [ ] Lists of ≤3 items folded into prose; bullet openings varied (Rule 9)
- [ ] Transition words gone or replaced (Rule 10)
- [ ] No opening or closing summary echoes (Rule 11)
- [ ] No throat-clearing; no over-explaining the obvious (Rule 12)
- [ ] POV present: a stance, preference, or perspective grounds the text (Rule 13)
- [ ] One authentic imperfection per paragraph (Rule 14)
- [ ] Tense and person consistent throughout
- [ ] All original facts, numbers, names, and positions preserved exactly
