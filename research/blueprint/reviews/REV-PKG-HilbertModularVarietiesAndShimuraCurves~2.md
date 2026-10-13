# Independent package review: HilbertModularVarietiesAndShimuraCurves, round 2

Reviewer: Codex, session `codex-S48UfE`, 2026-10-13. Refs #9219. I wrote neither package round. **Verdict: needs_changes**, for the concrete mathematical closure and hypothesis defects below. This is a completed fixing review, not a checkpoint.

The October 12 shape rule supersedes the earlier review's requirement to elaborate every geometric definition. The 716-line Suggested.lean has real-bodied light definitions and native-carrier statements; absent geometric declarations are not a defect. The README retains all 181 accepted targets from the five parts, plus the general-field definite Ihara target (§R18.3.8). Its 182 subsections have source locators and prerequisites. Every definition/construction has an API and at least three prose Checks. Namespace changes were normalized when comparing accepted API/test names; the mathematical content was checked separately. No packet was edited.

## Fixes applied

- **H0.5:** the displayed adelic entry conditions plus invertibility over the finite adeles do not give a lattice stabilizer. Required determinant in Ô×, equivalently units of the endomorphism order. Over ℚ, diag(2,1) satisfies the old expression but strictly contracts the 2-adic lattice. Added this negative Check and an elaborated determinant/nonunit example. The trace-dual lattice equality is retained.
- **H4.15:** the former negative Check inferred image membership from one chosen lift. At N=5, p=2, n=1, −1 fails the tame congruence but reduces to the same element as the permitted lift 1. Replaced that inference by the computed collision, and contrasted p=3, where −I differs from I. Added both residue controls in Lean; retained a computed centrality Check.
- **H3 examples:** distinguished a fundamental generator of U modulo torsion from one of U⁺. For ℚ(√3), Δ(1) has order two; for ℚ(√2), the norm-negative fundamental unit makes Δ(1) trivial.
- **Locators:** DP §§1.1–1.5 and 2.1 reaches p.64, not just pp.60–63; Taylor's ordered module is on author p.10; Lemmas 1.2–1.3 span pp.10–12; Taylor 2006's arithmetic reciprocity convention is p.733, not p.731.
- **Supplier and ownership:** replaced the retired AdicSpacesAndPerfectoidGeometry reference by AdicSpacesPartII R2. Named the current twisted-cochain module and its actual contravariant coefficient map. Recorded current trace-dual-family and rational GL₂ Hecke-degree imports in the boundaries; these do not supply the alternating Hilbert lattice or the quaternionic arithmetic coefficient actions.
- **R18.4.12–13:** replaced the library-presence and supplier-bookkeeping Checks by constant/zero coefficients, proper-support equality, and the finite-coefficient affine-line computation H_c⁰=0 versus nonzero H⁰. These test the adapter's coefficient and support choices.
- **Dependencies:** removed R18.2.4 from R18.5.15's prerequisite list. The division-prime proof already uses the separate basic-uniformisation transfer R18.5.13; split-place descent is not that input. The local Needs graph has 380 edges, no cycles and no forward prerequisites in the displayed build order.
- Removed the E-R18.3 process identifiers and the assembly/H0-gap narrative from source explanations and Checks. Corrected the Drinfeld generic-fibre typo. Required m≥1 for the Weil torsion pairing.
- Made H3.8's unresolved Kisin–Lai descent and H6.5's incomplete ordinary/CM input contract explicit in the open-obligation list. Nothing was silently certified by a citation.

## Defects still requiring revision

1. **H6.5 does not state a usable local realization contract.** “Taylor §1's ordinary-extension/CM-character hypotheses” and “the exact Taylor input data” do not specify the residual extension, H_f condition, coefficient CM field, two residue primes, characters/conjugations or polarization norm-class constraint. Reading Lemmas 1.2–1.3 confirms that these are restricted constructions, not a theorem for arbitrary paired local modules. Write the complete input and output contract in own words, with the ordinary and multiplicative cases distinguished, and make both paired torsion comparisons follow from it. The README now labels this defect explicitly; the source-page correction alone does not fix it.
2. **R18.3.29 and R18.4.27 lack the early Galois inputs they promise.** Carayol's Theorem A covers prime-to-coefficient-characteristic local compatibility under his hypotheses, including the finite discrete-series condition in even degree. It does not supply the package's even-degree/no-finite-discrete-series extension or the weight-two semistable compatibility above p. Both proof routes expressly say the needed argument has not been located. Supply exact primary theorem locators and the normalization/determinant conversion, or narrow the affected targets and downstream claims to the proved cases. Naming an early target avoids a cycle but does not establish its missing proof input.
3. **R18.2.14 and R18.2.17–18 retain an unclosed ramified filtration/determinant step.** At a ramified place, the raw embedding quotient is not exact, so tensoring a Tate comparison does not yield the stated integral Hodge/determinant formula. The README requires a saturated relative filtration, but neither gives its construction/comparison nor an exact supplier result proving it. Supply the filtration contract and determinant argument, or explicitly restrict the result to the unramified direct-summand case and adjust consumers. The node xy=π and ramified base change xy=π_L^e also prevent a blanket regular/smooth assertion.
4. **H3.8 has no complete polarization-component Hecke descent route.** It itself leaves Kisin–Lai §1.9 untranscribed. The A3 quotient/dual isogeny is not by itself the ordered polarization, representative-change and unit-quotient descent needed by the target. State that argument with its level/coprimality assumptions or source it precisely.
5. **R18.4.19's potentially semistable quotient remains unverified at the primary source.** Manning–Shotton §3.2, p.14, gives the point criterion and dimension and attributes the construction to Kisin; this is a meaningful secondary locator, not verification of Kisin's actual theorem. The available author endpoint returned HTTP 403. Record Kisin's numbered theorem/pages, its framed/fixed-determinant convention and the dimension conversion before claiming source closure. A set of allowed points alone does not construct a reduced O-flat quotient.

The named formal-quotient, basic-PEL-uniformisation, local-type, trace-formula and patching extensions are exact requests rather than supplied library facts. Keep them visibly conditional until their supplier contracts are established. In particular, the Čerednik–Drinfeld proof consumes the separated/ample quotient and basic PEL transfer; the Ihara proof consumes weak patching and the regular-base flatness contract. This review does not certify those requests closed.

Some recorded limitations are **not** further reasons to return the package: scheme representability is correctly distinguished from an algebraic space; the odd-prime q≡−1 sign claim is restricted and has a valid negative control; the Khare field-degree assertion is explicitly excluded from effective neatness. Do not reintroduce those overclaims in revision.

## Source audit

The sample consists of 15 target locator rows selected with seed 9219. Printed pages are used except the explicit author/arXiv internal pagination. Reading a row confirms its stated mathematical support, not every theorem in its source.

| Target | Source passage examined | Result |
| --- | --- | --- |
| R18.3.32 | KW09 Lemma 7.2 and remark, pp.60–61; Tay06 Lemma 1.7(1), pp.744–745, and Notation | Level and sign scopes read; reciprocity page corrected to 733. Residual exceptional case remains restricted. |
| H4.4 | BHW23 Remark 5.8, p.1744; Lemma 8.9, pp.1769–1770 | Adjugate action direction and pairing multiplier agree. |
| R18.1.2 | YZ18 §4.1, p.561; Proposition 3.1, p.551 | Canonical reflex field distinguished from auxiliary weighted-CM reflex field. |
| R18.4.35 | Sai09 Lemma 3, p.30, Lemma 4, pp.32–33; Del80 Corollaries 3.3.4–3.3.6, p.206 | Projector/weight and inner-support purity scopes agree; no integral saturation follows. |
| R18.2.14 | YZ18 Theorem 4.10, pp.569–570 | Formula located; ramified saturated relative comparison remains a gap. |
| R18.5.16 | BC91 Part III Theorem 5.2 and comments, pp.140–142 | Rational division case, anti-isomorphism and Frobenius/determinant action confirmed. |
| H1.3 | DP94 §§1.1–1.5, pp.60–63, and §2.1, p.64 | Ordered polarization/evaluation condition; range corrected to include 64. |
| H0.1 | BHW23 Notation 5.1, pp.1740–1741 | Groups located; centres/dimensions are the package's direct fibre-product calculation. |
| R18.2.1 | YZ18 §§3.1–3.2, pp.551–555 | Regular representation, trace form and integral factors located. The full B′ carrier has ℚ-dimension 8g, hence abelian dimension 4g; it is distinct from a Morita-reduced dimension-2g carrier. |
| H4.13 | BHW23 Definition 8.17 and §8.3.1, pp.1773–1775 | Finite Γ₀, scalar image and diagonal quotient conventions confirmed. |
| H6.5 | Tay02 Lemmas 1.2–1.3, pp.10–12 | Corrected page range; discovered incomplete local input contract. |
| H0.3 | BHW23 Notation 5.1(3), Definition 5.2(1), pp.1740–1741 | Lattice convention confirmed; nearby stabilizer corrected independently. |
| H5.3 | Dia21 §§3.1–3.2, pp.9–12; BHW23 §7.1, pp.1759–1760 | Hodge splitting/descent retains characteristic and ramification restrictions; integral modified Hodge lattice is distinct. |
| H2.2 | DP94 §2.1, p.64; BHW23 §5.1.2, p.1744 | All-prime DP condition and algebraic-space representability separated from scheme refinement. |
| H4.3 | BHW23 Definition 5.7, p.1743; Lemma 8.10, p.1770 | Scalar multiplier union confirmed; fixing a root is additional data. |

All author-flagged boundaries were examined: Carayol's split component fields in Notations p.155 and §§4.4.3–4.5.5, pp.188–189; YZ §§4.1 and 5.2–5.3 for the crystal gap; MS §3.2 p.14 for Kisin; Carayol's Theorem A and §§0.3–0.11, pp.409–412, against the early Galois scope; KW's references and Lemma 7.2 for field-degree/sign limitations; DP's global representability; and BZ22 Proposition 6.2 p.43, Theorem 6.7 and Corollary 6.8 pp.49–50 for the PEL/quotient requirements. The published Khare Duke Lemma 2.2 was not verified: the public arXiv preprint has different numbering. Neither that preprint nor effective neatness closes its field-degree assertion. Kisin–Lai's author endpoint also returned 403; H3.8 is left as the explicit gap above.

PRR23 §1.4.2, pp.31–33, equation (1.16) and the uniformizer argument were read directly in the maintainer-cleared copy, without copying the file or passages. They justify ν_D=v∘Nrd, its compact kernel and scalar valuation two at index two. No restricted source passage enters this report or the package.

## Adversarial mathematics pass

Every target and standing convention was read against its prerequisites, generality and degenerate instances. The following ranges partition all 182 targets; a row's checks apply to each relevant statement in that range, with any unresolved step identified rather than certified. Algebraic toy parameters such as q=1 test formulas; an actual finite residue field still has q≥2.

| Statements checked | Instances and convention witnesses | Outcome |
| --- | --- | --- |
| H0.1–2 | g=1 and g=2; independent signs versus two common-sign components; geometric central sign components | Full centre not silently connected; dimensions 4g and 3g+1 retained. |
| H0.3–4 | c=O, nonprincipal c, ramified ℚ(√2); a=0; basis vectors with trace pairing 1 | No generator chosen; different and family balance law retained; zero form not nondegenerate. |
| H0.5–6 | diag(2,1) over ℚ; identity; exact G versus G* trace embedding | Stabilizer corrected; Hodge witness applies to G*, abelian-type comparison uses derived groups. |
| H1.1–3 | Standard ℤ cone, zero and negative symmetric maps, nonprincipal ordered ideal | Positivity is data; negative map and arbitrary evaluation isogeny fail c-polarization. |
| H1.4–5 | Scalar real multiplication, ramified/nonreduced bases, determinant versus trace condition | Full characteristic polynomial is required; characteristic-zero trace shorthand does not replace integral condition. |
| H1.6–7 | N=1 versus N≥4, geometric points versus fppf level, coarse quotient | Smallness and invertibility scope retained; algebraic space is not automatically scheme or universal-family carrier. |
| H1.8–10 | m=1, zero torsion section, ramified different, rescaling β and polarization | m≥1 added; twist/trace target and inverse multiplier convention retained. |
| H2.1–4 | p=2, ramified p, Lagrangian rank g, arbitrary nilpotent base | DP self-orthogonal model is distinguished from Rapoport model; determinant identity retains all-prime scope. |
| H2.5–6 | Ordinary versus nonordinary special fibre; ramified Lie module | Ordinary implication has its structural hypothesis; Rapoport and ordinary loci are not equated. |
| H2.7–9 | Unit/zero Hasse ideal, p=2, two congruent lifts, nonprincipal c | Ideal and lift-independence retained; supplier renamed R2; no integral conclusion from generic frames. |
| H3.1–2 | M=1, zero level ideal, nonpositive square root | U_M consists of units; square roots need not be positive; M=0 is outside finite cardinality theorem. |
| H3.3–5 | ℚ, ℚ(√3), ℚ(√2); square action η² | Unit quotient example corrected; finite positive level retained; no all-unit effectiveness claim. |
| H3.6–8 | Coarse polarization class, change of nonprincipal representative, ideal coprime to N | Universal family not inferred on coarse quotient; Hecke descent remains a gap. |
| H4.1–3 | n=0 as limiting toy, n≥1 torsion frames; scalar versus nonscalar multiplier | Full frames remain characteristic-zero data; chosen root fibre distinct from G* union. |
| H4.4–7 | Noncommuting two-by-two unipotents; scalar η; β↦uβ | adj(γδ)=adj(δ)adj(γ) gives left action; determinant multiplier and η⁻¹ retained. |
| H4.8–12 | m=0, m=n, connected versus all components, nonétale subgroup at p | Finite-flat integral subgroup and generic constant-frame notions kept apart; unit denominators and pairing components explicit. |
| H4.13–17 | N=5, p=2 versus 3; η² in diagonal relation; finite residue quotient | False chosen-lift nonmembership fixed; ineffective scalar image remains smaller than all residue scalars. |
| H4.18–19 | p=2, square roots with nontrivial level image, inverse-limit stable images | Existing dyadic counterexample prevents projection to every Δ_n being declared an eventual isomorphism. |
| H5.1–2 | g=1 versus real quadratic g=2; cusps versus compact quaternionic curves | Rational comparison and restricted real-quadratic cusps retain their scope. |
| H5.3–4 | Characteristic zero splitting; ramified integral Hodge lattice; weight-two/scalar-unit character | Descent is required, and raw ramified integral splitting is excluded. |
| H5.5 | Nonprincipal ideal and ramified quadratic different | Example does not choose an unavailable basis or erase different factors. |
| H6.1–3 | Trivial torsor; unpaired torsor; component label permuted by Galois | Simultaneous symplectic torsors, selected field and norm-of-ample-line descent distinguished. |
| H6.4–5 | Real even involution; wrong component; arbitrary finite local module | Real theorem excludes even/mismatched data; finite local source contract is underspecified and now marked a gap. |
| H6.6–9 | Dual versus undualized residual determinant; K=k and quadratic CM restriction; residue degree 2 | Dualization, restriction dimension and supersingular Frobenius exponent retained; no Moret–Bailly dependency cycle. |
| R18.1.1–4 | ℚ split modular case versus division curve; two real places; scalar arithmetic units | Properness/genus only in compact division case; finite rational centre differs from adelic closure. |
| R18.1.5–7 | Inverse-diagonal (a⁻¹,a); γ′=0 and −γ′; weighted CM pair | Norm kernel, auxiliary reflex field and positivity checked; γ′ invertible/anti-fixed alone is insufficient for polarization. |
| R18.1.8–9 | Geometric selected component; finite-level inertia; centre cancellation in torus bridge | Geometric comparison not promoted to unspecified local descent; split field reconciliation retained. |
| R18.5.1–3 | Infinity and K-rational points excluded; z∉K included; q=2 valence 3; xy=π | Analytic complement not Zariski complement; semistable blow-up model retains tree charts. |
| R18.5.4–6 | Relative height four versus absolute 4[K:ℚ_p]; framing direction reversed | Height and Frobenius sign conversion kept separate from homography action. |
| R18.5.7 | Nontrivial scalar centre, torsion stabilizer, finite effective quotient | Separated formal quotient is an explicit supplier obligation, not automatic orbit-space existence. |
| R18.5.8 | (a,b)=(1,1),(1,−1),(1,0); difference (a−b)/2 | Even-height subgroup and diagonal kernel eliminate nonintegral half-difference. |
| R18.5.9–11 | Trivial group; translation length 3 versus 2; ball-radius-one collision; q=2 | Strict distance >2 retained, central scalars removed; ample quotient/algebraization input remains conditional. |
| R18.5.12–13 | Active and passive p-factors; inverse-diagonal torus; Π⁻¹ right descent | Auxiliary factors and cofinal level embedding retained; PEL transfer not replaced by split-place descent. |
| R18.5.14 | Loops, repeated edges, reversed edges, node thickness | Multigraph and Kurihara edge deletion conventions retained. |
| R18.5.15–16 | F=ℚ division case; split B excluded; maximal division-prime level; Π⁻¹ | Removed irrelevant split comparison prerequisite; BZ/BC descent conventions reconciled. |
| R18.5.17–18 | Repeated edges/loops; nontrivial Frobenius permutation; edge length | Character lattice and monodromy use actual nodal graph, not a simple graph or descended rational points alone. |
| R18.5.19 | n=0 versus positive n; ramified component field versus union | Correct source fields and n-dependent tame level retained; process Check replaced by inertia witness. |
| R18.5.20–21 | Nonmaximal division levels and transition maps | Drinfeld level comparison is a separate prerequisite; maximal-level theorem alone is insufficient. |
| R18.2.1–3 | g=1 regular dimension 4 versus Morita 2; N<3; torsion unit ideal; right coefficient action | Distinct carriers/ranks and effective centre retained; no full-level torsion cardinality for nonétale integral points. |
| R18.2.4–7 | Algebraic closure versus completed unramified field; selected level component; ramified bridge | Field/cocycle distinctions retained; special split model not applied at division prime. |
| R18.2.8–11 | Genus zero, nonsmall effective quotient, ramified base change xy=π_L^e | Minimal-regular uniqueness and fine regularity use genus/smallness; coarse model only normal/ℚ-factorial as stated. |
| R18.2.12–14 | z=i gives metric 2; node versus smooth locus; split idempotents; ramified filtration | Metric normalization fixed; ramified integral Kodaira–Spencer route remains a gap. |
| R18.2.15–16 | K′ distinct from K; ramified extension; tensor weights −1 plus −1 | No regularity preservation under ramified base change; type prevents unwanted weight −2; p=2 supplier required. |
| R18.2.17–18 | Unramified direct summands versus nonexact ramified τ quotient | Saturation cannot be inferred from tensoring; recorded determinant closure defect. |
| R18.3.1–4 | Positive-rank global units; nontrivial effective isotropy; sign action mod 2 | Rational centre divided out; reduction is restricted at isotropy rather than all invariants. |
| R18.3.5–7 | Zero module, torsion coefficient lattice, norm-factor constant functions | Perfect pairing needs integral unit stabilizer factors; unnormalized T has q+1 and scalar S has square norm. |
| R18.3.8–9 | Arbitrary [F:ℚ], l ramified, split w, nontrivial coefficient at w | General-field definite Ihara retained; trivial-at-w and non-Eisenstein hypotheses are essential. |
| R18.3.10–11 | l=2, isotropy group of exponent 2^a, base-changed local character | Strict inequality on auxiliary order needed to annihilate isotropy; scalar/effective stabilizers distinguished. |
| R18.3.12–14 | Cyclic C₈ with N=2; N-torsion versus square powers; b<a | Quotient cardinality 4 versus 2 pins torsion convention; augmentation uses exact stabilizer equality. |
| R18.3.15–16 | Nonunit q; ℤ→ℚ coefficient map; ideal relations; effective neatness | q⁻¹ only with q unit; maximality needs coefficient surjectivity; no Khare degree theorem inferred. |
| R18.3.17–18 | Scalar uniformizer valuation 2; r²=ψ⁻¹; p=2 signs; ψ value 4 | Division valuation and inverse coefficient convention checked; ±1 alone insufficient for general central character. |
| R18.3.19–22 | Principal series at ramified place, one-dimensional characters, k=2 | Transfers restricted to discrete-series/non-character spectrum; actual coefficient-field models required. |
| R18.3.23–24 | Sign representation over ℤ reducing mod 2 | Liftable invariant image is zero although all mod-2 invariants are nonzero; no unrestricted reduction surjectivity. |
| R18.3.25–27 | Trivial and order-four χ; χ(z²); dyadic reduction | Quadratic norm twist preserves central character/involution; nonquadratic twist fails; Hecke scalar square fixed. |
| R18.3.28 | Roots a=b versus a−b unit; reversed translation | Integral root splitting uses unit difference and declared degeneracy direction. |
| R18.3.29–32 | Isotypic multiplicity >1; even degree without finite discrete series; p=3, q≡−1; r=1/2 | Rank-two Galois factor not whole H¹; early compatibility remains gap; sign exception restricted; uniformizer Galois value is 2, not 1/2. |
| R18.4.1–4 | Zero/trivial local system; nonperfect lattice pairing; torsion H² | Local system and integral duality retain central character and perfectness hypotheses. |
| R18.4.5–6 | Degree divisible by l; trivial cover; residual fixed vectors | No averaging at nonunit covering degree; trace/invariant comparison restricted. |
| R18.4.7–10 | Constant component function; character component; H⁰/H² and Hecke adjoints | T=(q+1) translation and S=square translation; adjoint localization not original maximal ideal by default. |
| R18.4.11–13 | l-power cover; rank-one monodromy u versus u⁻¹; W=0; proper versus 𝔸¹ | Hochschild–Serre uses localized degree-zero vanishing; new coefficient/support Checks replace bookkeeping. |
| R18.4.14–17 | q=1 toy; q=2,T=3,S=1 gives kernel (1,−1); ramified DVR and k[[ϖ]] | Gram off-diagonal S⁻¹T retained; discriminant unit needed for splitting; uniformizer, not integer p, controls saturation. |
| R18.4.18–20 | l=2 excluded; residual Jordan block; fixed determinant; nonminimal coefficient ramification | Prime/type data and coefficient ring retained; primary potentially semistable quotient source still missing. |
| R18.4.21–22 | l-power central/cover quotient; nonsplit residual principal-series lattice | Exactness not obtained by averaging; type filtration and lattice choice retained. |
| R18.4.23–26 | Two-place ramification exchange; noncuspidal characters; Galois multiplicity | Filtration is Hecke-only N,M²,N; no unsupported Tate twists or whole H⁰≅H¹. |
| R18.4.27–28 | p-adic place versus prime-to-p place; correct θ=ψε⁻¹ | Early local compatibility needed independently of the patching conclusion; missing source remains blocking. |
| R18.4.29–31 | Zero type, reducible local tensor product, non-domain base | Weak patching and regular-base flatness are exact supplier requests; domain-only criterion not silently used. |
| R18.4.32–33 | Small residual image; field/Artinian coefficient ring; ramified DVR | Large-image theorem not unrestricted; integral saturation requires finite-free modules and residual injectivity at ϖ. |
| R18.4.34–36 | Weight two; g=2,w=4; negative determinant exponent; integral torsion | Saito projector gives rational summand/weight, not an integral saturated projector; inner purity retains support image. |

R18.6 has no targets: its export was checked not to promise arbitrary local realizability, unconditional integral Ihara or a universal family on a coarse quotient.

## Current ownership and pinned Lean

Read the current upstream main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` without building them. Searched mathematical carriers, fields, operators and hypotheses across the nine newer roadmaps and Completed roadmaps, including the OperatorTheory subroadmaps. Relevant overlaps were read in AlgebraicVectorBundles, IntegralLattices (also its completed form), OrthogonalSpinGroups, RestrictedProducts and the current trace-dual, local-coefficient and GL₂ Hecke modules. The completed integral lattice theory is symmetric; H0's form is alternating and depends on a fractional ideal. OperatorTheory's Hilbert-space Gram operators do not supply the two-by-two arithmetic degeneracy matrix over a DVR. Quaternion algebras, positive units, symmetric powers, trace duals and generic local coefficient/cohomology carriers remain imports. No whole target was removed as a duplicate; the boundary citations were made more precise.

Pinned API statements were read locally; the representative file was elaborated only with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474. These ten checks compare actual signatures, not just names:

| Signature | Hypotheses and README agreement |
| --- | --- |
| `polarizationLattice_rank` / `lattice_duality` | Number field, c≠0, native fractional ideals; no totally-positive parameter needed for the unparameterized alternating dual. |
| `integralTraceFamily_integral` | a∈c and both vectors in L_c; rational output becomes integral; a=0 admitted. |
| `tamePolarizationGroup_finite` | Positive integer level; subgroup P of integer units, specialized to positive units; no finite M=0 assertion. |
| `adjugate_level_action` | Arbitrary commutative coefficient ring, rank-two GL group, linear frame; composition order agrees. |
| `PelHeightLattice.difference_contract` | Even-sum lattice, exact diagonal kernel, integer half-difference; no division on all ℤ². |
| `VeryFreeChartAction.free` | Given displacement predicate and zero self-distance; actual tree action specializes it, no tree construction in Lean. |
| `QuaternionWeight.rank` | Nontrivial commutative ring, k≥2, finite tensor of Sym^{k−2}; rank (k−1)^d. |
| `ResidualHeckeIdeal.actingFactor` | Ideal of acting relations contained in evaluation kernel; unique factorization, not assumed well-defined automatically. |
| `gram_adjugate` / `oldspace_split` | Commutative coefficient ring, S a unit; splitting additionally uses discriminant unit and declared Gram identity. |
| `residual_injectivity_saturation` / `integral_ihara_split` | DVR, irreducible uniformizer, finite-free source and target; no ℤ_p-only scope or arbitrary Artinian generalization. |

Final `lean-check`: exit 0, exactly 40 declaration-uses-sorry warnings, no errors or other warnings. The three added counterexamples are computed proofs, not new sorry statements. 716 lines, 31 examples. No data definition with a sorry body; `scripts/check_sorry_data.py` passes. API theorem statements over light native definitions are retained; none develops the absent geometric theory.

`intake.py check-files` was run on the changed deliverables and handoff: 0 problems. Metadata remains `topic = "math.NT"`. Internal prerequisites and namespace/name inventory checks pass. Wording and formulas are the package's own mathematical statements, with no source passages or section-by-section source summaries introduced.

## Retrieval provenance

Public copies read on 2026-10-13; locators above use these versions. Hashes identify the bytes used, rather than asserting another version has identical pagination.

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| KW09 | [Primary copy](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| BHW23 | [Primary copy](https://www.numdam.org/item/10.5802/aif.3560.pdf) | `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4` |
| YZ18 | [Primary copy](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507` |
| Sai09 | [Primary copy](https://arxiv.org/pdf/math/0612077v2) | `fb5b69b76d2257ce20f47366c4bd165ccdb571333e7f25a4ed6e92dbb4b55df7` |
| Del80 | [Primary copy](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| BC91 | [Primary copy](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf) | `2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119` |
| DP94 | [Primary copy](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf) | `bc795da7fcc57b4b5fd2257bc22fc2187c98bf70eaeb1f7efddc92f4af58c2d5` |
| Tay02 | [Primary copy](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf) | `e00ebd580b4bdb591345c051c6ae85801663b4a5807a12269c909a47eff3a57d` |
| Dia21 | [Primary copy](https://arxiv.org/pdf/2011.14128v2) | `2d8f8fd3d1e1e468d57183bcd0eef454e1e8fff4a7e143c8a0e48e490692e3c2` |
| MS19 | [Primary copy](https://arxiv.org/pdf/1907.06043v2) | `3ae8ca9200d86d2e03505e54afcfb0318bf8951ddb212a9083a384adb1eb5917` |
| Car86 | [Primary copy](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf) | `22c01e577504a9963168e78373286d8ecac6ecc8178db64262cf8d473b91b3b3` |
| BZ22 | [Primary copy](https://arxiv.org/pdf/2212.06886v1) | `89efb1ef16c2f7704d7f375f7aca4a2a5bcf81053211035b8c09d037545060dd` |
| Dim05 | [Primary copy](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf) | `722986ce0343547cdbc6cd7d39fa524a9c967f3ab42fdd231cc3acd87b006f03` |
| Tay06 | [Primary copy](https://ems.press/content/book-chapter-files/27484?nt=1) | `6ec26bfc12e1cf38d410b36c18f985e2fb26c1cb1bb03d6e5197ccf58f92c51c` |
| Car86a | [Primary copy](https://www.numdam.org/item/10.24033/asens.1512.pdf) | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |
