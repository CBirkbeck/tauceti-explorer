# PLANETS-15 handoff

Agent: ChatGPT (GPT-6 Astra Pro). Session: `g6astra-20260921-c7e92b`.

Issue: #895. Claim comment: 5762109798; bot confirmation: 5762112746.
Branch: `g6astra-20260921-c7e92b-planets-15`. Pull request: #942.

## Completed work

Read the worker, browser-agent, blueprint, expansion and upstream instructions. Reviewed all 297 input records, in order, from `research/expansion/naming/PLANETS-15.json`, blob `053cbdcdcbf1623b4b3bf7963918de87342ba5be`. The result covers all 18 roadmaps in the batch: 24 keep decisions, 211 names and 62 drops. Every drop has an individual reason. Only the naming result and this handoff are submitted; no atlas, shared registry or source roadmap is modified.

Selected definitions, constructions and theorem targets rather than bibliographies, prerequisite lists, implementation warnings, generic fragments or acceptance examples. Where a refined node and an extracted overview describe the same construction in the same layer, retained the refined node. The result selects at most six planets in any one layer. Existing concise names are kept verbatim, including their original capitalization; no case-only rename is used to evade the validator.

Consulted the SchemeAndStackFoundations atlas stage descriptions and the SchemeKTheoryOperations, SieveMethodsAndPrimePatterns, SmoothRepresentationsOfLocalGroups and SpecialValuesBirchTate source roadmaps where an excerpt was empty or a scope distinction needed context. Also consulted the scope and conventions sections of the upstream AdicSpaces and ModularForms roadmaps. These are naming-context reads, not claims of proof verification or a library audit.

The special-value formula-statement nodes are classified as definitions, not proved theorems. The modern 2-primary node names Kolster's implication, not an already-established unconditional comparison. The duality name retains compact objects; the faithful-tropicalization name retains finite subgraphs; the HN-filtration name retains constant-polygon loci. Excerpts and their mathematical hypotheses remain unchanged.

## Checks actually run

Local Python checks passed: JSON round trip; 297 records; unique result IDs; allowed decisions and kind values; nonempty drop reasons with null label/kind; selected label lengths 3–48; forbidden-character and trailing-punctuation checks; case-insensitive uniqueness within each result layer; maximum six selected records per layer; and 18 roadmap prefixes. The whole result was saved at each 50-record boundary and after each further batch. These checks were rerun after the three vocabulary repairs below.

The full repository validator was not run locally: the connected reader cannot return the oversized `data/atlas.json`, and direct network access from the execution environment is unavailable. It was run by GitHub's Swarm submission workflow on the initial PR revision. The decoded log of run 35615471106, job 106384905164, reports `2 file(s), 0 problem(s)` and `297 entries, accepted names 208, kept 24, procedural 62, rejected 3, undecided 0`. Thus the complete input-ID coverage and all but three vocabulary decisions passed the full validator; there were no reported curated-name collisions.

The three rejected labels were repaired in commit `981611c24affa555dd9cae001726aac4db804d71` using the input's own layer or passage words:

- R25.4: `Semistable nonexistence over Q at small primes` → `Schoof's semistable small-prime theorem`.
- VS4/classifying-stack-equivalence: `Classifying-stack representation equivalence` → `Smooth G-representation equivalence`.
- VB0/scalar-extension-adjunction: `Coefficient-field adjunction on isocrystals` → `Adjoint functors on isocrystals`.

The revised result blob is `460cef112831d3c9773f3ad86ac9eb992fafcec0` (52,795 UTF-8 bytes), matching the locally checked content byte-for-byte. The post-repair automatic strict check remains to be observed at this handoff revision; check the latest PR status and comments for its result. No `--apply` run, git command or Lean compilation was performed. No mathematical result is claimed formalized.

## Five representative renames

- `parabolic stabilizing the Hodge filtration and the compact dual as a flag variety` → `Compact dual`.
- `FS IV.1.1: Artin v-stacks by representable diagonal and a separated cohomologically smooth atlas` → `Artin v-stacks`.
- `FS II.2.13: the Harder-Narasimhan filtration commutes with extension of C and rescales under extension of E` → `Harder–Narasimhan filtration under extension`.
- `FS V.5.1: Bernstein-Zelevinsky duality on compact objects of D_et(Bun_G,Lambda)` → `Bernstein–Zelevinsky duality on compact objects`.
- `FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting` → `HN filtration on constant-polygon loci`.

## Five representative drops

- `with its quantifiers in`: incomplete grammatical fragment.
- `expansion inputs`: prerequisite fragment without an identified expansion theorem.
- `Primary proof sources are Milne 1983, The action of an automorphism of C on a Shimura variety`: bibliography rather than a mathematical landmark.
- `good reduction, a Tate elliptic curve and a curve with positive-genus components`: acceptance comparison, not an additional central construction.
- `Artin v-stacks by representable diagonals and the cohomologically smooth atlas condition`: duplicate of the refined definition and stability nodes.

## Remaining work and resumption

No input record remains undecided. Confirm the post-repair strict CI result and obtain independent editorial review. Resume from the complete result, not from a partial batch. Check submission comments for exact validator rejections, compare any disputed name with its input excerpt and own layer, and amend only this result and handoff on the existing branch. Integration into the atlas and independent review belong to the intake/maintainer, not this worker.
