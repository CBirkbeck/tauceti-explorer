# Fixes to Kisin–Madapusi Pera–Shin (2022)

Job `FIX-RT-PAPER-KISIN-MADAPUSIPERA-SHIN-22`; [issue #5512](https://github.com/CBirkbeck/tauceti-explorer/issues/5512). Codex, session `codex-rtOQ9t`, 2026-10-01. All four independently confirmed findings are applied. Independent fix review is pending.

Read the current extraction, its relevant reader sections and route briefs, the red-team report and verified findings. The fixes change only the three named deliverables. No item is split, so all 244 IDs and classifications remain: 16 library, 38 planned, 190 missing. All six route memberships remain unchanged and every missing item is routed once. All 49 historical source records and independent verdicts are preserved; E10 remains rejected.

## 1. L14 is geometric; T26 owns coefficient Hom/Isom

L14 now states the pinned predicate on an ordinary f:A→B of abelian varieties over a field K: its underlying scheme morphism is finite and surjective. No separability assumption is imposed. Its library status applies only to that statement. The API explicitly distinguishes the finite-surjective characterization, geometric composition and field extension from coefficient algebra operations.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read the complete `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean`: `IsIsogeny`, `isIsogeny_iff`, `isIsogeny_id`, `IsIsogeny.comp` and `IsIsogeny.baseChange` have this scope. The reviewed AUDIT-02 isogeny row agrees and does not assert general torsion or Frobenius theorems. Mathlib remains pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`. No new implementation is claimed.

T26 already owns the missing rational isogeny scheme at `AbelianSchemesAndArithmeticModuli:A6`. It now explicitly constructs H=Hom(A,A′)⊗Q, Hom_Q=Spec Sym(H^∨), natural R-points R⊗_Q H, composition, the open invertible locus and its source-Aut_Q torsor structure. The unit group is the determinant-open locus for left multiplication in finite-dimensional End^0(A). This uses P09 for Hom finiteness, P15 for semisimple End, and T01 for its units, keeping one owner. Its API exposes Hom points, scalar-extension functor laws and the torsor identity.

For the equal-dimensional fibers in the source, the one-sided-unit criterion agrees with a two-sided inverse. After the faithful flat coefficient extension to Q_ell, the faithful rational Tate realization is a square matrix. A left inverse implies its determinant is a unit, hence a right inverse; faithful Hom detects the categorical equality. This needs the faithful-Hom injection, not a full Tate-surjectivity theorem. It is not generalized to unequal dimensions: A→A×B has a left inverse when B is positive-dimensional but is not an invertible arrow.

The new coefficient test uses R=Q[ε]/(ε²) and f=(1+ε)id_A. Its inverse (1−ε)id_A follows from ε²=0. The characteristic-p ground field of A is unchanged; these are neither ordinary geometric morphism coefficients nor a characteristic-zero base extension of A.

Read the current A6 description, related reviewed AUDIT-08 library targets, and its existing packet. The packet plans `A6/hom-is-free-of-finite-rank`, `A6/poincare-complete-reducibility`, `A6/hom-to-tate-module-homs-is-injective` and `A6/endomorphism-algebra-is-semisimple`. These supply planning interfaces, not baseline implementation. No exact coefficient-Hom/Isom construction was found among its nodes. The revised T26 and A6 source route are the concrete handoff to that same owner's design work; the issue permits only paper deliverables, so its packet is not edited. No new roadmap or competing owner is needed.

## 2. Ignore absent central weights in the strict condition

T18 retains positive multiplicity for nonzero classical representations, along with the specified A/B/C/D list and selected D type. T19(ii) quantifies only over occurring algebraic central characters, V_χ≠0. An absent character imposes no admissibility obligation. This is one of the two conventions permitted by the finding and avoids arbitrarily giving the zero module a classical D tag. Ambient faithfulness and nonzero V are separate requirements.

The active statements, notes, API/tests and the Part II brief all use this convention. Tests cover an absent weight and an occurring part specified as a positive multiple of the designated D^R module. They also reject a nonadmissible occurring part. These are tests of the admissibility/support interface, not a claim to construct a new full Hodge-type D datum. For a finite-dimensional V only finitely many central weights occur, so universal quantification together with positive multiplicity would otherwise fail at infinitely many absent characters.

This inconsistency was introduced by the extraction's positive-multiplicity wording. The source says a multiple; no new source error is attributed to it for this repair.

## 3. Assemble factors with a common multiplier

T19's accommodating contract now has a datum map φ:(G,X)→∏(G_j,X_j), strictly accommodating factor embeddings, a symplectic isometry ⊕V_j≅V, and equality of the resulting block-sum representation with the given embedding. It retains φ^der:G^der≅∏G_j^der. The pulled-back factor similitude characters all equal the given c:G→G_m.

Consequently the image factors through H_eq=∏_{G_m}GSp(V_j). Block diagonal action then gives H_eq→GSp(V), because each summand form is multiplied by the same scalar. Compatible factor Hodge weights, polarization signs and selected real orbits identify the direct sum with each original h∈X. A datum square uses the compatible orbit in H_eq; the whole product of independent Siegel half-spaces is not silently substituted. Generic symplectic/PEL group and datum interfaces are imported; accommodating conditions remain in this Part II.

For J=(0,1;−1,0), Ω=diag(J,J), the block swap S=(0,I₂;I₂,0) satisfies S^tΩS=Ω while exchanging the ordered subspaces. The full GSp(V) has no restriction map of the printed kind. Conversely D=diag(2,2,1,1) satisfies D^tΩD=diag(4J,J), hence is not a similitude of Ω. Reversing the printed arrow alone therefore fails. A pair with common multiplier, such as diag(2,2,2,2), gives multiplier 4 on Ω and passes.

E50 records this additional author-copy discrepancy at §2.2.6, p.26, including a faithful transcription of the right arrow, the two counterexamples, common-multiplier correction and fresh version/search evidence. E4's terminology correction is preserved; it did not repair this square. E50 affects this stated definition and does not claim the main theorems false. It awaits independent fix review and is not asserted against the uncollated Duke version.

## 4. Select a real orbit covering the lifted component

T23 keeps the corrected G′=G×_{G^ab}T. It now chooses one X′=G′(R)·(h_T,h_T), rather than the whole X×{h_T}. To cover the chosen generic lift with complex representative h₀, first conjugate a rational special pair using the existing `real-approximation-adjoint` input so h_T belongs to the same connected component X₀. This uses the paper's §2.2.7 real-approximation argument, which remains a planned supplier at AA.4.

The projection G′→G is a smooth surjective central-torus extension. Its differential is surjective, so its real image contains an identity neighborhood and hence G(R)^0. That component acts transitively on X₀. Thus some lift acts on (h_T,h_T) to give (h₀,h_T), proving the selected orbit covers h₀. Matching the component also aligns the two polarization signs; equal abelianized images give equal similitude factors for V⊕V.

The lifting step then uses that selected datum, the source's required level/Hecke choices, and a compatible reflex-field place. The assertion concerns the abelian variety with tensors, not its level; it uses the same level choices as the argument on pp.27–28. The generic auxiliary object is isogenous to A_s×A_T. The first factor has good reduction; P10 supplies potential good reduction of the CM factor. S02, with its precise rigidifying-level and valuation/place hypotheses, extends the point after a finite DVR extension and yields s′₀ over s₀. These explicit prerequisites are added to T23. Their general proofs remain supplier/design work under G-model; no component-blind integral-model surjectivity is asserted.

The existing kernel and compatibility steps are unchanged: ker(G′→G)=1×(T∩G^der) dies in G^ab, so the composite from I_{s′₀} factors through the required surjection and matches each realization map.

For G=GL₂ and T the imaginary-quadratic CM torus, det g=N(t)=|t|²>0 for every projected real point. The fractional-linear formula Im(gz)=det(g)Im(z)/|cz+d|² shows that each half-plane is preserved. X×{h_T} therefore contains two orbits. Conjugating the special pair by diag(1,−1)∈GL₂(Q) puts it in the other component; that component uses its own datum. This test checks both the failure of the old whole-product choice and the corrected coverage strategy.

This propagates the already accepted E5 orbit correction; it neither duplicates E5 nor claims Lemma 2.2.8 false. The JSON's 49 old source records and review objects are unchanged. Historical whole-product sentences in earlier reader checkpoints are explicitly superseded by the current correction.

## Source versions and bounded correction search

Fresh reading used the [41-page Berkeley author PDF](https://math.berkeley.edu/~swshin/HT.pdf), 546,242 bytes, creation metadata 27 January 2021, SHA-256 `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`. On 2026-10-01 read pp.15,25–31 and inspected images 26,28,30,31. Earlier full extraction and red-team readings remain provenance; this fix claims only that fresh bounded reading.

Checked [Shin's publication page](https://math.berkeley.edu/~swshin/), [Kisin's preprints page](https://people.math.harvard.edu/~kisin/preprints.html) and [Madapusi's research page](https://keerthimadapusi.com/research), plus bounded exact-title/author correction searches. Shin links the unchanged PDF. Read both pages of [Shin's errata list](https://math.berkeley.edu/~swshin/errata.pdf), SHA-256 `0c84c8d54cbfd222e6810677f4e765eac9b27c6070ac4df5572b64780ab782be`; the entries concern other papers. Fresh [Crossref metadata](https://api.crossref.org/works/10.1215/00127094-2021-0063) has an empty relation object and no update-to entry.

The [Project Euclid PDF endpoint](https://projecteuclid.org/journals/duke-mathematical-journal/volume-171/issue-7/HondaTate-theory-for-Shimura-varieties/10.1215/00127094-2021-0063.pdf) returned HTTP 200 text/html, 1,156 bytes, not article text. The published Duke text is not collated. No applicable correction was found in these limited checks; that is not proof of absence. No author was contacted.

## Validation

Passed the paper checker, intake on all three deliverables, shared source-issue/version checks, identity/classification/route and acyclic-dependency preservation checks, exact dual-number and symplectic-matrix calculations, character-support checks, and the GL₂ component/CM-conjugation test. All 190 missing items remain routed once; the existing thirteen routed planned items remain unchanged. `git diff --check` passed. No Lean deliverable was required or compiled. No broader implementation or recursive supplier-proof closure is claimed.
