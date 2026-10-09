# Independent review of R01.6

Accepted as a complete target-level planning pass, with mathematical closure still open. The input was written by the BP session codex-pjMuPw (PR #8116); this review is by Codex, session codex-3Zz2Jd, job REV-ArithmeticGaloisRepresentations--R01.6, on 2026-10-09. No input work was authored by this reviewing session.

## Scope and counts

All 18 inherited targets are accounted for by 41 nodes. The corrected packet contains nine definitions/constructions, 30 named API entries, 32 discriminating tests, six planets, eight baseline declarations, eight gaps and eight supplier requests, four of them open (Q4/Q5/Q6/Q8). Coverage remains `planned`, packet status `complete`, and no stage is `closed`. No target nodes were added or removed. The checked list records 23 verified and 18 corrected nodes.

## Corrections made

1. **Division fields over imperfect fields.** Taking the fixed field in the whole algebraic closure includes purely inseparable elements, even when m=1. Over F_p(t), every automorphism fixes t^(1/p), so the old field could not equal K or be finite separable. Define the division field inside K^sep, represented in Kbar by the intersection with `separableClosure`. Membership now requires separability and fixedness. Added the finite-Galois and separable-containment API entries, the composite-m finite-étale supplier and a test excluding inseparable elements. The reader and actual Lean definition agree.
2. **Compact ambient group in the image API.** An open compact subgroup of a noncompact group need not have finite index: the trivial subgroup of an infinite discrete group is a counterexample. Added `CompactSpace H` to the general Lean equivalence and stated compactness explicitly in the API. Added that counterexample as a test. The actual polarization lattice-similitude group is compact, so the arithmetic definition keeps its intended scope.
3. **Arithmetic action and specialization suppliers.** Added IG.0/field-and-torus-comparisons and IG.0/adic-representations for the field action. IG.1/decomposition-inertia gives finite normalization and a residue quotient in its curve/valuation range; IG.1/proper-specialization concerns geometric fundamental groups. Neither supplies the full normal-base arithmetic residue-absolute-Galois comparison with all finite-level compatibilities. Q4 is therefore open and G7 records its adapter. Good reduction and family specialization cite the precise existing node and request the stronger input.
4. **Coefficient oddness.** Ribet Lemma 3.2, p. 5, uses the E-linear real homology decomposition. A4 realization-conventions restricts its prime hypotheses and does not explicitly give the all-prime conjugation-equivariant Betti–Tate comparison; A5 supplies analytic homology/de Rham comparison. Added Q8/G8 for the exact endomorphism-equivariant comparison, including primes above 2 and those dividing polarization degree. No total-dimension argument is substituted for component ranks.
5. **Current Hilbert interface.** Updated Q5: the accepted IG.2 packet already defines general finite-étale Hilbert data and number-field specialization, including its full-group/approximation results. The finitely generated-field, arbitrary normal-base closed-point theorem needed by Noot is still an open strengthening. Q6 continues to import existing Frattini theory and request only compact linear subgroup integration.
6. **Source locators.** Milne EC V8.3 is on p. 221. DDT 2.9 is a theorem and its preceding discussion supports the stable-line/isogeny connection; 2.10 and 2.14 are remarks, not propositions; 2.8 is on p. 56 and 2.12 and its proof span pp. 57–58. LP 4.9 is a proposition and 4.10 a lemma on author p. 11; 6.11 is a lemma and 6.12 a proposition on author p. 15. Schneider Exercise 26.2 is on p. 181, Corollary 26.7 on p. 186 and Theorem 27.1 on pp. 192–194. Added pages 8/17 to the Richard–Yafaev definition/theorem citations. Every changed locator is reflected in the reader and packet.
7. **Source issues and current imports.** Independently confirmed E9001 (supersingular kernel/tangent dimension), E9002 (nonnormal single-point stabilizer), and E9003 (wrong residue cardinality). Added each required review object. Reused the already confirmed geometry supplier issue E6 for the Rosati product misprint, without duplicating it. Added the current separable-closure absolute-Galois restriction equivalence to the library inventory.

## Baseline and ownership checks

Read the seven original baseline declarations at Mathlib 082e2d3/Tau Ceti f790474 and retained them. `Field.absoluteGaloisGroup` at this pin derives group, topology and topological-group structure; it does not itself supply profiniteness instances. `mapOfAlgebra` requires compatible closure algebras and scalar towers. `Representation` is algebraic. `WeierstrassCurve.localPolynomial` computes on the minimal model with residue cardinality and point at infinity included. `AbelianVariety` is the native proper geometrically integral group scheme. The symplectic matrix determinant theorem is rank two only, so the imported similitude stage G7 remains needed for all ranks. `IntermediateField.fixedField` is correct but must be restricted to separable elements here. Added and read the eighth baseline definition, `separableClosure`, and its membership theorem in Mathlib/FieldTheory/SeparableClosure.lean. No original baseline citation was removed.

At current Tau Ceti a91d3aaf, read actual generic Tate-module projections, maps and continuity; native elliptic action and determinant; the roots-of-unity Tate twist; the separable restriction equivalence; and the pro-p Frattini construction. The six inventoried modules are absent at the old pin, so the prototype’s explicitly labelled supplier fixtures do not pretend they are pinned imports. Current Frattini closedness is an instance; its name is not presented as a new theorem to implement.

Read RepresentationTheory and ReductiveGroups in full and the relevant current EllipticCurves, ProfiniteProPGroups, ProfiniteArithmetic and ClassFieldTheory interfaces. Searched the README and Lean files of all nine roadmaps that postdate the atlas snapshot, recursively including OperatorTheory. Existing inverse limits, native elliptic local theory, general similitude/component groups and Frattini theory remain imports. The lower A1–A6, R01.1–R01.3, G7 and IG statements were checked against their consumer hypotheses. The parent Weierstrass isogeny determinant node is an existing import, not another target here. The reviewed library-coverage audit supplies the older baseline; it is kept distinct from the current library inventory.

## Source access and limits

Read the node locators in the 12 versioned sources listed with URLs/hashes in the packet. The ten public PDFs matched their recorded hashes. SGA7 is the unpaginated public electronic Exposé IX §3; its geometric proof through Exposé III remains G3. Schneider was read directly in the maintainer-cleared original, without copying its file or passages. Its matrix-group argument includes p=2 by passing to a sufficiently deep congruence group. No verbatim source passage or source-by-source digest was added.

The author’s [AV errata section](https://mail.jmilne.org/math/CourseNotes/errata.html) and [two-page supplementary list](https://www.jmilne.org/math/CourseNotes/Errata_AbVar.pdf) contain no matching E9001/E9003 correction; another linked supplementary PDF returned HTTP 406, so exhaustive novelty is not claimed. The [second-edition EC errata list](https://www.jmilne.org/math/Books/EC2errata.html) was read through the web tool after direct retrieval failed and contains a different correction. The three findings are confirmed mathematically; the recorded search boundary remains explicit.

## Per-node verification

The following checks concern statements and honest proof-input boundaries, not completed Lean proofs. Full locators and direct prerequisites remain in each node.

| Target suffix | Verdict | Check |
|---|---|---|
| `field-tate-realization` | corrected | Added exact IG.0 field/fibre and adic-representation suppliers for the arithmetic action; current inverse-limit carrier remains imported. |
| `finite-torsion-action` | verified | Canonical finite quotients are distinct from the lattice-independent semisimplified reduction; n=0 is retained. |
| `division-field-interface` | corrected | Corrected imperfect-field fixed fields to the separable subfield; added composite-m input, two structure APIs and the inseparability exclusion test. |
| `separable-base-change-action` | verified | Checked compatible closure embeddings and the contravariant restriction map; prime-to-characteristic geometric torsion supplies the comparison. |
| `native-elliptic-tate-comparison` | verified | Checked A1 carrier equivalence, native current Tate action and pairing argument order; existing elliptic work stays imported. |
| `residual-cyclic-isogenies` | corrected | Corrected DDT locator to the discussion before Theorem 2.9; finite subgroup descent/quotients are A3, and stable lines need not have rational generators. |
| `quadratic-twist-tate-comparison` | verified | The actual quadratic twist and its chosen geometric isomorphism are explicit mathematical hypotheses, including the dyadic rational action. |
| `isogeny-tate-cokernel` | verified | Checked the inverse-limit boundary map against the primary geometric kernel; rational invertibility does not imply integral invertibility. |
| `arithmetic-polarized-pairing` | verified | Twist, covariant adjunction, integral degree restriction and rational perfectness agree with A3/A4 and Milne’s pairing. |
| `tate-determinant-character` | corrected | Corrected DDT 2.8 page to 56; rank-two baseline is supplemented by G7 for determinant=multiplier^g in all ranks. |
| `real-conjugation-eigenspaces` | corrected | Corrected DDT 2.8 page; anti-symplectic involution gives rational opposite eigenspaces at 2, without an integral dyadic splitting claim. |
| `good-reduction-specialization` | corrected | Replaced broad IG.1 citation with its precise finite-normalization node and recorded the missing henselian arithmetic fibre adapter in Q4/G7. |
| `finite-field-frobenius-conventions` | verified | Arithmetic q-power acts on the primal Tate module; geometric Frobenius acts inversely there and dually on H¹. Base residue cardinality is used. |
| `integral-good-frobenius-polynomial` | corrected | Corrected EC V8.3 page to 221; A6 owns the common integral polynomial, and the existing parent Weierstrass determinant target is imported. |
| `tate-uniformization-action` | corrected | Corrected DDT 2.12 proof pages to 57–58; actual Kummer class, choice of splitting and unramified quadratic twist are retained. |
| `additive-elliptic-inertia` | corrected | Corrected DDT 2.14 to Remark and page 58; low-residue-characteristic classification remains G1 rather than silently extending DDT 2.13. |
| `abelian-euler-polynomial` | verified | Checked dual invariants/geometric Frobenius against primal coinvariants/arithmetic Frobenius and the four discriminating polynomial examples. |
| `weierstrass-local-polynomial-comparison` | corrected | Corrected DDT 2.14 kind; pinned minimal-model polynomial uses Nat.card including infinity, and additive comparison remains conditional on G1. |
| `elliptic-conductor-export` | corrected | Corrected DDT 2.14 kind; retains R01.3 wild gap and the E/Q, prime≥5 scope of the residual export. |
| `endomorphism-coefficient-action` | verified | Checked actual endomorphism action, geometric semilinearity and integral order restriction; a rational embedding alone supplies no maximal-order lattice. |
| `lambda-rational-component` | verified | A6 gives uniform factor rank; tensor/idempotent decomposition uses all completion factors and distinguishes split/inert CM examples. |
| `integral-lambda-component` | verified | Maximal-order lattice and ramified reduction are correctly separated; the canonical tensor comparison and uniformizer-dependent map are distinct. |
| `balanced-lambda-pairing` | verified | Rosati-fixed totally real coefficients give balance, trace descent and rank-two determinant; referenced the supplier’s already recorded Rosati misprint. |
| `lambda-oddness` | corrected | Recorded Q8/G8 for the all-prime endomorphism- and conjugation-equivariant Betti–Tate comparison; A4/A5 do not state this full contract. |
| `coefficient-frobenius-comparison` | verified | A6 normal-base Hom extension supplies specialization; field norms recover the Z polynomial without asserting an independent E-valued polynomial. |
| `prime-galois-genericity` | corrected | Corrected general Lean/API equivalence to require compact target; added infinite discrete ambient counterexample while retaining full-GSp and zero-rank conventions. |
| `adelic-galois-genericity` | verified | Joint openness uses the product of full lattice-similitude groups, and the constant binary subgroup distinguishes it from primewise openness. |
| `genericity-transport` | verified | Checked finite extension and commensurable lattices; polarization change uses scalar centralizer after one full-GSp image is open. |
| `independence-predicate` | corrected | Added Richard–Yafaev definition page 8; product of actual restricted images and compactness criterion are distinct from ambient openness and pairwise independence. |
| `uniform-potential-unipotence` | verified | The same finite extension and finite bad set work at all off-diagonal primes; SGA7 geometric proof remains explicitly G3. |
| `serre-bounded-independence` | verified | Read B/PST and finite exceptional-prime reinsertion through Serre §8; G4 and generic compact linear integration remain explicit. |
| `independence-of-abelian-tate-actions` | verified | Uniform rank and potential semistable input instantiate the full Serre criterion without maximal-image or polarization exclusions. |
| `common-connectedness-field` | corrected | Corrected LP 4.9/6.12 declaration kinds and pages and RY4.9 page 17; semisimplified component comparison remains G5. |
| `common-independent-connected-field` | verified | Connectedness field is taken first and independence reapplied there; no unjustified preservation of independence under arbitrary extension is used. |
| `family-tate-specialization` | corrected | Precise finite-normalization supplier is retained and its absolute-residue/inverse-limit extension is requested in Q4/G7 with a common chosen point. |
| `noot-full-image-specialization` | corrected | Corrected Schneider exercise page 181 and current IG.2 scope; fixed-prime full image still needs Q4/Q5/Q6, never an all-prime specialization. |
| `example-cyclotomic-pairing` | corrected | Corrected DDT 2.8 page; arithmetic/geometric Frobenius and conjugation agree with the actual roots-of-unity twist. |
| `example-split-tate` | verified | Verified nonsplit Kummer extension, coinvariant eigenvalue 1, conductor 1 and residual valuation criterion; semisimplification loses the conductor. |
| `example-supersingular-good` | verified | Four points over F₃ and trace 0 give X²+3 and 1+3T²; no false α_p² product is inferred. |
| `example-cm-over-q` | verified | Actual CM endomorphism is defined over Q(i); Q action is semilinear, split/inert factors have rank 1 and full GL₂ openness fails. |
| `example-frobenius-five` | verified | Eight points over F₅ give trace −2, determinant 5 and reciprocal1+2T+5T²; inverse/dual conventions agree. |

## API, tests, prototype and planets

All nine definition/construction APIs cover the operations actually used downstream. The new division-field structure entries avoid unfolding the fixed-field definition. Every such target has at least three tests. The 32 tests retain nonzero torsion, the whole splitting field, actual CM split/inert components, ramified λ-versus-ℓ reduction, uniformizer dependence, all four local polynomial cases, dyadic topology, CM centralizers, and both coordinate-openness and pairwise-independence traps. The two added tests specifically reject the incorrect statements found in this review.

The reader’s signature ledger explicitly lists geometric hypotheses omitted from the old-pin prototype; object-valued supplier fixtures and `sorry` remain labelled as such. No arbitrary proposition stand-in is introduced. The six planets identify central constructions or named theorems and retain their mathematical names. Suggested signatures do not claim implementation.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.6.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.6.lean`: elaborated at the pinned shared build; only declaration-uses-sorry warnings.
- `git diff --check`: passed.

The orchestrator should route Q4/Q5 to the inverse-Galois owner, Q8 to the abelian-realization owner, and Q6 to the existing profinite direction’s Part II request. G1–G6 remain the earlier explicit proof inputs; G7/G8 are the newly recorded adapter gaps. Assembly must preserve these boundaries, the Tier 7 arithmetic ownership of uniform potential unipotence, and R01.3’s conductor gap/repointing note. This review accepts the complete planning pass under the issue’s stated rule permitting honest open gaps; it does not mark the proof graph closed.
