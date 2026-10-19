# Handoff: PKG-ModularIwasawaMainConjectures

Completed package job #10773 by Codex (OpenAI), session `codex-u80FTH`, on 2026-10-19. Branch: `codex-u80FTH-modular-iwasawa-package`. This is a finished package, not a checkpoint. No second job was claimed. The accepted blueprint was written by Claude and reviewed by another Codex session; this is not a review of my own work.

## Deliverables and coverage

- [README](../packages/ModularIwasawaMainConjectures/README.md): all 46 accepted targets in seven layers, all 90 existing named API outputs plus the explicit `HasRankOneCoinvariants` interface, all 49 input tests and their acceptance checks, expanded negative controls, worked examples, exact supplier contracts, source locators and downstream uses.
- [Suggested.lean](../packages/ModularIwasawaMainConjectures/Suggested.lean): representative signatures only, with six real-bodied definitions, four named theorems and 38 examples. Arithmetic carriers unavailable at the pins remain README targets and are named in the closing comment. No admitted data definition or auxiliary theory construction.
- [metadata.toml](../packages/ModularIwasawaMainConjectures/metadata.toml): `topic = "math.NT"`.

The input packet, reader, original suggested file and independent review were read but not edited. Every target has a source locator and explicit prerequisites; every definition/construction has at least three discriminating Checks. The package states conditional comparisons as conditional. It does not claim formalization of any arithmetic theorem.

## Corrections made while packaging

Besides retaining the accepted review’s period, unipotence, signed-component, derived-specialization and p-adic BSD corrections, direct source reading required three convention repairs:

1. Skinner 2016 §2.3, p.8 defines the scalar Λ-module dual by precomposition with the scalar, without the involution. The packet instead wrote the contragredient representation action and retained the same analytic function. The package separates these duals: all characteristic ideals use the scalar dual; a conversion applies ι to both the algebraic ideal and analytic function. In particular, the scalar dual preserves the tame η-component, and its discrete coefficient twist over Q∞ is η⁻¹. The F₇ scalar example distinguishes 2 from its inverse 4.
2. In that convention, Skinner §2.3, pp.8–9 gives the Euler polynomial on inertia **coinvariants**, with arithmetic Frobenius, evaluated at ℓ⁻¹γℓ⁻¹. The explicit factor was corrected throughout. SU’s geometric-Frobenius notation cannot be substituted while retaining the same group-ring argument. This is a convention alignment, not a new claim that a source’s theorem is false.
3. Skinner’s multiplicative theorem uses the inertia-kernel ordinary condition. At split multiplicative reduction, the strict decomposition kernel is a separate auxiliary condition, with correction A⁻/(φ−1)A⁻=L/O. The package retains it; for the good ordinary eigenvalue α≠1 that correction vanishes.

The modular elliptic-curve dictionary now chooses the inverse image of T_pE under the rational modular isogeny. An arbitrary stable lattice is not automatically the Tate lattice. The localization exact sequence states its large-Σ hypothesis; comparisons of arbitrary imprimitive sets pass through a common larger set. Unequal-length determinant controls fix the overall sign as well as the relative sign. The interpolation factor is expanded using the primitive conductor n (Kato Theorem 16.2, p.269), distinct from the root-of-unity index t; the trivial good-ordinary weight-two factor is the square (1−α⁻¹)², while the multiplicative one is a single factor. The finite-dimensional residual invariant predicate is now explicitly finite-dimensional in Lean.

## Library and ownership audit

Read the reviewed library audit, the pinned declarations used by the Lean file, the current upstream roadmaps and current Tau Ceti. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only upstream: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Checked all nine post-snapshot roadmaps, the nested OperatorTheory files and all four Completed roadmaps by mathematical object. No modular Iwasawa target here is already present. LocalGaloisGroups’ cyclotomic/Kummer and group-theoretic Iwasawa inputs are reused; IntegralLattices’ quadratic lattices and AlgebraicVectorBundles’ determinant bundles are distinct from stable Galois lattices and determinants of perfect Iwasawa complexes. No existing roadmap is replanned.

Current Tau Ceti’s formal Tate curve, specialization, Kummer interfaces and finite two-descent Selmer group are cited at the boundary; none is reconstructed. The additional local elliptic contract asks for point uniformization and the away-from-p residual inertia criterion, not another formal Tate curve.

Current Tau Ceti also already constructs `TauCeti.completedGroupAlgebra`, its `proj`, `of`, `map`, `map_of`, the ℤ_p-linear `powerSeriesCoordinate` with its `X` and `one_add_X` formulas, and `monoidAlgebraProdEquiv` for finite tame products. These are explicitly reused in the supplier boundary. Only their finite O-coefficient extension and the characteristic-ideal/determinant interfaces remain supplier outputs. The coordinate theorem was not incorrectly promoted from ℤ_p to all O.

No ownership moves or changes to other roadmaps were made. The Caraiani–Newton order file was read: this roadmap is outside its 94-root closure, so no new tier number is invented. The package retains the accepted external owner/layer contracts, including the signed regulator owner and separate arithmetic branch owners. Before upstream porting, the maintainer must route those suppliers under the programme’s prerequisite policy; an exact requested output is not evidence that an owner already supplies its proof.

## Explicit obligations retained

All nine accepted obligations remain visible in the mathematics:

1. Construct the arithmetic cyclotomic height and its regulator; NE.7’s Bockstein target alone does not supply it.
2. Compare Schneider’s flat Néron-model alternating characteristic factors with ordinary Galois Selmer, including the height and X↔s normalization and the nonunit logarithmic factor.
3. Fix the weight-four ramification-at-5/level-lowering input before using the eta-product at p=7 as an unconditional application.
4. Supply the imaginary-quadratic elliptic-unit, Hida–Tilouine and anticyclotomic Katz μ inputs for the Eisenstein branch; no new owning roadmap is fabricated here.
5. The unproved general canonical/Gross-period route is not used in the selected FW ordinary argument.
6. Supply the O-unit Kato-good-pair/canonical-period comparison for the general-weight integral Selmer formulation.
7. Supply Hida approximation and compatible principal-ideal congruences at p=3 for Skinner’s multiplicative theorem; the existing p≥5 endpoint is insufficient.
8. Supply independent compatible KMC inputs before extending the signed application to nontrivial tame η; keep LLZ’s index restriction.
9. Supply the integral Néron/Pollack period-unit comparison before replacing the transported LLZ actual-image quotient by a separately normalized ± analytic expression.

The thirteen requests are expressed as exact supplier contracts. The accepted version-scoped source findings are retained mathematically, not promoted into a new errata job. No author was contacted. No source text or verbatim passage is included in these deliverables.

## Adversarial mathematics pass

Each row covers the section’s statement, named API outputs, conventions and Checks. Positive, degenerate and negative controls were checked against the stated range. Arithmetic source theorems are used as the specified supplier endpoints; numerical tests do not replace their proof.

| Section | Instances tried | Result or change |
| --- | --- | --- |
| 0.1 | 11a1 at 7; 14a1 at 5; homothetic and p-isogenous lattices | Specified the inverse-image Tate lattice; arbitrary lattices give a rational comparison only. The unramified cohomological line becomes the ramified ordinary line after the determinant twist. |
| 0.2 | α≠1 versus split multiplicative α=1; tame scalar 2 in F₇ | Separated the multiplicative inertia kernel from the strict decomposition kernel. Replaced the packet’s contragredient Λ-dual with Skinner’s scalar dual, and adjusted the η twist accordingly. |
| 0.3 | 11a1 local torsion at 11; arbitrary torsion module with finite submodule | Kept the local hypotheses for no-finite-submodule and projective-dimension-one Fitting assertions; torsion is a theorem rather than part of the definition. |
| 0.4 | m=0,1; canonical versus rescaled period; split multiplicative Euler factor | Kept the m+1 cohomological-period exponent, separate differential period P_f, and explicit integral period-unit obligation. Euler polynomial uses arithmetic Frobenius on inertia coinvariants and inverse Γ argument. |
| 0.5 | Λ/(ϖ), Λ/(X), zero module; rational versus integral ideals | Kept finite generation, torsion and analytic nonvanishing explicit. Inverting ϖ removes μ-information but is not extension to L[[X]]. |
| 0.6 | Two-term differential a; z=e,H²=Λ/(X²); z=X²e,H²=0 | Added unequal-length witnesses fixing the overall inverse-determinant sign: divisors +2 and −2. Did not identify a torsion-only complex with one having a free H¹. |
| 0.7 | Primitive versus Σ-partial zeta element; missing rank-one or nonzero zeta hypotheses | Kept the rank-one Betti factor and nonzero rational trivialization; integrality of a zeta map differs from being a basis. |
| 0.8 | Equal lengths 2−2; unequal lengths 2−0 and 0−2 | Checked char(H²)−char(H¹/Λz), not their sum; retained all torsion/perfectness hypotheses. |
| 0.9 | Ordinary Tate line; period ratio ϖ; residual-unipotent lift with det(g−1)=−ϖ | Kept exact lattice and good-pair normalizations; integral comparison requires an actual rank-one-coinvariant witness and an O-unit period ratio. |
| 0.10 | Zero/full Coleman kernel; injectivity of global-to-local map; basis change | The Poitou–Tate sequence’s left injection needs torsion of X and torsion-free rank-one H¹. Signed local conditions use the specified integral domain and Tate orthogonality. |
| 0.11 | Image I=(X), zeta image X²; rational versus integral analytic factors | The analytic quotient is I/ΛL, giving characteristic ideal (X), rather than automatically (L)=(X²). Integral Pollack normalization is separate input. |
| 0.12 | LLZ index 1 at all η; index 2 only η=1; missing hypothesis (E) | Retained exact index/component range, torsion and rational/integral distinction; no all-components consequence of the FW theorem. |
| 1.1 | Trivial and independent diagonal characters; I=D; ω=1; locally irreducible case | All residual predicates have positive and negative controls. Added finite-dimensionality to the Lean invariant-dimension predicate. Scalar exclusion and exceptional-pair exclusion are different. |
| 1.2 | Standard unipotent; upper entry ϖ; identity; determinant-one nonunipotent lift | Only actual characteristic-zero unipotence with nonzero residual nilpotent gives free rank-one coinvariants. Added a separate real-bodied coinvariant predicate and its tests over a DVR. |
| 1.3 | 11a1 at 7; p=3; k not congruent to 2 modulo p−1 | Kept all SU source hypotheses and the GU(2,2) product bound. The integral assembly uses the inertia unipotent and does not substitute the stronger FW auxiliary condition. |
| 1.4 | 14a1 at 13; 11a1 at 7; general even weight | Kept I-invariants of dimension one and D-invariants zero in cohomological normalization. The reverse bound is the GU(3,1)/Beilinson–Flach route, without an unproved canonical/Gross period comparison. |
| 1.5 | Unit versus nonunit Kato/canonical period scalar | The integral ordinary formulation is explicitly conditional on a proved O-unit comparison; an algebraic nonzero ratio supports only the transported rational statement. |
| 1.6 | 14a1 at p=7; split versus nonsplit; p=3 | Used the inertia-kernel Selmer group. Kept the separate p=3 Hida-approximation supplier contract and congruences of principal ideals rather than chosen analytic generators. |
| 2.1 | Even weight half-twists; removed Euler factor equal to 2 | Specified the cohomological/determinant/Betti dictionary and the inverse dual-Euler factor in primitive zeta normalization, with local determinant corrections. |
| 2.2 | Ordinary, supersingular and potentially semistable local types; scalar and exceptional residual pairs | Kept the ramified twisted-Steinberg extension and the conditional nontriviality of μ. Oddness makes the additional scalar exclusion automatic; the theorem is on η=1. |
| 2.3 | Good ordinary, LLZ supersingular, and unavailable nontrivial η input | Intersection hypotheses remain explicit; ordinary transport has its period-unit condition, and signed transport retains (E) for integrality. |
| 3.1 | Optimal curve; p-isogeny in class 11a; nonunit Manin factor | Chose λ_*⁻¹(T_pE), rather than identifying arbitrary stable lattices. Kept the period ratio and optimality/semistability hypotheses for Manin units. |
| 3.2 | Good ordinary Euler square; nonsplit multiplicative factor; split trivial zero | Kept Néron-normalized interpolation, positive conductor conventions and the distinct multiplicative factors. Irreducibility is retained for the quoted integral normalization route. |
| 3.3 | 11a1 at 7; rational equality differing by ϖ | Mazur’s good-ordinary Selmer group and analytic function are compared using the chosen Tate lattice and period multiplier. |
| 3.4 | Non-CM and CM data; p=3 excluded; irreducible ordinary cases | BCS Theorem 1.1.2 is rational under its stated p>3 ordinary irreducibility hypotheses; non-CM is not an extra hypothesis of this theorem. |
| 3.5 | Actual (Im) witness; irreducibility without such a witness | Kept the integral hypothesis on the cyclotomic-kernel image; did not replace it by irreducibility or claim it is necessary. |
| 3.6 | p≥5 residual GL₂-surjectivity; p=3 outside lifting lemma | Used the closed commutator subgroup, the rank-two SL₂ lifting lemma and cyclotomic determinant. LSTX introduction p.1, not its higher-dimensional Theorem 1, is the locator. |
| 4.1 | Regular O[[X₁,X₂,X₃]] base; singular Hecke/deformation ring | Scoped the endpoint to the regular subring and the residual hypotheses of FW Theorem 5.1; no unrestricted singular-ring trivialization. |
| 4.2 | Non-flat specialization; Euler zero; pure versus arbitrary specialization | Retained derived tensor products, Tor and local determinants. FW Lemma 3.17’s unconditional derived statement is distinct from Definition 3.19’s all-lifts purity condition. |
| 4.3 | η=1; nontrivial η; missing (E); LLZ ordinary local split case | Applied FW only on its actual component and the intersection with LLZ hypotheses. Nontrivial components require an independent compatible KMC input. |
| 4.4 | I=(X), L=X²; B=[[1,0],[1,1]], vector (1,0) | Kept image quotients even when a coordinate of a numerator is a unit. Coordinates transform by B⁻¹, giving (1,−1), and individual kernels can change. |
| 4.5 | a_p=0; p=3 supersingular a_p=±3; rational Pollack multiplier | LLZ index 1 is minus and index 2 is plus in the specified elliptic basis. Kernel transport does not supply an integral Néron/Pollack period-unit comparison. |
| 5.1 | Large versus arbitrary Σ; split multiplicative ℓ=11, γℓ=2 | Stated the ramification-set hypothesis for the displayed localization sequence. The exact Euler factor is 21/22, while replacing γℓ⁻¹ by γℓ gives 9/11; arbitrary-set ideal comparisons use a common larger set. |
| 5.2 | Ramified coefficient extension ϖ=uϖ′^e; unramified extension | Faithful flatness gives ascent/descent of ideal equality; μ scales by e and λ does not. No unramified-only valuation formula used over ramified O. |
| 5.3 | f=ϖ,g=1; equal μ plus rational association; arbitrary DVR | The Lean theorem uses a real power-series divisibility characterization of μ. Rational association alone is insufficient; equal μ removes the ϖ discrepancy. |
| 5.4 | Rank zero; finite/infinite p-primary Selmer; p>3 and weight two | The BCS rational main conjecture plus ordinary control and interpolation supplies the stated rank-zero converse; no higher-rank or p=3 extension. |
| 5.5 | q and q^m; log_p(p)=0; algebraic E with transcendental q | ord_p(q)>0 makes division valid; ℒ=log(q)/ord(q) is invariant under powers, and nonvanishing consumes the transcendence theorem. |
| 5.6 | r=0 with torsion; zero regulator; full versus p-primary Sha | Regulator is e⁻² times the height determinant, so rank zero retains torsion⁻². Exact MTT and its p-primary unit version are different propositions, including when the regulator is zero. |
| 5.7 | Split multiplicative analytic rank zero; nonsplit case | Used Greenberg–Stevens with the nonzero ℒ input and L(E,1)≠0; no split exceptional-zero factor is inserted into the nonsplit formula. |
| 5.8 | r=0,1; zero height; X versus inverse X; log_p(κγ) nonunit | Restricted Schneider’s implication to good ordinary reduction, finite p-primary Sha, nondegenerate height and the explicit flat/Galois/height comparison. Kept the unit u_p and coordinate logarithm. |
| 5.9 | Trivial tame projection versus whole real cyclotomic extension | Matched the Tate dual, criticality, ordinary filtration and interpolation data. This proves modular instances and does not assert general Greenberg or Coates–Perrin-Riou conjectures. |
| 5.10 | 11a1 at 7; 14a1 at 5,7,13; database analytic Sha | Recomputed traces/discriminants and finite-field irreducibility witnesses. Good supersingular at 5 is outside ordinary theorems; (LocExc_3) always fails for ordinary curves. Analytic Sha is not used as an actual Sha proof. |
| 5.11 | η(z)^4η(5z)^4 at p=7 and p=13 | Recomputed coefficients and the nonsquare Frobenius discriminant at 2. The p=7 application remains conditional on a fixed weight-four ramification/level-lowering input; finite p=13 congruences are diagnostics only. |
| 6.1 | Rational versus integral anticyclotomic endpoints; BDP square and involution | Re-exported only the owner’s theorem with its strict/unrestricted conditions, completed coefficients, periods and local cokernels; no new anticyclotomic proof. |
| 6.2 | Reducible Eisenstein residual representation versus irreducible branches | Kept distinguished lattices, character exclusions, local invariants and finite-submodule corrections. The imaginary-quadratic elliptic-unit/Katz/Hida–Tilouine infrastructure remains an explicit branch-supplier obligation. |
| 6.3 | Semistable a_p=0 signed case; multiplicative BDP case | Kept the separate BSD.6a endpoints and all residual/local hypotheses, including at 2; no extension to arbitrary supersingular or multiplicative data. |

The six retained Lean definitions agree with their README predicates over the same carriers: ramification, FW auxiliary invariants (finite-dimensional), distinct characters, exceptional-pair exclusion, free rank-one coinvariants and existence of an image witness. The unipotent and μ-association theorems are over a DVR, including equal-characteristic DVRs; the arithmetic standing coefficients remain finite extensions of Q_p. All analytic denominators have their nonvanishing/range conditions retained. The p=2 cases are outside the stated arithmetic range, not silently included.

## Sources read and reproducibility

Read the primary sources directly at the locators used, including FW §§3.2–3.4/4.8 and Theorems 5.1–5.2; SU §§2.1.2, 3.2, 3.5–3.6; Skinner §§2.3–2.6 and 3.1/3.3; Kato 16.2/17.4–17.6/17.13; LLZ assumptions, image computations and §§6.1–6.2; BCS Theorem 1.1.2 and Remark 1.1.3; RJW §13.5.3 and Appendix B; Rubin III.5.14–5.17; Colmez pp.255–258; Schneider Theorem 2′ p.342 and Theorems 6–7 p.371 (scanned pages visually read); and LSTX introduction p.1. The README gives theorem/section/page locators, not summaries of the papers. Public LMFDB curve data were checked against independent point counts; actual Sha orders are not inferred from database analytic Sha data.

All twelve downloaded source files matched the accepted packet’s SHA-256 identifiers. The following identifies the exact read copies; SU page numbers refer to the 226-page author copy. Findings about FW are scoped to arXiv v3. No uncleared book or private source was used.

| Source copy | SHA-256 |
| --- | --- |
| [preprint](https://arxiv.org/pdf/2107.13726v3) | `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee` |
| [author copy](https://www.math.columbia.edu/~urban/eurp/MC.pdf) | `f9faa40aa5e30eba705da88e3d68c8aa43069b5be01c1cc6ece212dd57879748` |
| [preprint](https://arxiv.org/pdf/1407.1093v1) | `02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988` |
| [preprint](https://arxiv.org/pdf/1405.7294) | `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff` |
| [preprint](https://arxiv.org/pdf/2405.00270v2) | `bf87592cdbaabb5c57004bfd44dd5b4d712cb306bbbdc36520a3daf92fa416f3` |
| [preprint](https://arxiv.org/pdf/0912.1263v3) | `5981c2f6152ba5bfe25c64fcee227db680f4d1e32102a39f067bddb651e52cd5` |
| [preprint](https://arxiv.org/pdf/2309.15692v2) | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |
| [published](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [author copy](https://swc-math.github.io/notes/files/99RubinES.pdf) | `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50` |
| [published](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf) | `992f7a9f00c959d79b3455c4047ffebaf297d73213b294582da6fdb165198303` |
| [published](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF) | `13b45366ef00c1a20e73284b714e7b6e69bd3114c659bd5a04cf9ed03c339207` |
| [preprint](https://arxiv.org/pdf/1607.04698v2) | `693e02f06fb8bb440c20bce51adb791063a9ccc77fd678f46946a672bf2d1170` |

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularIwasawaMainConjectures.json`: zero errors and zero warnings; 46 nodes, 90 API outputs and 49 input tests. The packet is unchanged.
- Coverage inventory: all 46 targets and 90 existing API names occur in the README; 91 named definition interfaces after adding the coinvariant predicate. All input tests and acceptance criteria were carried into the corresponding sections and inspected.
- `lean-check` on the package Suggested.lean: exit 0 at the shared pinned build. Only 24 `declaration uses sorry` warnings; no other warnings or errors. Memory was checked before compilation. No language server or private build was started.
- Intake `check-files` on the four deliverables: zero problems.
- Whitespace and scope checks: only the three package files and this handoff; no local filesystem paths, source excerpts or changes to the accepted input.

The next action is independent package review, with particular attention to the scalar-dual/Frobenius translation and the explicit conditional supplier boundaries. This is not an independent review verdict. Scratch contains no material needed to continue; the public version identifiers, convention changes, remaining obligations and audit are recorded here.
