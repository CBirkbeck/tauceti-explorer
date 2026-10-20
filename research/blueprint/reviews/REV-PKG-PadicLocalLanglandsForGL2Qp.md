# Independent package review: p-adic local Langlands for GL₂(ℚ_p)

**Verdict: accepted with the corrections below.** Reviewer: Codex, session codex-BP7D2b; 20 October 2026. This reviews another worker's package, authored in session codex-OMsPub and submitted in #11281. Acceptance concerns the roadmap package, not proof closure: all six stages remain planned, and the eighteen proof and supplier obligations G1–G18 remain explicit. No packet was changed.

## Coverage and upstream form

Read the whole package, its accepted packet, the package handoff, WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the expansion protocol. The style comparisons were InductionRestriction and CharacterTheory in the atlas's upstream content, followed by the current ModularInduction README/Suggested and LocalGaloisGroups Suggested. The package has the required summary, ownership, conventions, supplier contracts, ordered layers, named APIs, discriminating checks and dependencies. The metadata remains exactly `topic = "math.NT"`.

The packet has 65 targets, including three targets expressed as supplier contracts, 167 API names and 102 named tests. The README retains all of them. The added theorem targets and examples refine the existing obligations; they do not replace the general statements with the residue-field signatures in Lean. Definitions and constructions have at least three discriminating prose checks; theorem-only subsections need not each introduce three additional checks. Added checks cover several auxiliary definitions whose original checks were too sparse.

The mathematical text is written in its own words and organised by construction dependencies. No source passages or source-by-source synopsis were added. No private filesystem paths, job identifiers or review narrative occur in the package README or Suggested file.

## Corrections applied

1. **Analytic carriers and coherent lattices (§§2.4–2.5).** The Lie-algebra multiplicity formula now acts on Π^{an}, where differentiation is defined. It includes the multiplicity-two trivial representation and the k=1,2 boundary computations. The coherent-lattice obligation now gives the actual radius spaces, positive Mahler decay factor, H-coherence recurrence, restriction H^p⊂gHg⁻¹, orbit lattice and completion. Its API includes coherence, commensurability and the completion theorem. Zero and trivial representations satisfy the recurrence; the regular Banach representation C(ℤ_p,L) provides a nonexample, with an explicit Mahler series separating consecutive radii. The completion locator is CD14 Theorem 0.2, p.4, rather than p.3.
2. **Current categorical suppliers (§§2.1, 5.3).** Replace the stale smooth-category envelope citation by current SR.0d.1, which supplies the Grothendieck property and enough injectives. Keep GL₂ local admissibility and envelopes as the separate representation theorem. Projective envelopes in C(O) now use a categorical projective object and `TauCeti.IsEssentialEpi`; ordinary module projectivity cannot be transported by forgetting the action.
3. **Finite and normaliser representations (§2.8).** Add named constructors and restriction/square APIs. Distinguish the eigenvalue of w_ℓ in the equal-character case from the scalar eigenvalue of −ℓ in the two-dimensional case. Checks compute the scalar as a² and retain the ℓ=2 boundary.
4. **Gluing and reconstruction (§§3.1, 3.4).** The measure example uses the ψ-module of bounded measures and its Amice transform, rather than identifying it with the étale Laurent-series carrier. Name both β maps and the contragredient, and add zero and character controls: a nonzero character has D(Π)=0, so β cannot be injective without the no-finite-quotient hypothesis.
5. **Heart and analytic sections (§§3.10–3.11).** Name the two hearts separately. The Weyl operator exchanges C and C′; involutivity does not imply C=C′. The computation ψ((1−cφ)z)=0 when ψz=cz checks the eigenvalue. Name the overconvergent/Robba section objects and analytic exact sequence, and specify that its twist is δ_D∘det. Scalar a then acts on the twisted dual by δ_D(a)⁻¹δ_D(a²)=δ_D(a).
6. **Weights, completions and Kirillov functions (§§4.1, 4.6–4.7).** Restrict the equal-weight vanishing test to the absolutely irreducible case used by the algebraic-vector theorem. A principal-series completion is unique when its filtration locus is nonempty; an empty locus gives no such completion. Require a positive symmetric-power exponent in the Steinberg family, retain the coefficient extension for a half-unramified character and identify its N=0 endpoint. At exponent zero the weakly admissible slope line forces reducibility; the ordinary Steinberg completion is outside the classification. Add Kirillov map APIs, the zero/injectivity control and the distinction between compact support in ℚ_p and in ℚ_p^×.
7. **Analytic principal series (§4.8).** Name the induced representation and its special subrepresentation/quotient. Add the genericity hypothesis to the crystalline example: at a special parameter the kernel is E_ℒ. Compute the central character and the special k=0,1 dimensions. The k=0 check is on induction: its unitary-determinant parameter has u(s)=0 and lies outside S_irr.
8. **Cycle support (§5.11).** The multiplicity-one example now has p≥5 and the generic residual hypotheses of Paškūnas §6.1. The cyclotomic peu ramifié multiplicity-two case is explicitly excluded from that example. Add compact-Hom computations for zero, the regular O[[K]] generator and a doubled trivial type.
9. **Admittance and geometry (§§5.13, 6.9).** Clarify that irreducibility belongs to ρ̄, not to its displayed sum of inertia characters. Test simple admittance against a doubled constituent and two distinct admitted constituents. Name the Drinfeld family/function/differential APIs, compute the annihilator of a basis line and the reversed dual sequence, and test the excluded ordinary/zero objects and the level hypothesis.
10. **Locators and the Lean control.** Correct the Paškūnas group-notation locator, remove a residual R30.4 pointer, identify the 238-page Colmez author file and pin Gee–Kisin v5, whose Appendix B is actually used. Add a proved Lean negative control: a diagonal mirabolic matrix with upper-left norm greater than one is outside P⁺. The closing comment records the additional heavy README objects.

## Public source audit

No locator was labelled unverified in the package. Nevertheless all nine documented source issues were independently checked in the accessible versions, together with the fifteen sampled targets below. Sampling was `random.Random(10906).sample(packet['nodes'], 15)` in packet order, before making source-dependent selections. The locators below use the versions specified in the README; Kisin locators are journal pages. Confirmation means that the named statement and relevant hypotheses were read, not that its proof has been formalised.

| Sample | README | Primary locators checked | Result |
| --- | --- | --- | --- |
| 1 | §5.12 | CDN–Kisin Theorem 0.1, pp.1–2; Theorem 4.1, pp.13–15; Lemma 5.3/Theorem 5.4, p.20; Corollaries 5.5–5.7/Theorem 5.8, pp.21–22 | Ring, rank-two family and finite-algebra specialisation statements confirmed; the Artinian and supercuspidal inputs remain explicit. |
| 2 | §1.7 | Colmez VI.6.11, p.192, Introduction §11, p.17; Emerton §3.2, p.19, footnote 6 | Geometric reciprocity and the MF/Colmez twist confirmed; retain the separate smooth-factor comparison obligation. |
| 3 | §2.6 | Colmez Introduction §7, p.13 and III.3.7, pp.87–88; CDP §1.2, p.3; CDN–Kisin Remark 1.1, p.4 | Inducing-character order and central character checked; the exceptional orientation requires the correction already stated in the package. |
| 4 | §4.3 | Berger–Breuil Introduction, pp.2–3; Theorem 5.2.7, p.51; Corollaries 5.3.1–5.3.3, p.52; Kisin (1.2.8), pp.649–650 | Completion and abelian-type statement confirmed, including reducible extension constructions in Kisin. |
| 5 | §3.10 | Colmez Proposition V.2.1, p.125; Theorem V.1.12 | Confirms the exchange of two hearts, corrected above; the extra analytic comparison is not formal ψ-complex algebra. |
| 6 | §4.5 | Kisin (1.2.6)–(1.2.8), pp.649–650; Emerton 3.3.22, p.28 and §7.4, pp.96–98; Dieulefait–Pacetti, proof of 1.4, p.4 | Odd-prime/type hypotheses retained; supercuspidal proof input kept. |
| 7 | §1.2 | Colmez Introduction §1, pp.5–6; Triangulines §0.1, pp.2–3; CDP §1.1 and footnote 2, p.2 | Unit character, cyclotomic character and geometric Frobenius conventions confirmed. |
| 8 | §1.3 | Colmez I.2.2–I.2.3, pp.31–32; Introduction §9, p.15 | Coefficient-valued duality, differential and determinant twist confirmed. |
| 9 | §5.8 | Nakamura Lemma B.23, Theorem B.24, Lemma B.25, Proposition B.26, pp.100–103 | Universal deformation and projective-envelope comparison confirmed with p≥5 and both exclusions. |
| 10 | §1.5 | Colmez Proposition 0.5, pp.9–10; I.3.3–I.3.4, pp.35–40 | ψ-compatible inverse-limit construction and affine action confirmed. |
| 11 | §4.4 | Paškūnas 2015 §1, p.2; Kisin §1.1, pp.645–646; Paškūnas 2016 §2.C, arXiv pp.21–22 | Scalar Steinberg/crystalline distinction and dyadic reduction-independence confirmed. |
| 12 | §3.5 | Colmez II.2.1–II.2.2, pp.55–59, Remark II.2.3 and Lemma II.2.10; Theorem 0.17, pp.16–17; CDN §1.3.1, p.17 | Raw integral inverse image, saturation and rational span must remain distinct, as the package states. |
| 13 | §2.5 | Colmez–Dospinescu Theorem 0.2, p.4; Proposition 0.6/Theorem 0.7, p.6; radius definition §IV.4, pp.38–39; CDN 2020 Proposition 2.9, p.22 and Corollary 2.13, p.24 | Corrected locator and supplied the recurrence, decay convention and checks. |
| 14 | §1.1 | Colmez Introduction §§4–5, pp.8–10 and III.1.1–III.1.2, pp.70–72; Paškūnas 2013 §1, pp.2–7 | Matrix/group conventions confirmed; corrected the Paškūnas locator. |
| 15 | §6.6 | Kisin (1.1.3)–(1.1.6), pp.646–647 and §§1.5–1.7, pp.657–674; Gee–Kisin Appendix B.1–B.2, p.38 | Retain all multiplicity, ordinary-smoothness, exceptional-clause and line-action corrections. |

The source-issue check is separate from the random sample:

| Issue | Text inspected | Disposition |
| --- | --- | --- |
| E1 | Paškūnas 2016 Theorem 2.37, arXiv p.24 | Its displayed identities are equalities despite the preceding prose; retain the displayed cycle identity. |
| E2 | Paškūnas 2016 §2.C, arXiv pp.21–22 | Keep the determinant ψε and corresponding inertia condition together; do not import the conflicting shorthand. |
| E3 | Emerton 3.3.22, p.28, against §7.4, pp.96–98 | The b+1 versus b discrepancy is real; the package fixes weights and determinants by its explicit convention. |
| E4 | CDP §1.1, p.2 | The cited Emerton number must be 3.3.22, not 3.2.22. This check is scoped to the cited preprint. |
| E5 | Colmez III.3.2, author p.85 | Augmentation at r=0 fixes the exceptional extension direction; keep the corrected two sequences. |
| E6 | CDN–Kisin Remark 1.1, p.4 | Same exceptional direction issue; apply the same augmentation witness. |
| E7 | Nakamura B.18, p.98, against Emerton 3.3.2, p.24 | Use absence of finite-dimensional subobjects and quotients. Absence of every internal subquotient would be a stronger, unsupported statement. |
| E8 | Gee–Kisin Appendix B.1, p.38, against Kisin's scalar case | Ramified nonsplit, unramified nonsplit and split multiplicities are respectively 1,2,4. |
| E9 | Gee–Kisin Appendix B.1–B.2, pp.38–39 | Delete the ordinary formal-smoothness conclusion, enlarge the exceptional scalar-semisimplification clause, and use the corrected character on the line. |

The Colmez author PDF matches packet SHA-256 `8663e1189fe79387240cbfa6d7a2788217dfe4f3a522b4b4ffc36b3dc347917e`, but has 238 pages. Gee–Kisin v5 matches `65cb5797bbe10e328843b5fdc73f2623c80e19fa89ceb72ce6cd296881eb68f9`; earlier v3 lacks the needed Appendix B, so the README now links the version explicitly. The Harvard-served Kisin PDF read here has hash `e7463c5dd23f9b61015f6ece0d2c9d83ba57367b93f12cf36cb1c8cadd057446`, different from the packet/author handoff hashes; the inspected journal-numbered statements agree. This is version provenance, not a claim that packet hashes were updated. The added all-prime rank-one supplier was also checked in KPX v3, Proposition 6.2.8/Corollary 6.2.9, pp.58–59 and Theorem 6.2.14, pp.61–62.

## Prerequisites and current-library duplication

Read the fourteen baseline declaration statements at the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, Amice is only ℤ_p-linear at that pin, `TopRep` does not alone impose joint continuity, `IsSmoothDiscrete` supplies discrete topology/open stabilisers, and the cyclotomic character needs the roots-of-unity hypotheses. The O-linear measure/duality adapters are therefore substantive obligations. Over ramified O the inverse different cannot be silently trivialised.

Read the reviewed packet and the available library-coverage references. All 55 distinct external prerequisite references in the packet resolve in their owning packets. The README also adds current supplier names and explicitly stated missing contracts. Owners are lower local/analytic/deformation layers or the current upstream bundle. The global supercuspidal comparison and the all-residual patching proof inputs remain conditional obligations, rather than upward edges to completed cohomology or modularity lifting. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` prerequisite remains in the README. Forward references to classification are stated proof inputs, not assertions that definitions prove finiteness.

Duplication was checked against current TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine newer roadmaps and the four named Completed roadmaps. Searches used objects and hypotheses: inverse-limit group algebras/actions, essential monomorphisms/epimorphisms and covers, smooth/compact representations, analytic vectors, period/Robba modules, local Galois characters, and the GL₂-specific operators, blocks, filtrations and cycles. Relevant matches were read, rather than treating a missing name match as sufficient evidence.

The existing completed group algebra and compact action are already deferred in the boundaries: `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` and `.Module`, with `IsCompactModule`, `completedSMul_of`, `completedGroupAlgebraModule` and the continuity/scalar-tower theorems. General determinant laws and Cayley–Hamilton algebras are likewise already deferred to IntegralHeckeAndGaloisDeterminants. Current categorical envelope vocabulary is `TauCeti.IsEssentialMono` in `CategoryTheory/Injective/Envelope.lean` and `TauCeti.IsEssentialEpi` in `CategoryTheory/Projective/Cover.lean`; it supplies uniqueness and the categorical condition, not GL₂-envelope existence. The erroneous ordinary-module transport was corrected in §5.3.

**Further target removals: none.** No current library/roadmap supplied an additional entire retained GL₂ target. The finite-length theorem differs from the general smooth category; K-type occurrence differs from the characteristic-different-from-p statement; the classical factor comparison retains Colmez's reducible factor. These distinctions are stated explicitly. No lake command was run in either current checkout.

## Adversarial mathematics pass

This table records the full section walk, including the three relocated supplier targets. These are mathematical and interface checks, not Lean proofs of the heavy targets.

| Statement or convention | Instances and computations | Result |
| --- | --- | --- |
| Fontaine supplier | V=0, O, O(χ); ramified O | Covariance and φ(e)=e, γ(e)=χ(γ)e distinguish the cyclotomic module from the algebraic x module. Retain coefficient-linear adapters. |
| Rank-one supplier | δ=1, ε, x; p=2 | H¹(1) has dimension two; R(x) has slope one and is not étale. All-prime KPX supplier is separate from Colmez's odd-prime rank-two classification. |
| Banach/analytic supplier | 0; unitary η∘det; scalar p with nonunitary eigenvalue | Length zero and one-dimensional admissibility hold; iterating the scalar contradicts a bounded invariant lattice in the last case. Analytic density does not imply algebraic density. |
| §1.1 groups | w²; unipotents; diag(p,1), diag(p⁻¹,1); p=2 | P⁺ accepts p and rejects p⁻¹. K additionally requires unit determinant. Scalar(a) lies in P exactly when a=1. Added K and Lean negative controls. |
| §1.2 characters | p, units, ε, μ_λ, x | ε(p)=1, ε(u)=u; geometric Frobenius maps to λ for μ_λ. log(u)≠0 requires the stated nontorsion unit. x cannot extend continuously to Galois. |
| §1.3 Tate dual | 0; trivial rank one; rank two with det=χ | Dual of 1 is χ and δ_D=1 in the last case. The ordinary linear dual would fail both twists. Integral/rational/torsion targets use their different value rings. |
| §1.4 treillis | 0 and trivial E | D^♮=E⁺, D^♯=T⁻¹E⁺ and D^{nr}=L distinguish all relevant pieces. Orthogonals are stated in the torsion-valued pairing. |
| §1.5 ψ inverse limit | Zero module; Dirac₀, Dirac₁; affine composition | Amice values 1 and 1+T and multiplication (aa′,ab′+b) fix restriction and translation direction; ψ-compatibility is required in the limit. |
| §1.6 trianguline parameters | Unit/nonunit characters; split versus nonsplit extension; p=2 | Saturation and exceptional H¹ dimensions are essential. The original parameter theorem is not asserted dyadically; the general supplier remains all-prime. |
| §1.7 classical bridge | Unramified pair; Steinberg N≠0; nonsplit Weil self-extension | Central character is det(M)|·|⁻¹. Frobenius semisimplification does not erase N, and the reducible Colmez factor is not replaced by its Langlands quotient. |
| §2.1 torsion categories | Trivial k; Steinberg; compact induction; arbitrary ϖⁿ | Steinberg has G-length one and infinite k-dimension. Compact induction is not locally finite. Enough injectives in the general category is insufficient for its locally admissible subcategory; corrected supplier. |
| §2.2 finite length | Same Steinberg, zero and wrong central eigenvalue | Residue-field Lean statement retains smoothness, central character, admissibility and k[G]-finite generation. It does not replace the full O-torsion theorem. |
| §2.3 dual category | 0, O/ϖ, O/ϖⁿ; a scalar ζ(a) | Dual scalar is ζ(a)⁻¹, biduality restores the object. Ramified trace pairings need the inverse different; projective envelopes belong to C(O). |
| §2.4 algebraic vectors | Trivial L²; W_{ℓ,1}; W_{0,2}; k=0 | Multiplicity two, determinant character and dimension two checks added. Differentiate on Π^{an}; exclude the negative symmetric power. |
| §2.5 completion/coherence | 0, L; nonunitary scalar; regular C(ℤ_p,L) | Added recurrence and explicit nonexample. Universal completion may vanish for nonzero W; existence is not asserted for every locally convex representation. |
| §2.6 mod-p induction | r=0 and p−1, λ=1; p=2 | Augmentation fixes Steinberg-subobject versus character-quotient direction; r=0 and 1 remain distinct at p=2. |
| §2.7 classification | λ=0; r endpoints; twists | Supersingular and principal-series cases remain separate; parameter redundancies are isomorphisms, not additional irreducibles. |
| §2.8 normalisers | n=0, ℓ−1; equal/distinct exponents; ℓ=2 | Added character restrictions and w_ℓ²=−ℓ scalar computation. Equal-character eigenvalue a induces scalar a², not always 1. |
| §2.9 F≠ℚ_p | F=ℚ_{p³}; nonadmissible irreducibles | The local construction remains scoped to ℚ_p; the comparison does not assert nonexistence of all possible future correspondences. |
| §3.1 ℙ¹ gluing | Zero sections; two chart restrictions; Dirac measures | Matching over ℤ_p^× and the Weyl square control gluing. Corrected the measure example's carrier. |
| §3.2 Montreal | Character, Steinberg and B(δ₁,δ₂); twisting by η | Images have dimensions 0,1,1; B returns δ₁. Thus exactness cannot be used as faithfulness, and covariance uses the further Tate dual. |
| §3.3 irreducibles | B(1,1), supersingular; determinant ω^{r+1}χ² | Central character times ω matches the rank-two Galois determinant. The generic Ext assertion keeps its three ratio exclusions. |
| §3.4 reconstruction | Π=0; nonzero character; supersingular | Added zero and failed-hypothesis controls. A character's zero D rules out extending β-injectivity beyond its domain. |
| §3.5 Π(D) | det V=χ; rank one; a ϖ-torsion class | Saturation kills the last class in the integral quotient. Raw, saturated and rational objects are not identified; rank one does not supply G-stability. |
| §3.6 family stability | S=O; local O-valued fibres; nilpotent quotients | Specialisation concerns the raw quotient with a surjection to the saturated fibre. Arbitrary base change or fibrewise saturation is not asserted. Density remains a proof input. |
| §3.7 correspondence construction | Crystabelline D; scalar residual p=2; exceptional p=3 | Density restrictions and the alternative all-prime characteristic-zero route stay separate. Irreducible Galois image plus exactness does not eliminate finite-dimensional kernels. |
| §3.8 bijection | Ordinary character/principal series; nonordinary Π | Dimensions ≤1 versus 2 distinguish the domain. Keep absolute irreducibility and the lattice/central-character hypotheses for finite-length conclusions. |
| §3.9 Ext atoms | Length-three atoms; length-four cases; dual numbers | Injectivity has the stated length bound. It does not imply equality of deformation functors or equality on nilpotent thickenings. |
| §3.10 heart | ψz=cz; δ_D(p)=1; w²=1 | Computed ψ((1−cφ)z)=0. Corrected involution conclusion to exchange of two hearts; equality of hearts follows only in the specialised defining formulas. |
| §3.11 analytic sections | Crystabelline case; scalar a·1; integral versus rational lattice | Added determinant-twist calculation and names. Keep the rational span and coherent-completion proof input. |
| §4.1 algebraic factor | Weights (0,1), (0,2); equal weights; empty F | Dimensions 1,2; distinct-weight definition excludes equality. Restricted the vanishing check to absolutely irreducible V. Empty weakly admissible loci are allowed. |
| §4.2 algebraic-vector theorem | Non-de-Rham V; repeated weights; supercuspidal V | Vanishing and nonvanishing cases preserve absolute irreducibility; the last case carries the global comparison input. |
| §4.3 Berger–Breuil | Distinct crystalline eigenvalues; weights 0,k−1 | Sym^{k−2} requires k≥2; completion and smooth-factor normalisation agree with the stated boundary. |
| §4.4 K-types | Scalar τ=1; w=(0,1); p=2 | Dimensions p and 1 distinguish σ and σ^cr. Dyadic choice-independence concerns reductions, not uniqueness in characteristic zero. |
| §4.5 Kisin hypothesis | τ=1,k=2; reducible V; nonabelian type | Steinberg K-type has dimension p, not a K-fixed line. Reducible V uses principal-series lattices; supercuspidal comparison remains an input. |
| §4.6 completions | Empty F; principal series; Steinberg N=0 endpoint | Corrected nonemptiness, positive Steinberg exponent and coefficient conditions. Exponent zero has no absolutely irreducible completion. Fixing N≠0 removes the crystalline endpoint; weights alone do not select a completion. |
| §4.7 Kirillov | Zero function; compact coefficient support; nonzero constant on ℚ_p^× | Added injectivity and support controls; compact in ℚ_p and compact in ℚ_p^× are distinct requirements. |
| §4.8 analytic principal series | δ_s=1,x; generic crystalline s; scalar a | Special subspaces have dimensions 1,2; the first is an induction check outside S_irr because u(s)=0. Corrected the crystalline example's genericity and computed η₁η₂χ⁻¹ central action. |
| §4.9 de Rham extensions | Split self-extension; non-de-Rham extension; p=3 | Split case has dense algebraic vectors; non-de-Rham case adds none. p≥5 and the covariant/contravariant dictionary are retained. |
| §4.10 Artinian criterion | E=L; dual numbers; repeated weights; p=2 | The infinitesimal calculation must include nilpotents and its fixed-determinant neighbourhood. The p≥5 extension theorem is not used dyadically. |
| §4.11 filtration independence | Two distinct admissible lines; nonspecial versus special | Only the analytic quotient is independent. Keep the two-copy algebraic piece and the modified special case; the full analytic representations may differ. |
| §5.1 blocks | Zero object; supersingular singleton; right action on Hom | Evaluation requires right End(P)-modules tensoring with a left End(P)-module. Duality introduces the opposite algebra; Ind-completion is not finite length. |
| §5.2 block list | p=2 trivial block; p=3 exceptional block; p≥5 | The two-, four- and three-member exceptional lists stay distinct. Scalar p=2 semisimplification is not a generic two-character block. |
| §5.3 projective envelopes | Simple top; zero target; underlying O-module | Corrected the categorical cover predicate. A projective underlying module does not prove projectivity in C(O); flatness still requires (H0)–(H5). |
| §5.4 pseudodeformations | p=2; irreducible residual; generic split residual | Trace alone is insufficient dyadically. Pseudodeformation and framed representation rings have different dimensions; keep the determinant law. |
| §5.5 endomorphism rings | Supersingular singleton; generic reducible block | Commutative deformation ring versus noncommutative endomorphism algebra distinguishes the cases. Keep prime/block restrictions before all-prime §5.6. |
| §5.6 local R=T | Cayley–Hamilton identity; p=2,3,≥5 | For a rank-two matrix A, A+dA⁻¹=tr(A). At p=2 only the stated torsion bound holds integrally; inverting p gives the isomorphism. |
| §5.7 deformation comparison | Absolutely irreducible residual; split excluded shape; dual numbers | Fixed ψ corresponds to determinant ψε⁻¹ in MF convention. Use schematic comparison, not only tangents or closed points; no-finite-subobject/quotient condition retained. |
| §5.8 universal deformation dual | Residue field; fixed central character; p=2 | Reduction is π̄^∨. The theorem needs p≥5 and both exceptional-shape exclusions; the twist changes determinant by ε² as required. |
| §5.9 Hom removal | M=0,R,R²; compact inverse limits | Evaluation gives 0, End(P)=R and two copies respectively. Tensor products and Hom retain compact topology and continuity. |
| §5.10 cycles | Zero type ring; weight-two crystalline type; framing | Effective cycles force occurring terms to vanish for the zero ring. Dimensions are framed 5/4/4, unframed 2/1/1, with three framing variables; numerical equality is weaker. |
| §5.11 support criterion | Generic residual; peu ramifié cyclotomic residual; N=0 and O[[K]] | Corrected multiplicity-one scope; the nongeneric case can have multiplicity two. Added Hom computations and retained commutativity, projectivity and Cohen–Macaulay conditions. |
| §5.12 Kisin ring from LL | Empty type/block locus; several components; Artinian points | Empty product means zero ring. A product of PIDs need not be local. The universal property must include finite nonreduced L-algebras. |
| §5.13 admittance | σ_{0,0}; niveau-two residual; très ramifié; doubled type constituent | Corrected the location of irreducibility and added multiplicity/uniqueness controls. Cartier dual and scalar normaliser conventions remain fixed. |
| §5.14 BCDT implication | Empty type ring; extended type and its unramified quadratic alternative | Ring nonvanishing uses O-flatness and effective top-dimensional cycles. Ordinary inertial cycles do not select the extended branch; acceptability is not inferred. |
| §6.1 p≥5, End=k | Irreducible; nonsplit distinct characters; split scalar | First two cases qualify; the last does not. Peu ramifié exception retains multiplicity two. |
| §6.2 Hu–Tan | χ₁⊕χ₂, χ₁≠χ₂; 1⊕ω; scalar pair | Use framed/versal rings for split residuals; scalar pair is excluded. The exceptional 1⊕ω case uses its separate three-prime formula. |
| §6.3 all odd primes | p=3 cyclotomic extension; p≥5; p=2 | Odd all-residual theorem covers the first and recovers earlier cases; it does not cover p=2. Global component-support inputs remain explicit. |
| §6.4 dyadic generic | Supersingular; distinct-character block; scalar residual | First two are covered; scalar residual needs §6.5. Unframed use requires End=k, otherwise keep framed cycles. |
| §6.5 all dyadic | Scalar extension at p=2; every component | Retain the arithmetic patching hypotheses; no division by 2 or generic-block argument supplies them. |
| §6.6 Kisin inequality | Ramified/unramified/split scalar classes; cyclotomic extension | Corrected multiplicities 1/2/4 and the residual exclusion are essential. Dimension of support is not module rank, and ordinary formal smoothness is not used. |
| §6.7 finiteness | Supersingular block; exceptional trace ψ+ψε; arbitrary p | Keep finite generation and finite-length category restrictions. The exceptional trace is excluded from the stated characteristic-zero equivalence. |
| §6.8 occurrence | S=0; supersingular block; nonzero irreducible point | S=0 cannot meet the point hypothesis. Projectivity is used in compact Hom; specialisation's continuous dual is the Banach object. |
| §6.9 Drinfeld | ℒ=Le₁; different lines; zero/ordinary Π; small n | Added annihilator, reversed sequence and failed-hypothesis controls. Large-level condition and supercuspidality are essential. |
| §6.10 consumer cases | p=3 cyclotomic extension; p=2 scalar extension | Select Tung's applicable row; neither Kisin's residual exclusion nor a generic theorem can be dropped. Local results are not supplied by their downstream consumers. |

All divisions are restricted to their domains: nonzero characters/units, nonzero log of a nontorsion unit, positive p−1, nonnegative symmetric-power degrees from strict weight inequalities, and permitted coefficient extensions for half-unramified characters. The coefficient audit distinguishes O from ℤ_p and residue characteristic from coefficient characteristic. No general statement was replaced by a special-case shortcut.

## Lean signature and validation record

Suggested.lean has 189 lines, eleven light real-bodied definitions/abbreviations, three named theorem signatures and nine proved examples. Its imports are `Mathlib` and the specific smooth-discrete Tau Ceti module used. No carrier, instance or data definition is admitted, no example uses `sorry`, and there is no auxiliary theory development. The period rings, analytic completions, compact categories, deformation rings, cycles and geometry stay in the README and closing comment.

The ten signature spot checks were:

| Lean declaration | README agreement checked |
| --- | --- |
| `GL2Qp.Gp` | Units of the matrix ring on Fin 2 over ℚ_p; p is prime. |
| `GL2Qp.InBorel` | Exactly the zero lower-left-entry condition on an already invertible matrix. |
| `GL2Qp.InMirabolic` | Bottom row (0,1), with nonzero top-left forced by invertibility. |
| `GL2Qp.InMirabolicPlus` | Mirabolic plus both top entries of norm at most one; no false unit condition on the top-left entry. |
| `GL2Qp.weylElement` | Matrix (0 1;1 0), not the BCDT element squaring to −p. |
| `GL2Qp.Character` | Continuous homomorphisms ℚ_p^×→Λ^×, matching the supplier carrier. |
| `GL2Qp.closure_mirabolic_center_weyl` | Abstract generated subgroup equals the whole group; `Subgroup.closure` here does not mean merely topological density. |
| `GL2Qp.mirabolic_inf_center` | Scalar(a) satisfies the mirabolic predicate exactly when a=1. |
| `SmoothTorsion.HasCentralCharacter` / `IsAdmissible` | Scalar action equation and finite-dimensional compact-open invariants over the finite residue field. |
| `SmoothTorsion.finiteLength_of_finitelyGenerated_admissible` | All smoothness, characteristic, central-character, admissibility and k[G]-finite-generation hypotheses present; conclusion is representation length, not vector-space dimension. |

Validation:

- `lean-check` on Suggested.lean exited 0. The only warnings were the three declared theorem `sorry`s; the added negative control is proved.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicLocalLanglandsForGL2Qp.json`: 0 errors, 0 warnings; six planned stages, zero closed stages.
- Mechanical README comparison: all 167 API names and all 102 named packet tests retained, with all 65 targets accounted for.
- `git diff --check`: clean.
- Intake `check-files` on the changed deliverables: 0 problems.

## Remaining mathematical work and handoff

The eighteen accepted-plan gaps remain implementation/proof work: supercuspidal comparison, dyadic trianguline classification, BCDT/nonzero-cycle and extended-type comparisons, normalisation bridges, coefficient adapters, GL₂ finiteness/envelopes, coherent completion, density/Schur, schematic deformation comparison, analytic Fontaine heart, p-adic K-types, Gabriel–Morita, dyadic fixed-determinant type rings, restricted projectivity/Cohen–Macaulayness, Artinian de Rham calculations, local Galois ramification predicates, arithmetic patching and Drinfeld/differential-equation geometry. They have statements and appropriate source routes; this review does not mark them solved.

There is no unfixed package defect recorded by this review. Upstream implementation should start from the README's supplier contracts and layer order and retain the conditional inputs at their uses. The version/hash observations above are preserved for future source checks. No suspicious instruction was encountered in the source data, and no cleared library book was needed.
