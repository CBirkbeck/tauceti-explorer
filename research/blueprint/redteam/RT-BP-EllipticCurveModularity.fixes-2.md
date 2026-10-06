# FIX-RT-BP-EllipticCurveModularity~2

Claude — `claude-deuavf`; issue #5717; 6 October 2026.

Round 2 of the fix of the red-team findings on BP-EllipticCurveModularity. The review of round 1
(`research/blueprint/reviews/REV-FIX-RT-BP-EllipticCurveModularity.md`) accepted the repair of finding /1, repaired
parts of /2–/5 itself, and sent the packet back for three things: the proof of the modular-quotient converse, honest
typed signatures in the suggested file, and a reader that agrees with the packet. This round does those three. It
also adds the rational-isogeny-only test the review called desirable, removes the prerequisite encoding that the
checker no longer needs, and cites supplier nodes where they now exist. The four deliverables changed are the packet,
the reader, the suggested file and this report.

Before submission the draft was read by a second session that had not written it. Its findings are applied and are
marked "(second read)" below.

## What changed, by finding

### /1 — duplicate cross-level strong multiplicity one (accepted in round 1)

No change to the ownership: the theorem stays an import from Tau Ceti ModularForms Layer 5.

- The Layer 5 theorem is stated for newforms of any two levels. The request says so, and the uniqueness of a
  newform attached to E is used in that form. The earlier restriction to levels dividing N was not needed.
- In the suggested file the contract `eq_of_eigenvalue_eq_across_levels` is no longer a comment. It is a typed
  statement against Tau Ceti's `Newform`, for weight 2 and trivial characters as requested, placed in the section of
  imported interfaces and marked as an imported contract of Layer 5.

### /2 — supplier prerequisites

`scripts/check_blueprint.py` now resolves a Tau Ceti layer id (`tauceti:TauCetiRoadmap/…#layer-…`) in
`prerequisites` as a stage. The workaround of round 1 is therefore removed: the upstream imports are ordinary
entries of `prerequisites`, the field `upstreamPrerequisites` and the packet-level `links` are gone, and so is the
gap "Upstream-stage prerequisite encoding".

Supplier blueprints now have nodes for many of the statements this packet needs. Following PROTOCOL §3, a node is
cited wherever one supplies the exact statement, and the request to its stage is dropped when no use of the stage
remains (second read). Seventeen requests become eleven.

| Stage formerly requested | Node now cited | Cited by |
| --- | --- | --- |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6 | `abelian-scheme-torsion-finite-flat` | `finite-flat-weight-two` |
| AlgebraicModularFormsAndSerreWeights R15.4 | `weight-two-iff-finite-flat-at-p` | `finite-flat-weight-two` |
| ClassicalSerreModularity R27.6 | `finite-flat-weight-two-export` | the Serre witnesses |
| AutomorphicGaloisRepresentations R19.4 | `conductor-and-local-factors-classical` | `exact-conductor`, `bad-euler-factors` |
| AutomorphicGaloisRepresentations R19.6 | `weight-two-tate-module-decomposition` | `tate-module-comparison`, `isogeny-to-E`, the converse |
| ModularCurvesPartII R14.6 | `rational-cusp-abel-jacobi` | `modular-parametrisation`, `modularity-theorem` |

Also cited by node: `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation` (Frobenius polynomials of
the representations of a newform), `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `…/trivial-character-J0`,
`…/quotient-tate-exact`, `…/abel-jacobi-composite-nonzero`, `…/modular-quotient-differentials`, and
`FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison` with the R28.6
nodes for elliptic curves. The eleven requests that remain are to R28.6, R01.4, R01.5, R01.6 and R14.5, to Tau Ceti
ModularForms Layers 4, 5, 7 and 8g, to Tau Ceti EllipticCurves Layer 4 and to Tau Ceti JacobianChallenge Layer F.
`neededBy` of each is recomputed from the prerequisites.

### /3 — the modular-quotient converse

The false formula was corrected in round 1; the proof was missing. It is now planned, in three new nodes.

- **`R29.3/attached-newform`** (definition). A normalised newform of weight 2, of any level, is attached to E when
  its character is trivial and A_ℓ = a_ℓ(E) for all but finitely many primes ℓ. Two newforms attached to E are equal
  (Layer 5). Existence is not part of the definition. Its prerequisites are Tau Ceti's `Newform`, Mathlib's
  `LFunction` and Layer 5: nothing about the Serre witnesses (second read; in the first draft the notion lived
  inside `newform-of-E`, whose prerequisites reach R27.6).
- **`R29.6/absolute-irreducibility-of-the-rational-tate-module`** (lemma). V_r(E) is absolutely irreducible for
  every E/ℚ and every r. The commutant of Galois is End_ℚ(E) ⊗ ℚ_r = ℚ_r (Tate–Hom comparison and End_ℚ(E) = ℤ);
  V_r(E) is semisimple, hence simple; and an algebra with a faithful simple module and commutant ℚ_r is the full
  matrix algebra. CM curves are included, because the base field is ℚ.
- **`R29.6/newform-from-a-modular-quotient`** (theorem). A surjective homomorphism J₀(N′) → E over ℚ, for any level
  N′, gives a newform of level dividing N′ that is attached to E. The nine proof steps are: surjectivity on Tate
  modules; the old/new decomposition of J₀(N′) with multiplicities σ₀(N′/M), which yields a nonzero Galois map
  V_r(A_f) → V_r(E) for one newform f; the passage from the quotient of J₀ to the quotient of J₁, for which the
  suppliers state the Tate module and its Frobenius polynomials (second read); extension of scalars to ℚ̄_r and the
  splitting by the embeddings of K_f; the isomorphism with one component, by the lemma; equality of Frobenius
  traces; descent of the embedding from ℚ̄_r to ℚ̄; the Galois conjugate newform; and rationality, exact level and
  Euler factors from R29.3–R29.4.

For the last step to apply to the newform found there, and for the equivalence to hold in both directions without
the classical Serre theorem, these reviewed nodes are restated. **They change reviewed mathematics, and the next
review should read them.**

| Node | Before | Now |
| --- | --- | --- |
| `R29.3/a-single-newform-…` | a newform of level dividing N | a newform of level N |
| `R29.3/newform-of-E` | F_E, unique among levels dividing N, of level M_E ∣ N | F_E is the newform attached to E, of level N |
| `R29.3/rational-coefficient-field` | F_E has integer coefficients | every newform attached to E has |
| `R29.4/tate-module-comparison` | V_r(E) ≅ V_r(F_E) | V_r(E) ≅ V_r(F) for every newform F attached to E |
| `R29.4/exact-conductor` | the level of F_E is N | the level of every newform attached to E is N |
| `R29.4/bad-euler-factors` | all local factors of E and F_E agree | the same for every newform attached to E |
| `R29.5/isogeny-to-E` | a ℚ-isogeny A_{F_E} → E | a ℚ-isogeny A_F → E for every newform F attached to E |

Three of these need a word.

- **Level N in R29.3** (second read). The witnesses of R29.2 are newforms of level exactly N, as that node already
  said; so the form chosen among them by the pigeonhole has level N. "Level dividing N" was weaker than its proof,
  and it made the level-N export `newformOf` depend on R29.4 while R29.4 depended on `newform-of-E`: a cycle hidden
  in the API. Serre's "niveau un diviseur de N" belongs to his own route, from an eigenform modulo p lifted by
  Deligne–Serre, with level N supplied by Carayol; the node says so. `exact-conductor` remains, as the theorem that
  every newform attached to E has level N, proved through Carayol without the classical Serre theorem. The converse
  needs it in that form. This departs from the wording of the round-1 review, which kept "level dividing N, then
  exact conductor" for F_E; the distinction survives for attached newforms in general, where it carries content.
- **The Euler factor at a bad prime** (second read). `bad-euler-factors` read the local factor on the inertia
  invariants of V_r. With V_r the Tate module and Frobenius arithmetic, as the packet has them, that gives 1 − ℓT at
  a split multiplicative prime. The factor is the characteristic polynomial on the inertia coinvariants, equivalently
  of the geometric Frobenius on the invariants of the dual; the supplier node R19.4 states it that way. The step and
  the reader are corrected. The sentence came from the reviewed packet.
- **The other proofs** are the reviewed ones; they used of F_E only that it is attached to E. Two small points were
  added: Chebotarev needs the Frobenius polynomials only on a set of density one, and A_ℓ(F) = a_ℓ(E) at every good
  prime, not only at almost all, follows from the isomorphism of Tate modules once the level is known.

`R29.6/modularity-theorem` now states the three formulations and their equivalence precisely: a newform attached to
E, a surjection J₀(N′) → E for some N′, and a nonconstant X₀(N′) → E for some N′ are equivalent; the newform has
level N and N ∣ N′. Both directions are proof steps that cite nodes: `isogeny-to-E` with the Abel–Jacobi nodes of
R14.5–R14.6 one way, the converse node the other way. The script that writes the packet checks on the prerequisite
graph that neither `isogeny-to-E` nor the converse, nor anything they depend on in this packet, has the Serre
witnesses, the existence theorem or `newform-of-E` among its prerequisites. The gap "The modular-quotient converse
needs a constituent and descent proof" is removed, and R29.6 is `source_decomposed` with nothing remaining.

What the converse still rests on is recorded where it belongs:

- the decomposition of the whole Jacobian J₀(N′) over ℚ is requested from ModularCurvesPartII R14.5; its node
  `oldform-comparison` states the analogue for one Galois orbit in J₁;
- End_ℚ(E) = ℤ is requested from FaltingsFinitenessAndIsogenyTheorems R28.6 (see the notes for the maintainer).

New acceptance tests: 11a1 as a quotient of J₀(22) returns the level-11 form; J₀(23), with K_f = ℚ(√5), has no
elliptic quotient; y² = x³ − x at r = 5 for the lemma.

### /4 — exceptional-prime tests

Round 1 added three tests and recorded that none isolated the rational-isogeny clause. This round adds it:

- **`exceptionalPrimes_isogeny_only`**: E: y² + xy + y = x³ − x² − 5x + 5 (162b1). Δ = −2³·3⁴, c₄ = 225, so E is
  good at 7, additive at 3 and multiplicative only at 2, with v₂(j) = −3. The cubic x³ − 3x² + 3 divides the
  7-division polynomial, is irreducible over ℚ, and its roots are permuted by the duplication map: they are the
  x-coordinates of a rational cyclic subgroup of order 7. So 7 ∈ Σ_E through the isogeny clause alone.

With 26b1 (both clauses), 274a1 (valuation only), 162b1 (isogeny only) and 11a1 at 7 (neither), a definition that
drops either clause or adds primes fails a test. The limitation recorded in round 1 is removed. The test kinds of all
unit tests now use the vocabulary of PROTOCOL §12.

### /5 — the suggested file

The file is rewritten. Every definition, every one of the 23 API items and every one of the 19 unit tests of the
packet appears under its packet name as a typed declaration, and the named theorems of the six layers are stated.
Nothing is left as a comment except Serre's Théorème 5, which needs objects no interface supplies.

- **Real definitions.** Σ_E (`exceptionalPrimes`) is defined from Mathlib's reduction types over ℤ_p, the p-adic
  valuation of j_E and finite cyclic Galois-stable subgroups of E(ℚ̄); it needs no conductor. a_n(E) is the
  coefficient of Mathlib's `LFunction`. `IsNewformOf` is defined on Tau Ceti's `Newform` through its q-expansion.
  The modular parametrisation is defined as a composite. A few facts that follow at once from the definitions are
  proved: the nonzero discriminants of the nine test curves, `exceptionalPrimes_contains_small`,
  `IsNewformOf.congr` and `not_isNewformOf_of_char_ne_one`.
- **Imported interfaces.** What other roadmaps own and the pinned libraries lack is collected in one section of
  typed stand-ins, each naming its owner: the conductor, E[p] and V_r(E) with their Galois actions, Artin conductors
  and Serre weights, the Galois representations of a newform, and X₀(N), J₀(N), the quotient of J₀(N) with their
  maps, degrees and the pullback of the invariant differential. Each is a `def` of a type, a number, a
  representation or a morphism. None is a `Prop`-valued placeholder. This is the form used by the reviewed
  `suggested/FaltingsFinitenessAndIsogenyTheorems.lean`.
- **Levels.** `exists_newform_coeff_eq` and `newformOf E` are at level `conductor E`, which the Serre witnesses
  justify. `IsNewformOf.level_eq` says that a newform attached to E, of any level, has that level. No newform of an
  arbitrary level is produced from a curve.
- **Irreducibility.** Irreducibility of E[p] over F_p, absolute irreducibility (as a statement after extension of
  scalars) and absolute irreducibility of V_r(E) (as a statement about the span of the image) are separate
  theorems.
- **Both directions of the equivalence** are typed: `IsNewformOf.exists_hom_J0` and `IsNewformOf.exists_hom_X0` one
  way, `exists_isNewformOf_of_J0` and `exists_isNewformOf_of_X0` the other.
- **Second read.** `HasRationalCyclicSubgroup` now requires the subgroup to be finite and cyclic (before, it held
  for E[2] at "order" 4). The stand-in for the quotient of J₀(N) is called `modularQuotient₀`, because the owner's
  `modularQuotient` is the quotient of J₁(N).

The packet gains API items so that file and packet agree: `HasRationalCyclicSubgroup`, `SerreWitness`,
`IsNewformOf` with `IsNewformOf.unique` and `IsNewformOf.congr`, `isNewformOf_newformOf` and `QuotientIsogeny`. The
statements of the other API items are made precise where the typed signature forced a choice.

### The reader

`research/blueprint/readmes/EllipticCurveModularity.md` is rewritten to agree with the packet: purpose, scope and
boundaries with a table of imports by owner, conventions, a layer overview, and for each layer the definitions,
theorems with hypotheses and proofs, API, unit tests and dependencies; then the acceptance tests, the open inputs
and the sources. The converse, its proof and the multiplicity σ₀(N′/M) are in it. The dated section about round 1 is
gone; the document is written timelessly.

## Checks

- **Blueprint checker.** `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularity.json`
  with the pinned declaration index: 0 errors, 0 warnings. 23 nodes, 23 API items, 19 unit tests, 7 planets, 16
  baseline declarations, 11 requests, 2 gaps, six stages planned.
- **Agreement.** A script compared the three files: every node id, API name, test name and planet name of the packet
  occurs in the reader, and every API and test name is a declaration of the suggested file.
- **Stage graph.** The stage-level edges the packet implies were added to `stageEdges` of `data/atlas.json`; no
  supplier is reachable from the R29 layer it supplies. Node ids that other packets cite (`modularity-theorem`,
  `l-function-continuation`, `modular-parametrisation`, `exact-conductor`, `bad-euler-factors`, `newform-of-E`,
  `rational-coefficient-field`, `tate-module-comparison`) are unchanged.
- **Atlas build.** `assemble(require_distances=False)` of `scripts/build.py`, run in memory on a scratch copy of the
  promoted blueprints with this packet and reader in place of the promoted ones, completes without error.
- **Exact arithmetic,** in rational arithmetic, for every numerical claim of the tests: discriminants, c₄, j and
  reduction types of the nine curves; the orders of (5, 5) on 11a1 and (1, 0) on 26b1; a_ℓ for ℓ ≤ 37; the
  7-division polynomials of 11a1, 26b1, 274a1 and 162b1 with their rational kernel polynomials (none, (x − 1)(x + 1)
  (x − 3), none, x³ − 3x² + 3), each verified by exact division and closure under duplication; the twist relation
  a_ℓ(E′) = χ₋₄(ℓ)a_ℓ(E) for odd ℓ ≤ 43, ℓ ≠ 11; equality of a_ℓ for 11a1, 11a2, 11a3. The second read recomputed
  these with its own code and agreed. The LMFDB lists y² + xy + y = x³ − x² − 5x + 5 as 162b1 with isogeny degrees
  1, 3, 7, 21, y² + xy = x³ − 7x + 9 as 274a1 with no isogenies, y² = x³ − x as 32a2, and modular degrees 2 for
  37a1 and 5 for 11a3 (read 6 October 2026).
- **Sources.** Serre, Faltings, Carayol and Cremona's Chapter II were downloaded again on 6 October 2026; the four
  SHA-256 values match the packet's records. The new excerpts were copied from `pdftotext -raw` (poppler 26.09.0)
  with line breaks replaced by spaces; the earlier excerpts came from another extractor and are unchanged. No
  mistake was found in the passages read; `sourceIssues` stays empty.
- **Lean.** The shared build has the pinned Mathlib but no object file for
  `TauCeti.NumberTheory.ModularForms.Newforms.Newform` or its Tau Ceti imports, and no other build on the machine
  has one. The suggested file was therefore elaborated with that single import replaced by a stub of
  `HeckeRing.GL2.EigenformAwayFromLevel` and `Newform` carrying the pinned names and types of the fields the file
  uses (`toCuspForm`, `χ`, `eigenvalue`, `ne_zero`, `isNorm`; the fields `mem_charSpace`, `isEigen` and `isNew` were
  left out because their types need unbuilt modules). The final `lake env lean` run on that copy: exit 0, 92
  warnings `declaration uses sorry`, no other message. **The file as submitted, with the Tau Ceti import, was not
  compiled.** The pinned `Newform.lean` was read to copy the field types.

## Notes for the maintainer

- **End_ℚ(E) = ℤ has no owner in practice.** The accepted RS-06 lists R28.6 as owner ("End_Q(E)=Z, rank-one Hom and
  finite rational prime-degree isogenies for every E/Q including geometric CM", formerly R29.1), and this packet
  requests it there. The R28.6 packet's node `hom-to-an-isogenous-elliptic-curve-is-infinite-cyclic` takes
  End_K(E′) = ℤ as a hypothesis and says that over ℚ it comes from EllipticCurveModularity R29.1. Neither packet
  plans it. It is recorded here as a gap and in the request; it should be added to the R28.6 packet, or RS-06's
  assignment changed.
- **Two modular quotients.** `ModularCurvesPartII:R14.5/modular-quotient` is the quotient of J₁(N); the quotient of
  J₀(N) is `trivial-character-J0`, which has no API name. This roadmap uses the second and requests a name for it.
  They differ already at level 11 (11a3 and 11a1), and the unit test `modularParametrisation_11a1` fails for the
  first. The acceptance of `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition` says
  "A_f = X₀(11) = 11a1" for the quotient of J₁(11); that quotient is J₁(11) = 11a3 (second read). It is another
  packet's text and is not changed here.
- **A comparison lemma.** Mathlib's `WeierstrassCurve.LFunction` takes its local factors over the completions
  `v.adicCompletion ℚ`, while the reduction statements here are over `ℤ_[p]`. Statements that mix the two rest on
  the identification of those completions with ℚ_p, which no layer plans by name.
- The gap about Mazur's theorem is unchanged. Mazur's theorem is now planned by
  `EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification`; this roadmap does not need it.

## What is not done

- The packet stays `partial`: its eleven supplier requests are open.
- The suggested file is not compiled against Tau Ceti's own `Newform` module, for the reason above.
- The review object of the packet is untouched; it is the verdict of the review of round 1.
