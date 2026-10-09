# BP-ArithmeticGaloisRepresentations--R01.3

Codex, session codex-RCESYh; issue #7957. This is a completed target-level planning pass for R01.3, following the current `detail.json` and WORKERS instructions. It is submitted for independent review, not as a checkpoint. The packet is `complete`; the stage is `planned`, not `closed`. Nothing is claimed implemented.

## Deliverables and checks

The continuation contains 24 nodes: 11 definitions, one construction, nine theorems and three comparisons. Its definitions and construction have 36 API items and 36 unit tests. It selects six planets and cites 14 declarations read at the pinned libraries. It imports 48 existing R01.3 targets by ID rather than duplicating their nodes. The reader is approximately 10,500 words and includes the imported conductor calculus, all new statements, hypotheses, proof outlines, APIs, tests, sources and supplier contracts.

The pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Current upstream LocalFieldsRamification, LocalGaloisGroups, EllipticCurves, ClassFieldTheory and representation-theory documents were also read, including the full InductionRestriction and ModularInduction documents. Current ramification declarations were checked separately from the pin: their existence after the pin is not asserted as baseline availability. The newer upstream roadmap collection was checked for overlap.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.3.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.3.lean`: elaborates at the pins, with declaration-uses-sorry warnings only. This verifies signatures, not proofs.
- The combined principal-clause replacement graph described below has 337 nodes and no cycle. The check includes the imported parent packet and the simple-lifting refinement.
- Every new definition/construction has a recorded use, at least three API items and at least three discriminating tests. Their API/test names appear in the suggested file, with omissions identified explicitly where the required carrier cannot be stated.

## What the pass establishes

The ramification convention is separable-closure based. Finite wild factorisation is distinguished from finite inertia factorisation; a quotient killing only the wild kernel does not justify the Artin sum's zeroth term. Break summands come from normal-subgroup averaging projectors. Swan uses weighted breaks; Artin uses actual inertia invariants, preserving unipotent monodromy. The definition is rational-valued before the separately imported integrality theorem is applied. This separates a conductor's construction from the proof that its exponent is a natural number.

The equivariant simple-character lifting input now has a central-idempotent proof, with chosen root identification and subgroup-invariant rank comparison. It supplies the missing input of the parent's wild-character lift and orbit integrality argument. Maschke alone is not claimed to produce that lift.

The reader distinguishes raw residual torsion from global semisimplification. Artin satisfies the greater-than-or-equal inequality in an exact sequence; Swan is additive. The two dyadic quadratic characters have different weighted breaks, and the residual elliptic formula is stated for raw torsion. The rational-point example of discriminant minus eleven detects an incorrect transfer to global semisimplification.

Brumer–Kramer's digit function, rational constituent lift and constituent estimate are explicit targets. The coefficient root-degree and dyadic self-duality hypotheses of Theorem 5.5 are retained. The sharp elliptic bounds are restricted to finite extensions of Q_p; the Q₂ and Q₃ specializations are eight and five. Generic representation-theory inputs are requested from their existing owner; arithmetic estimates remain here.

## RT-AREA-langlands-1/6 and ownership

The uniform Ogg target includes mixed characteristic (0,2). Its prerequisites now name the surface Artin invariant, determinant discriminant order, minimal Weierstrass/regular-model comparison, the elliptic exponent, Saito's verified statement, StableReduction layers 4–5 and EllipticCurves layer 4. The component count is geometric irreducible components counted once, including those of higher multiplicity; it is not the Néron component-group order.

Liu's notes state the Saito theorem in the needed scope and prove the elliptic deduction. The finite-extension defect identity used in Saito's original proof remains a specific proof gap. Thus the statement covers residue characteristic two, but this pass does not falsely close its proof chain. R29.4 at two still requires closure of that input.

The restricted elliptic minimal-model smooth-locus and differential-lattice comparison moves down to this R01.3 interface. NeronModelsAndSemistableAbelianVarieties R11.2 is higher in the upstream order and must import `elliptic-minimal-model-comparison`; it is not a prerequisite. Likewise the restricted curve cohomology and determinant inputs must be supplied at this tier, rather than cited upward from general étale/duality theory. The general theories import these restrictions.

R01.6's conductor comparison imports `uniform-ogg-comparison` from here. EllipticCurves layer 2 already supplies the elliptic Tate module and Weil pairing used by this restriction. General abelian Tate modules remain in R01.6. No R01.6 conductor comparison is used to construct its own R01.3 input.

## Assembly instructions

Do not simply concatenate this packet with the parent: its 14 principal bundles are refined here. The original parent packet was not edited, and this continuation uses new node IDs as the issue requires. An assembly should preserve the original principal IDs where required, transplant the relevant refined statements/API/tests into them, and redirect consumers to the following interfaces. All entries below are suffixes of `ArithmeticGaloisRepresentations:R01.3/`.

| Parent principal ID | Refined interface in this part |
| --- | --- |
| breaks-and-swan-conductor | swan-from-breaks, with absolute-upper-filtration and finite-wild-break-decomposition as prerequisites |
| artin-conductor-with-its-wild-part | artin-from-actual-inertia |
| conductor-of-a-weil-deligne-representation | wd-from-monodromy and wd-actual-inertia-invariants |
| global-conductor-and-prime-to-p-conductor | global-away-conductor and residual-prime-to-coefficient-conductor |
| upper-numbering-of-an-open-subgroup | separable-extension-herbrand |
| conductor-of-an-elliptic-curve | elliptic-exponent-and-parts |
| saito-conductor-discriminant | saito-verified-statement |
| saito-genus-one | surface-artin-conductor, determinant-discriminant-order and elliptic-minimal-model-comparison |
| ogg-formula | uniform-ogg-comparison |
| ogg-formula-descent | unramified descent step and supplier contract of uniform-ogg-comparison |
| ogg-formula-tame | characteristic-at-least-five specialization of uniform-ogg-comparison |
| elliptic-conductor-values | elliptic-local-independence |
| elliptic-conductor-exponent-bounds | dyadic clause of elliptic-sharp-exponent-bounds |
| elliptic-conductor-bound-residue-3 | triadic clause of elliptic-sharp-exponent-bounds |

The 48 `importedTargets` entries remain supplied by the parent. Add `prime-to-characteristic-simple-lifting` to the imported `wild-character-lift` prerequisite list; its cyclic-stabilizer extension uses the existing Clifford/projective interface. The ordinary finite-group integrality theorem does not prove simple lifting, and the rational Artin definition does not depend on its own integrality theorem. Preserve this direction when reconciling dependencies. Global ideal formation does require integrality.

Redirect residual consumers to the residual conductor interface, and genus-one discriminant consumers to both the surface invariant and determinant comparison as appropriate. Choose the six planets of this part when reconciling the old bundles; do not accumulate a second set of six on the same layer. Reconcile the new `TauCeti.ConductorR013` suggested namespace with the parent's `TauCeti.Conductor` namespace during assembly, after review.

## Five remaining gaps and ten supplier requests

1. **Perfect infinite residue fields.** Extend the existing LocalFieldsRamification vocabulary as Part II to complete DVR fields with arbitrary perfect residue field: finite upper quotient compatibility, lower subgroup/tower calculus, different and absolute inertia images. Serre 1961 verifies the mathematical scope. This is a carrier/supplier gap, not an assertion that the original local-field interface already covers these fields. Layers 3 and 4 have separate requests.
2. **Curve cohomology and determinant carriers.** Supply the finite-dimensional H¹ étale representation, proper specialization/Euler formula, perfect direct-image determinants and dualising lattices for minimal regular curves of genus at least one. The canonical smooth-curve discriminant isomorphism is base-change compatible and compares the square of the dualising sheaf with the thirteenth determinant power. The genus-one comparisons are explicit here. StableReduction layers 4 and 5 supply the model/resolution and base-change statements; the restricted cohomology/duality inputs move down as above.
3. **Saito's finite-extension defect identity.** Obtain and verify the original proof's matching defects of determinant order and cohomological Artin conductor. Semistable reduction and determinant functoriality alone do not supply that equality.
4. **Local reciprocity filtration.** ClassFieldTheory layer 7 supplies the arithmetic Artin map and character-conductor minima, but the current reader does not state the density of the image of the nth unit group in the nth upper ramification image. The exact compatibility, including units at zero, is a ClassFieldTheory Part II request. No second reciprocity map is planned.
5. **Rational p-group interfaces.** InductionRestriction layers 5 and 7 must expose the character-field/Schur-index dictionary, rational Clifford induction and the p-group classification used by Brumer–Kramer Propositions 4.4 and 4.6. These generic refinements do not transfer ownership of the arithmetic bounds.

The ten requests are LocalFieldsRamification 3/4, InductionRestriction 5/7, StableReduction 4/5, EllipticCurves 2/4, NumberFieldArithmetic 5 and ClassFieldTheory 7. The packet states each needed proposition and its consuming nodes. The EllipticCurves imports cover good-model specialization and Tate-module/reduction invariants; NumberFieldArithmetic supplies actual local restriction and ideal exponents.

## Exact limits of the compiled prototype

Concrete signatures use Tau Ceti's absolute Galois group, Mathlib invariants and products, finite-dimensional modules, height-one prime ideals, finitely supported products, base-p digits, valuation extensions, actual ramification indices and minimal Weierstrass reduction predicates. The separable-extension Herbrand signature requires separability explicitly.

The absolute finite-image and zero/inertia identifications, finite lower-sum comparisons, Herbrand subgroup-index/different APIs, global ideal valuation dictionary, residual representation functors and elliptic Tate-module/isogeny comparisons are omitted where the pinned supplier carrier is unavailable. Their exact mathematical statements and names remain in the reader and suggested-file comments. The surface Artin/determinant definitions, their six APIs and six tests, the full Saito/Ogg interfaces and the rational-character lattice/Schur-index theorems cannot yet be expressed against those pinned carriers. No proposition-valued surrogate is introduced.

The unbundled Weil–Deligne expression is a numerical formula on existing representation data, not a replacement for the genuine Weil/monodromy functor. The generic global ideal constructor accepts an exponent function, and the rational residual constructor accepts local prime exponents; neither claims to construct a substitute representation. The weighting test checks finite lower-sum arithmetic separately from its missing field-specific quotient identification. The full elliptic statements are authoritative in the reader; the compiled exponents and reduction tests do not construct the absent Tate module.

## Sources and where to resume

Nine public sources were inspected: Ulmer, §§1–10, pp. 1–9; Brumer–Kramer, Lemma 2.7 p. 230, §§3–5 pp. 231–242 and Theorem 6.2 p. 243; Serre 1961, §§3.1 and 3.7 pp. 126–128 and 137–139; Serre 1969/70, §§2.1 and 2.3–2.4, PDF pp. 6–10; Serre 1987, §§1.2 and 4.9 pp. 180–181 and 214–216; Serre–Tate Theorem 2 and proof, pp. 496–498, on page images; Liu's complete five-page Ogg–Saito notes; Liu 1994, pp. 51–52 and 58–59; Darmon–Diamond–Taylor, §1.1 and Propositions 2.11–2.13/Remark 2.14, pp. 57–58. URLs, hashes, access dates and exact locators are in the packet and reader.

Saito's original Duke 57 (1988), 151–173, DOI `10.1215/S0012-7094-88-05706-7`, was not obtained. Its restated theorem is not represented as a reading of the original proof. Ogg's original paper, Tate's Corvallis Part II article, the strict noncyclic Local Fields exercise, Katz's book, and the Lockhart–Rosen–Silverman and Livné papers are not read-source claims. No private book files or source passages were copied into a deliverable.

Resume from the five gaps and exact supplier contracts, using the assembly mapping above. Review the conductor conventions and source scope before packaging; do not turn `planned` into `closed` until those inputs are supplied. Scratch files are not part of the handoff and are not needed to reproduce the plan.
