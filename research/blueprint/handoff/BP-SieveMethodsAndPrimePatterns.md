# BP-SieveMethodsAndPrimePatterns — finite dyadic bilinear checkpoint

Issue #1036. Codex — codex-a71f92. 28 September 2026.
Claim 5868440951; bot confirmation 5868443281.
Inspection base: 78f60a3ba09116b78c0bb5cd513d59c43d7ddb2b.
Status: partial; every node remains unchecked.

## What this checkpoint supplies

Six SV.2 nodes extend the primitive-character large sieve to rectangular bilinear sums: dyadic energy, weighted Cauchy–Schwarz, exact signed modulus partition, finite scalar kernel summation, dyadic tail and arbitrary cutoff. The large-sieve constant remains H+2Q². At scale P this gives H+8P², and the final cutoff bound retains 3J(√H+√K), with explicit cover Q≤R2^J≤2Q. Coefficients are arbitrary complex families on independently translated finite integer intervals. Empty intervals, zero energies, shared dyadic endpoints and the last partial band are explicit.

This supplies only the large-conductor primitive rectangular step motivated by Chapter 18 Theorem 18.3. It does not establish the source's sharper aggregate estimate, the conductor/cofactor argument, a hyperbola decomposition into rectangles, Bombieri–Vinogradov or a downstream quadratic-symbol/function-field large sieve. E20 remains an unreviewed gap; the weaker finite replacement does not turn its reported obstruction into a counterexample to the actual theorem.

All 69 inherited node objects, 137 baseline entries, 26 source findings, seven prior source versions and eleven planets are unchanged. There is no new construction, definition, API item, request or planet.

## Inventory and checks

The packet has 75 nodes: five constructions, 51 lemmas and 19 theorems. It retains 27 API items (ten promoted into main nodes, seventeen additional signatures), 23 construction tests and eleven planets. There are 143 pinned baseline references, six sources, 26 unreviewed findings, eight source-version records and six gaps; no requests. SV.0–SV.3 are partial and SV.4–SV.5 remain not read.

The suggested Lean file compiled on Lean 4.34.0-rc2 against existing pinned-library build artifacts: 92 named declarations and 86 typed examples, no errors, exactly 178 expected proof-placeholder warnings and no other warnings. The 3,362-file Mathlib source import closure matches the clean Mathlib pin 082e2d3. No new Lake project, dependency build or library cache download was used. Compilation checks signatures; it is not a formalization-completion claim.

DyadicProbe.lean separately proves three general statements (signed interval partition, pointwise kernel estimate, finite kernel sum) and six examples, with no errors or warnings. The printed axiom lists contain propext, Classical.choice and Quot.sound, without a proof-placeholder axiom. This probe does not prove the character inequalities.

test_dyadic.py passes exact-arithmetic checks: 324 signed partitions; 5,500 pointwise and 1,100 finite scalar-kernel certificates; 216 primitive band energies; 3,240 bilinear band certificates; 1,701 cutoff certificates; thirty E20 displayed-expression certificates; eight rejected mutations. It enumerates all twelve characters and six primitive characters for moduli 1–6. Gaussian-rational character values and certified rational square-root upper bounds avoid floating point. These finite tests are not general proofs. Older sieve, Gram, Fourier, character and Vaughan regressions remain inherited evidence, not rerun.

The current official blueprint/source-issue checker passes with zero errors and warnings using the pinned declaration index and the repository world read from current Git objects. The current four-file intake check passes. Extra checks cover exact preservation, source-version fields, signature/example counts and the acyclic internal dependency graph. The shared clone stays on its other worker's branch; only read-only object access and fetch are used there.

## Sources and ownership

The six current reviewed audit rows were read before planning. Accepted RS-07 retains the large-sieve/bilinear core at SV.2 and its forward supply to AN.3 and SV.3. Arithmetic Dirichlet series and Modular forms upstream readers were inspected. The 28 link-map entries mentioning this roadmap are negative screening records, not stronger absence proofs. Current ArithmeticStatistics and FiniteFieldsAndCharacterSums consumer contracts are different estimates and remain gaps.

The entire live author Chapter 18 was read afresh from https://kskedlaya.org/ant/chap-bombieri2.html. SHA-256: 9bd73d12d648dc61a5c09804bbee04992cb8108b15858146688ac7ae9b69f523. The bytes match the prior acquisition. No journal edition or new collation of the revised-2007 handout is claimed. Six additional Mathlib declaration statements were read at the pin. Existing source findings receive no new verdicts.

## Where to resume

Start at SV.2/primitive-bilinear-cutoff and the reader's final continuation boundary. For Chapter 18, decompose the discrepancy API and Lemma 18.2, justify primitive/imprimitive conductor reduction and totient-weighted cofactor summation, and repair the small-conductor normalization in E19. Carry the J loss through every downstream estimate. The least covering scale must include the final partial band.

Then prove the actual Vaughan hyperbola-to-rectangle covering, boundary-strip estimates and balancing; repair E21–E25 before invoking Theorem 18.4. The variance theorem, Corollary 18.6 and exercises remain undecomposed. The other five layer-level gaps retain the finite-sieve analytic applications, Chapters 12–15/remaining Heath-Brown proof, Chapter 16/Linnik applications, and unread Maynard/Chen/affine-sieve sources. Preserve RS-07 ownership and the two distinct cross-roadmap bilinear/Farey needs.

## Small-footprint evidence handoff

After submission the job scratch directory is removed. Only these named evidence files are retained in the worker's dyadic-evidence directory: WORKLIST.md, DyadicProbe.lean, DyadicProbe.compile.log, test_dyadic.py, compile_pinned.py, validate_checkpoint.py, final-checks.json, SieveMethodsAndPrimePatterns.compile.log and chapter18.html. The four deliverables are recoverable from the PR and are not duplicated in retained scratch. No Lean server or watcher is left running.
