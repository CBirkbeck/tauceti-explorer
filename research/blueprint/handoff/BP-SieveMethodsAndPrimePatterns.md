# BP-SieveMethodsAndPrimePatterns: Maynard's small gaps between primes (SV.4), with SV.3 and SV.1 interfaces

Issue #1036. Claude Code (cc-39fac3), 29 September 2026. Claim comment 5885197775. Inspection base: f200d619c0b83664429ba13b1bd249f78f3f73ee.
Status: partial. SV.4 is source-decomposed; SV.0–SV.3 are partial; SV.5 is not read. Every node is unchecked.

## What this checkpoint supplies

Thirty-one nodes follow Maynard, *Small gaps between primes*, Ann. of Math. 181 (2015), 383–413. The published PDF was read completely and collated with arXiv v1–v3.

- SV.4 has twenty-seven nodes:
  - Definitions and constructions: admissible tuples; the prime k-tuples conjecture as a named statement (RS-07 moved it here from AN.6); the W-trick residue; Maynard's multidimensional sieve weights, with S₁, S₂^{(m)} and y^{(m)} as API data; and the variational quantity M_k, with I_k, J_k^{(m)} and the class 𝒮_k.
  - Supporting lemmas: a smooth-approximation lemma that the source uses without proof; the GPY positivity criterion; the λ_max bound (5.9); Lemmas 5.1, 5.2, 5.3, 6.2 and 6.3; the cluster-to-gap deduction; Lemmas 8.1 (corrected) and 8.2; Engelsma's 105-tuple; and the first k primes above k.
  - Propositions 4.1, 4.2 and 4.3(1)–(3).
  - Theorems 1.1–1.4.
- SV.3 has two nodes: the level of distribution of Maynard (1.3), with Elliott–Halberstam as a named hypothesis and the window form of (5.20), and Bombieri–Vinogradov in that form for θ<1/2. The latter takes Kedlaya Theorem 18.4 as input.
- SV.1 has two nodes: GGPY Lemmas 3–4 in dimension one, which are Maynard's Lemma 6.1.
- There are eight new planets. SV.3 gets 'Level of distribution of the primes' and 'Bombieri–Vinogradov theorem'. SV.4 gets 'Admissible tuple', 'Prime k-tuples conjecture', 'Maynard's variational quantity M_k', 'Maynard's refinement of the GPY sieve', 'Bounded gaps between primes (at most 600)' and 'm + 1 primes in bounded intervals'.

All 75 inherited node objects are unchanged. The SV.4 placeholder gap is removed. The SV.1 and SV.3 gap texts are extended, and the SV.3 gap now also names the Bombieri–Vinogradov node.

## Sources and findings

- Maynard, published PDF, SHA-256 3c24d010f00d1212418351b6f6baed9c94251a3ce958c36f56ebbc450ade9349 (printed page = PDF page + 382).
- arXiv:1311.4600, SHA-256 of each version:
  - v3: dce1a7a0…;
  - v2: e91d4407…;
  - v1: 3f71137f….
- v2 and v3 were compared word by word. v3 swaps Sections 7 and 8, replaces piecewise differentiable functions by smooth ones, fixes κ=1 in Lemma 6.1, and corrects the γ of (6.19) and 'M₁₀₅ > 2'.
- GGPY, arXiv:math/0609615v1, §2 read (SHA-256 411a638e…).
- Kedlaya Chapter 18, Theorem 18.4, reread (same SHA-256 as before).

Six new, unreviewed findings, E27–E32, are recorded against the published text. They were checked on page images and are present in v1–v3.
- (4.4) has a j/m index slip.
- (5.8) prints μ_i.
- 'a prime less than k' omits p = k in the proof of Theorem 1.1.
- Before (7.10), Σ_{i=1} is printed for Σ_{i=2}.
- Lemma 8.1's G_{b,j} starts at r=1 and so fails at b=0. This is recorded as an error, but the paper's numbers are right.
- (8.10) has c and 1 for c′ and 2.

No erratum was found on the Annals page or by web search.

## Checks

- check_blueprint.py with the pinned declaration index: 0 errors, 0 warnings.
  - 106 nodes and 163 baseline declarations.
  - 19 planets, at most 6 per layer.
  - 6 gaps and 1 request.
- intake.py check-files on the four files: no problems.
- Unit tests pass. queue.json was taken from origin/main for the run.
- Lean 4.34.0-rc2 elaborates the whole suggested file against the existing Mathlib 082e2d3 build, with 0 errors and 252 proof-placeholder warnings (178 inherited, 74 new), and no other warnings. No Lake project, build or cache download was used. The file claims no implementation.
- Exact rational arithmetic:
  - (8.17) gives I₅ = 29509/1222452000 and ratio 1417255/708216. It was computed both by expanding into Dirichlet integrals and by the corrected Lemma 8.2. The printed G gives 26784/17753.
  - (8.15) at k=105, over the 42 monomials with b+2c ≤ 11, gives the eigenvalue 4.00206976…. A rational eigenvector (denominators 10^60) has an exact ratio above 4.
  - Engelsma's 105-tuple is admissible with diameter 600.
  - The unit-test values were recomputed.
- Every new excerpt is contained, letters only, in its source's text layer.

## Where to resume

SV.4 needs no further source reading. Its open inputs lie elsewhere:
- SV.3: decompose Kedlaya Theorem 18.4; the existing gap and findings E19–E26 apply.
- SV.1: find an open proof of GGPY Lemma 3 in dimension one, uniform in L (gap). Halberstam–Richert was not read.
- AnalyticNumberTheory:AN.2 (request): Mertens' first theorem, and the prime number theorem on [N,2N) with error O(N/(log N)²).

Possible SV.4 extensions: Polymath 8b (arXiv:1407.4897), for M_k variants and the ε-trick, and the Maynard–Tao results for other sequences. SV.5 remains unread.

## Previous checkpoint: BP-SieveMethodsAndPrimePatterns — finite dyadic bilinear checkpoint

Issue #1036. Codex — codex-a71f92. 28 September 2026.
Claim 5868440951; bot confirmation 5868443281.
Inspection base: 78f60a3ba09116b78c0bb5cd513d59c43d7ddb2b.
Status: partial; every node remains unchecked.

### What this checkpoint supplies

Six SV.2 nodes extend the primitive-character large sieve to rectangular bilinear sums: dyadic energy, weighted Cauchy–Schwarz, exact signed modulus partition, finite scalar kernel summation, dyadic tail and arbitrary cutoff. The large-sieve constant remains H+2Q². At scale P this gives H+8P², and the final cutoff bound retains 3J(√H+√K), with explicit cover Q≤R2^J≤2Q. Coefficients are arbitrary complex families on independently translated finite integer intervals. Empty intervals, zero energies, shared dyadic endpoints and the last partial band are explicit.

This supplies only the large-conductor primitive rectangular step motivated by Chapter 18 Theorem 18.3. It does not establish the source's sharper aggregate estimate, the conductor/cofactor argument, a hyperbola decomposition into rectangles, Bombieri–Vinogradov or a downstream quadratic-symbol/function-field large sieve. E20 remains an unreviewed gap; the weaker finite replacement does not turn its reported obstruction into a counterexample to the actual theorem.

All 69 inherited node objects, 137 baseline entries, 26 source findings, seven prior source versions and eleven planets are unchanged. There is no new construction, definition, API item, request or planet.

### Inventory and checks

The packet has 75 nodes: five constructions, 51 lemmas and 19 theorems. It retains 27 API items (ten promoted into main nodes, seventeen additional signatures), 23 construction tests and eleven planets. There are 143 pinned baseline references, six sources, 26 unreviewed findings, eight source-version records and six gaps; no requests. SV.0–SV.3 are partial and SV.4–SV.5 remain not read.

The suggested Lean file compiled on Lean 4.34.0-rc2 against existing pinned-library build artifacts: 92 named declarations and 86 typed examples, no errors, exactly 178 expected proof-placeholder warnings and no other warnings. The 3,362-file Mathlib source import closure matches the clean Mathlib pin 082e2d3. No new Lake project, dependency build or library cache download was used. Compilation checks signatures; it is not a formalization-completion claim.

DyadicProbe.lean separately proves three general statements (signed interval partition, pointwise kernel estimate, finite kernel sum) and six examples, with no errors or warnings. The printed axiom lists contain propext, Classical.choice and Quot.sound, without a proof-placeholder axiom. This probe does not prove the character inequalities.

test_dyadic.py passes exact-arithmetic checks: 324 signed partitions; 5,500 pointwise and 1,100 finite scalar-kernel certificates; 216 primitive band energies; 3,240 bilinear band certificates; 1,701 cutoff certificates; thirty E20 displayed-expression certificates; eight rejected mutations. It enumerates all twelve characters and six primitive characters for moduli 1–6. Gaussian-rational character values and certified rational square-root upper bounds avoid floating point. These finite tests are not general proofs. Older sieve, Gram, Fourier, character and Vaughan regressions remain inherited evidence, not rerun.

The current official blueprint/source-issue checker passes with zero errors and warnings using the pinned declaration index and the repository world read from current Git objects. The current four-file intake check passes. Extra checks cover exact preservation, source-version fields, signature/example counts and the acyclic internal dependency graph. The shared clone stays on its other worker's branch; only read-only object access and fetch are used there.

### Sources and ownership

The six current reviewed audit rows were read before planning. Accepted RS-07 retains the large-sieve/bilinear core at SV.2 and its forward supply to AN.3 and SV.3. Arithmetic Dirichlet series and Modular forms upstream readers were inspected. The 28 link-map entries mentioning this roadmap are negative screening records, not stronger absence proofs. Current ArithmeticStatistics and FiniteFieldsAndCharacterSums consumer contracts are different estimates and remain gaps.

The entire live author Chapter 18 was read afresh from https://kskedlaya.org/ant/chap-bombieri2.html. SHA-256: 9bd73d12d648dc61a5c09804bbee04992cb8108b15858146688ac7ae9b69f523. The bytes match the prior acquisition. No journal edition or new collation of the revised-2007 handout is claimed. Six additional Mathlib declaration statements were read at the pin. Existing source findings receive no new verdicts.

### Where to resume

Start at SV.2/primitive-bilinear-cutoff and the reader's final continuation boundary. For Chapter 18, decompose the discrepancy API and Lemma 18.2, justify primitive/imprimitive conductor reduction and totient-weighted cofactor summation, and repair the small-conductor normalization in E19. Carry the J loss through every downstream estimate. The least covering scale must include the final partial band.

Then prove the actual Vaughan hyperbola-to-rectangle covering, boundary-strip estimates and balancing; repair E21–E25 before invoking Theorem 18.4. The variance theorem, Corollary 18.6 and exercises remain undecomposed. The other five layer-level gaps retain the finite-sieve analytic applications, Chapters 12–15/remaining Heath-Brown proof, Chapter 16/Linnik applications, and unread Maynard/Chen/affine-sieve sources. Preserve RS-07 ownership and the two distinct cross-roadmap bilinear/Farey needs.

### Small-footprint evidence handoff

After submission the job scratch directory is removed. Only these named evidence files are retained in the worker's dyadic-evidence directory: WORKLIST.md, DyadicProbe.lean, DyadicProbe.compile.log, test_dyadic.py, compile_pinned.py, validate_checkpoint.py, final-checks.json, SieveMethodsAndPrimePatterns.compile.log and chapter18.html. The four deliverables are recoverable from the PR and are not duplicated in retained scratch. No Lean server or watcher is left running.
