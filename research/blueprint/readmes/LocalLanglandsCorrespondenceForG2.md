# The local Langlands correspondence for G₂

The aim is a reusable construction of the parameter map for split G₂ and its packet enhancements, together with the standard/spin comparisons that produce a weak correspondence for PGSp₆. The main G₂ endpoint is a finite-to-one surjection. At residue characteristic three the discrete A₂ packets retain the paper’s possible exception; the subregular packet is complete. The PGSp₆ endpoint assigns weak classes determined by two transfers and does not assert a full enhanced LLC outside the exceptional discrete locus.

Fix a nonarchimedean local field F of characteristic zero, with residue characteristic p, a nontrivial smooth additive character ψ, a Whittaker datum and compatible local reciprocity and unitary induction normalizations. Write WD_F=W_F×SL₂(ℂ). An admissible parameter is continuous on W_F, Frobenius-semisimple there, and algebraic on SL₂. A parameter class always means conjugacy by the named dual group, not arbitrary GL-conjugacy. Boundedness is imposed on the Weil image; discreteness means nonfactorization through a proper dual Levi. Retain the nilpotent monodromy operator in every Frobenius-semisimplified WD comparison.

Use j:SL₃→G₂, i:G₂→Spin₇, q:Spin₇→SO₇, v=q∘i and s:Spin₇→GL₈. The G₂ component group is the raw π₀ centralizer because its centre is trivial. Split PGSp₆ enhancements instead use the Spin₇ component group modulo the image of its central μ₂. A quadratic twist of a PGSp₆ representation uses its similitude modulo squares; the corresponding parameter twist is central in Spin₇. Quadratic-character homogeneous sets can have nontrivial stabilizers.

For G₂, the exceptional supplier’s spade locus lifts to PD×, the heart locus to PGSp₆, the club locus is the part of the heart lifting also to PGL₃⋊⟨duality⟩, and diamond is the rest of the heart. For classical PGSp₆ theta in LG.8–LG.10, the same symbols refer to the *classical* split/anisotropic orthogonal towers. They are different partitions on different representation spaces. Their definitions and duality theorems are imported from their respective owners. The discrete diamond G₂ parameters are those outside the discrete A₂ image.

The main theorem is assembled in LG.7. Its enhanced PGSp₆ theta application is restricted to diamond discrete parameters. The generic-discrete spin diagram has generic **tempered** PGSp₆ as its intermediate codomain: the generic G₂ subregular member lifts to a proper Siegel-induced constituent. LG.5 proves the diamond identity and specifies the separate club calculation. LG.10 assembles the weak correspondence only after the explicit proper-Levi and lower-tower obligations of LG.9–LG.10.

## Existing foundations and ownership

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Matrix diagonalization and characteristic polynomials supply the concrete torus checks. Mathlib’s spinGroup is an existing Clifford-algebra submonoid; it does not by itself provide the pinned dual-group/parameter models needed here. No absent Langlands carrier is simulated in the suggested Lean file.

The current TauCetiRoadmap main was also read at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ReductiveGroups, RepresentationTheory/ClassicalGroups, RepresentationTheory/SpinRepresentations and the newer OrthogonalSpinGroups roadmap own the group and Clifford foundations. In particular, `TauCeti.D4Tripled.trialityAutomorphism` is an integral group-scheme automorphism, with root-subgroup and order-three theorems, not just a diagram permutation. Reuse it; LG.2 owns only the rational model comparison, central quotient descent and its theta application. The G₂ short-root root-datum carrier is also existing current work; its own documentation separates explicit torus/root data from identification with a separately defined reductive group. No group classification or general spinor-norm project is planned here.

The reviewed library coverage for AL.3–AL.4 (AUDIT-14) and MP.3 (AUDIT-15) reports the relevant analytic/parameter/theta theory absent, while recognizing existing matrix polynomial and abstract coinvariant support. The new roadmap has no reviewed audit of its own. Missing audit entries under the current ML, ET and SR ids are not evidence of absence. Searches of the pinned and current Tau Ceti trees found no exceptional LLC, WD parameter, Xu packet or automorphic theta carrier; the actual current Lie/Spin declarations were then inspected to avoid duplicating them.

| Supplier | Imported mathematics and boundary |
|---|---|
| ExceptionalThetaCorrespondencesForG2 (routed candidate) | Exceptional parameters and desiderata, local Howe duality/dichotomy, explicit induction formulas, quaternion-period lemmas, global exceptional kernels and the spin-pole converse. No addressable stage exists yet; its exact contract is an explicit gap. |
| ModularityAndLanglandsExtensions:ML.4 | Arthur local packets, Xu’s local packets and global multiplicity formula. Use exact packet nodes where present; preserve the supplier’s trace-formula-input register and request the global transfer and two-place cancellation exports. |
| EndoscopicTransferAndUnitaryTraceComparison:ET.6 | GL_n LLC, inner-form JL, full WD compatibility and the local converse version required for tempered GL₇ parameters. |
| AutomorphicGaloisRepresentationsPartII:AG2.2, AG2.5, AG2.6 | Algebraic Galois realizations, ramified prime-to-ℓ and coefficient-prime compatibility with normalization and N. Kret–Shin and Chenevier descent are distinct source-gated inputs. |
| AutomorphicLFunctionsAndLocalFactors:AL.3–AL.4 | Existing Rankin–Selberg factors, isobaric strong multiplicity one and boundary nonvanishing; request the Langlands–Shahidi spin extension rather than redeveloping it. |
| MetaplecticAutomorphicForms:MP.3 | Classical similitude theta, all proper-Levi and twist formulas, outer orbits, and complex-place comparison. Rallis and tower-property input belongs to the pending Shimura–Waldspurger Part II, which has no addressable stage here. |
| SmoothRepresentationsOfLocalGroups:SR.2–SR.3 | Normalized induction, Jacquet functors, admissibility and Langlands classification. |
| SmoothRepresentationsOfLocalGroupsPartII:SRU.1, SRU.3–SRU.4 | Corrected Fell closure/isolation-to-summand, generic standard modules and Steinberg/supercuspidal isolation. The older proposed UnitaryDual name has been absorbed here. Request relative generic and archimedean isolation in this existing direction. |
| AutomorphicFormsOnReductiveGroups:AF.2–AF.3; AutomorphicSpectralTheory:AS.6 | Automorphic Hilbert spaces, cuspidality, Poincaré weak containment and the density-theorem proof boundary. |
| Tau Ceti ClassFieldTheory, ReductiveGroups, SpinRepresentations and OrthogonalSpinGroups | Brauer invariants, local duality, pinned group models, existing spin representations, triality and rational spinor norms. These foundations are imported. |

Kret–Shin Theorem A, Chenevier Theorem E and Theorem 6.4, the independent gamma characterization and Shin Theorem 5.8 are stated below with their published hypotheses. They are source-gated contracts with named proof-ownership gaps, not axioms silently added to a claimed closed graph. Likewise the Arthur/Xu supplier’s unclosed trace-formula inputs propagate to every dependent endpoint.


Two source comparisons require particular care. Kret–Shin Proposition 13.1(4), PDF pp. 60–61 (journal pp. 134–135), proves spin Galois irreducibility under the full Steinberg, cohomological and spin-regular hypotheses. It supports the special globalization’s GL₈ cuspidality after algebraic-summand comparison; the general spin transfer is still isobaric. Shin’s Corollary 4.12, author PDF p. 24, permits the explicit PGSp₆ weight sequence λ_t=t(8,4,2); its shifted coordinates h=(8t+3,4t+2,2t+1) have eight distinct spin weights and satisfy the density growth condition.

## Layers and targets

### LG.0. Dual groups, conjugacy and parameter detection

Targets: `dual-diagram`, `a2-weight-model`, `branching`, `a2-parameters`, `spin-parameters`, `standard-injectivity`, `quadratic-rigidity`, `weak-equivalence`, `elementwise-conjugacy`, `chenevier-local`, `chenevier-galois`, `unacceptability-test`.

#### dual-diagram — Exceptional dual-group embeddings

Fix the standard inclusions j:SL₃(ℂ)→G₂(ℂ), i:G₂(ℂ)→Spin₇(ℂ), q:Spin₇(ℂ)→SO₇(ℂ), the vector representation v=q∘i, and the eight-dimensional spin representation s. The kernels are ker(j)=ker(i)=ker(v)=1 and ker(q)=μ₂. Their induced maps on admissible parameter conjugacy classes use these fixed embeddings, not arbitrary identifications of abstract groups.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`, `mathlib:spinGroup`.

Proof route: Import the pinned split groups and Clifford representations. Compare the current short-root G₂ carrier with octonion automorphisms; use the G₂ stabilizer of a nonisotropic spinor to construct i. Check root and central normalizations; functoriality then induces maps on parameter classes. The exceptional parameter carrier remains a supplier gap.

API:

- `G2Dual.j_injective` (characterisation): j is injective on complex points.

- `G2Dual.spinCentre` (simp): s(−1)=−Id₈ and q(−1)=Id₇.

- `G2Dual.mapParameter_comp` (functoriality): Composition of dual embeddings agrees with composition on parameter classes.

- `G2Dual.parameter_conj` (compatibility): Conjugate representatives give conjugate composite parameters.

- `G2Dual.mapParameter_ext` (extensionality): Equal conjugacy classes have equal images under each named dual embedding; equality of composite maps gives equality of the induced parameter maps.

Uses: GS Lemma 2.4, pp. 9–10 — Defines all three parameter comparisons; GS Propositions 5.1–5.2, pp. 20–21 — Distinguishes standard and spin data.

Checks:

- `G2Dual.centralCubic` (compatibility): A primitive cubic scalar in SL₃ has order three after j; it is not killed.

- `G2Dual.spinSign` (non-example): The two central elements ±1 of Spin₇ have equal q-images and unequal spin images.

- `G2Dual.trivial` (compatibility): The trivial parameter maps to the trivial parameter, including its SL₂ factor.

Acceptance: The centre of SL₃ survives in G₂, whereas the central −1 of Spin₇ dies under q.

Sources: [GS] §1.1, p. 3; §2.2, pp. 9–10 — The dual-group diagram fixes j, i, q, v and s; identifying current integral group carriers with these complex models remains an explicit prerequisite.

Planet: Exceptional dual-group embeddings.

#### a2-weight-model — The A₂ torus restriction model

For a,b∈ℂˣ define A₂ vector eigenvalues d₇(a,b)=(1,a,b,(ab)⁻¹,a⁻¹,b⁻¹,ab), D₇=diag(d₇), and D₈=diag(1,d₇). Define P₇=charpoly(D₇). This is a concrete torus calculation for the restriction v∘j, not a definition of G₂ or of its parameters.

Hypotheses: a,b are units of ℂ.

Prerequisites: `mathlib:Matrix.diagonal`, `mathlib:Matrix.charpoly`, `mathlib:Matrix.charpoly_diagonal`.

Proof route: Use the weights of 1⊕3⊕3∨ on diag(a,b,(ab)⁻¹). Read characteristic polynomials from the existing diagonal-matrix theorem.

API:

- `G2Atlas.a2Seven` (data): The seven diagonal entries are the ordered list in the definition.

- `G2Atlas.a2Vector` (data): D₇ has these diagonal entries and zero off the diagonal.

- `G2Atlas.a2Spin` (data): D₈ adds a first diagonal entry equal to one.

- `G2Atlas.a2Polynomial` (data): P₇ is Matrix.charpoly of D₇.

- `G2Atlas.a2Polynomial_factorization` (characterisation): P₇=(X−1)(X−a)(X−b)(X−(ab)⁻¹)(X−a⁻¹)(X−b⁻¹)(X−ab).

- `G2Atlas.det_a2Vector` (structure): det(D₇)=1 for every pair of complex units a,b.

- `G2Atlas.charpoly_a2Spin` (compatibility): charpoly(D₈)=(X−1)P₇.

- `G2Atlas.a2Polynomial_natDegree` (structure): P₇ has degree seven, including when eigenvalues coincide.

- `G2Atlas.a2Polynomial_monic` (structure): P₇ is monic.

Uses: GS Lemma 2.4(i), pp. 9–10 — Checks the degree-seven L-factor on the A₂ image; GS Proposition 5.2, p. 21 — Checks the additional invariant line in spin.

Checks:

- `G2Atlas.identitySpectrum` (computation): a=b=1 gives D₇=Id₇ and P₇=(X−1)⁷.

- `G2Atlas.signSpectrum` (computation): a=−1,b=1 gives P₇=(X−1)³(X+1)⁴.

- `G2Atlas.missingDualDetected` (non-example): a=2,b=3 gives spectrum {1,2,3,1/6,1/2,1/3,6}; replacing 3∨ by another 3 changes this multiset.

- `G2Atlas.spinExtraOne` (compatibility): D₈ has one extra eigenvalue one, even when D₇ already has eigenvalue one.

Acceptance: P₇ is monic of degree seven and det(D₇)=1; charpoly(D₈)=(X−1)P₇.

Sources: [GS] §2.2, Lemma 2.4(i), pp. 9–10; §4.1, p. 17 — The restrictions to SL₃ give the seven weights and the extra invariant spinor line. The ordered diagonal matrices and polynomial are concrete checks derived from those restrictions.

Planet: A₂ torus restriction.

#### branching — Restriction of the vector and spin representations

v∘j≅1⊕Std₃⊕Std₃∨ and s∘i≅1⊕v. Under Spin₇→Spin₈, the eight-dimensional vector representation restricts to 1⊕q and each half-spin representation restricts to s. Each equality is an isomorphism of algebraic representations, hence also of composed Weil–Deligne representations.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/dual-diagram`, `LG.0/a2-weight-model`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`.

Proof route: Compare highest weights and dimensions using the imported B₃ and D₄ fundamental representations. Identify the invariant spinor line and its seven-dimensional orthogonal complement.

Acceptance: The dimensions are 7,8,8; the invariant line has trivial Weil and SL₂ action.

Sources: [GS] §2.2, pp. 9–10; §4.1, p. 17 — The stated restrictions are the representation identities used for parameter and triality comparisons; their group-model realization is imported from SpinRepresentations.

#### a2-parameters — Detection of discrete A₂ parameters

j induces an injection Φ(PGL₃)/(τ↦τ∨)→Φ(G₂). For a discrete G₂ parameter φ, its class lies in this image exactly when L(s,vφ) has a pole at s=0. If φ=jφτ with φτ discrete, Sφ=π₀Z_G₂(φ) is μ₃ when φτ is not self-dual and S₃ when φτ is self-dual.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/dual-diagram`, `LG.0/branching`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Identify the normalizer of SL₃ in G₂ and its duality involution; apply Griess conjugacy as required by the source. For discrete parameters compute the invariant subspace and the centralizer, including the normalizer extension in the self-dual case.

Acceptance: Do not infer the S₃ enhancement classification from the μ₃ centralizer calculation.

Sources: [GS] §2.2, Lemma 2.4(i), pp. 9–10 — Lemma 2.4(i) gives the duality quotient, pole criterion and the μ₃/S₃ alternatives for discrete parameters. Its cited conjugacy and centralizer proofs remain a named gap.

Planet: Detection of A₂ parameters.

#### spin-parameters — Detection of exceptional Spin₇ parameters

i_*:Φ(G₂)→Φ(PGSp₆) is injective. On discrete φ outside the A₂ image (the diamond locus), iφ is discrete, its spin L-factor has a pole at zero, and conversely a discrete Spin₇ parameter with that pole is iφ for a unique diamond φ. For such φ, i induces Sφ≅S_{iφ}/image Z(Spin₇).

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/dual-diagram`, `LG.0/branching`.

Proof route: Use the stabilizer of a nonisotropic invariant spinor and complete reducibility to pass from a pole to a G₂ subgroup. Apply the conjugacy and centralizer comparison of Gross–Savin; quotient the central μ₂ before comparing labels.

Acceptance: The central quotient is indispensable; this statement makes no discreteness claim for i of an A₂-discrete parameter.

Sources: [GS] §2.2, Lemma 2.4(ii), p. 9; §8.3, p. 24 — Lemma 2.4(ii) gives injectivity and discrete spin-pole detection; §8.3 supplies the component-group central quotient, with the exceptional conjugacy proof gate retained.

Planet: Spin detection of G₂ parameters.

#### standard-injectivity — The standard parameter determines the G₂ parameter

v_*:Φ(G₂)→Φ(GL₇) is injective on conjugacy classes. It carries the diamond discrete locus into the discrete SO₇ parameters; it is not asserted to carry every G₂-discrete parameter into an irreducible GL₇ parameter.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/dual-diagram`.

Proof route: Use Griess conjugacy for G₂ inside SO₇ and the orthogonal conjugacy comparison. Retain the full algebraic SL₂ action when passing between WD and W×SL₂.

Acceptance: The A₂ branching example is reducible of dimension seven and must remain allowed.

Sources: [GS] §2.2, Lemma 2.4(iii), p. 9; §3.4, p. 13 — Lemma 2.4(iii) is the required injectivity on G₂ parameter classes. The paper invokes Griess; no assertion of general Spin₇ acceptability is made.

#### quadratic-rigidity — Quadratic twist rigidity on the G₂ image

Let ρ:Γ→G₂(ℂ) be completely reducible and χ:Γ→{±1} nontrivial. If iρ and χ·iρ are not Spin₇-conjugate, then (vρ)⊗χ has no invariant vector. In particular, if s(χ·iρ)≅1⊕vρ, then χ·iρ is conjugate to iρ.

Hypotheses: Γ is a group, ρ is completely reducible, and χ is a nontrivial quadratic character.

Prerequisites: `LG.0/branching`, `LG.0/standard-injectivity`.

Proof route: Apply HKT Lemma 4.6 to the semisimple Zariski closure. A trivial summand in the twisted spin representation gives an invariant nonisotropic spinor after choosing a nondegenerate fixed subspace. Its stabilizer is G₂; invoke standard injectivity. Do not use the false assertion that every nonzero isotropic spinor has stabilizer G₂.

Acceptance: A χ-stable exceptional image may have a nontrivial quadratic stabilizer; the conclusion is conjugacy, not χ=1.

Sources: [HKT] Lemma 4.6 and proof, PDF pp. 21–22 — Lemma 4.6 gives the contrapositive twist-rigidity criterion for a completely reducible G₂ image. The proof here makes the invariant spinor nonisotropic using semisimplicity.

Planet: Quadratic twist rigidity.

#### weak-equivalence — Weak equivalence of Spin₇ parameters

For Spin₇ parameters φ,φ′ put φ∼wφ′ exactly when qφ≅qφ′ as SO₇ parameters and sφ≅sφ′ as GL₈ parameters. Define Φw(PGSp₆)=Φ(PGSp₆)/∼w. These are conjugacy classes of WD parameters before taking the additional quotient.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/dual-diagram`.

Proof route: Use isomorphism of composed parameters to define an equivalence relation; take its set quotient. Keep the standard and spin comparisons simultaneously, with their algebraic SL₂ factors.

API:

- `WeakSpinParameter.quotient` (constructor): Every admissible Spin₇ parameter gives a weak class.

- `WeakSpinParameter.eq_iff` (characterisation): Two quotient classes agree exactly when both the standard and spin parameters agree.

- `WeakSpinParameter.twist` (functoriality): Quadratic twisting acts on weak classes and commutes with quotient formation.

- `WeakSpinParameter.standard` (projection): qφ depends only on the weak class; the same holds for sφ.

- `WeakSpinParameter.lift` (universal-property): Any function on parameter classes constant whenever both q and s agree factors uniquely through Φw.

Uses: GS Theorem 12.3, p. 36 — Records the uniqueness that the two transfers actually prove; GS Theorems 12.6–12.7, pp. 38–40 — Provides the codomain of the weak correspondence.

Checks:

- `WeakSpinParameter.reflexive` (compatibility): A parameter and its conjugate represent the same weak class.

- `WeakSpinParameter.centralSign` (non-example): The trivial parameter and the parameter with nontrivial unramified quadratic central character have identical standard and different spin parameters, hence different weak classes.

- `WeakSpinParameter.twiceTwist` (compatibility): Twisting twice by the same quadratic character fixes a weak class.

Acceptance: Equality of q-images alone is insufficient: the two central unramified parameters with Frobenius ±1 have different spin images.

Sources: [GS] §12.1, Definition 12.1, p. 34 — Definition 12.1 identifies parameters by both their SO₇ standard image and their GL₈ spin image, after taking the ordinary conjugacy classes.

Planet: Weak Spin₇ parameters.

#### elementwise-conjugacy — Weak equivalence and elementwise conjugacy

Two admissible Spin₇(ℂ) parameters are weakly equivalent exactly when their values at every element of W_F×SL₂(ℂ) are Spin₇-conjugate. This relation can be strictly weaker than conjugacy by a single element.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/weak-equivalence`.

Proof route: Use Chenevier–Gan Lemma 3.10 to recover a semisimple conjugacy class from the standard class and spin trace. Recover the standard and spin representation isomorphisms from characters on a reductive Zariski closure. For the forward implication at every W_F×SL₂ element, additionally prove that conjugacy of semisimple parts extends to the commuting unipotent parts; neither a compact maximal subgroup nor Zariski density alone supplies conjugacy on nonsemisimple elements.

Acceptance: A proof must justify the passage beyond compact elements; this is not an assertion that Spin₇ is acceptable.

Sources: [GS] §12.1, Lemma 12.2, p. 34 — Lemma 12.2 states the full parameter target. The compact conjugacy criterion alone does not discharge its nonsemisimple SL₂ cases; that extension is recorded as a gap; [CG] Lemma 3.10 and Proposition 3.12, PDF pp. 9–11 — Standard conjugacy and the spin character distinguish semisimple conjugacy classes; this is the group-theoretic input for the weak relation.

#### chenevier-local — Chenevier local G₂ factorization input

Let k be totally real and A a cuspidal automorphic representation of GL₇(A_k), regular algebraic at every real place. The following are equivalent: almost every Satake parameter of A lies in v(G₂(ℂ)); at every finite place u the full local parameter of A_u has a unique G₂-valued lift modulo G₂-conjugacy. Translate Chenevier’s W×SU₂ convention to algebraic W×SL₂ without discarding monodromy.

Hypotheses: k is totally real; A is cuspidal on GL₇ and regular algebraic at all real places.

Prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `LG.0/standard-injectivity`.

Proof route: Use Chenevier Theorem E / Corollary 6.8, including its Galois and group-theoretic arguments. The proof and convention bridge are a source-gated input: no supplier currently exposes this theorem in the atlas.

Acceptance: Neither cuspidality nor regular algebraicity may be dropped in this input.

Sources: [C] Theorem E, p. 100; Corollary 6.8, pp. 149–150 — Theorem E and Corollary 6.8 provide the orthogonal local factorization criterion with semisimplicity, spin-polynomial and no-quadratic-character hypotheses as stated; the WD convention bridge remains open.

#### chenevier-galois — Chenevier G₂-valued Galois input

For the same k,A satisfying the almost-everywhere G₂ Satake condition, a coefficient field E, a prime ℓ and λ|ℓ of E, the associated semisimple r_{A,λ}:G_k→GL₇(Ē_λ) is v∘r̃ for a continuous semisimple r̃:G_k→G₂(Ē_λ), unique up to G₂-conjugacy. Semisimple means reductive identity component of the Zariski closure. This is not an independent all-places local–global compatibility theorem.

Hypotheses: The hypotheses of Chenevier Theorem 6.4, including a coefficient field and condition (G).

Prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.2`, `LG.0/standard-injectivity`.

Proof route: Apply Theorem 6.4 using its condition (G); the condition forces self-duality, so the Galois representation of §6.2 is available. Keep ramified and ℓ-adic local compatibility as separate imported requirements.

Acceptance: A global standard representation determines the G₂ lift up to G₂-conjugacy, not merely GL₇-conjugacy.

Sources: [C] §§6.2–6.3, Theorem 6.4, pp. 147–148 — Theorem 6.4 supplies the G₂-valued lift under the stated totally real, algebraic, selfdual and archimedean hypotheses; it does not itself prove all ramified or coefficient-prime local comparisons.

#### unacceptability-test — An explicit failure of acceptability

Let Γ=μ₄×μ₄ with projection characters a,b and let V have characters {a,ab²,b,ba²}; det V=1 gives r:Γ→SU₄=Spin₆→Spin₇. Put η=b². Then r and ηr are elementwise Spin₇-conjugate and have isomorphic standard and spin representations, but are not conjugate by one Spin₇ element. This is a finite-group test of the weak quotient; it is not claimed to be a pair of KS parameters of one automorphic representation.

Hypotheses: Γ and a,b,V,η are exactly as specified; use the compact Spin groups and then complexify.

Prerequisites: `LG.0/weak-equivalence`, `LG.0/elementwise-conjugacy`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`.

Proof route: Check the character multisets and use that Γ is covered by ker(a²), ker(b²) and ker((ab)²) for elementwise conjugacy up to duality. Neither ηV nor its dual is isomorphic to V. Apply the normalizer comparison and CG Corollary 4.6 to rule out global conjugacy.

Acceptance: Any API identifying a weak class with a unique full conjugacy class fails this example.

Sources: [CG] §4, Example 1, Proposition 4.7 and Corollary 4.8, PDF pp. 13–14 — Example 1 and Proposition 4.7 give the specified quadratic central twist; Corollary 4.8 gives elementwise but not simultaneous conjugacy. This is a guard against replacing weak classes by conjugacy classes.

### LG.1. Globalization with periods and Whittaker models

Targets: `period-spectrum`, `generic-spectrum`, `poincare-transfer`, `relative-globalization`, `cuspidal-exceptional-theta`, `g2-isolation`, `generic-globalization`.

#### period-spectrum — The spectrum detected by a quaternion period

Let k be totally real, O a totally definite octonion k-algebra split at every finite place, G=Aut(O), and D⊂O a quaternion subalgebra. Let G_D fix D pointwise. Inside L²(G(k)\G(A_k)), L²_D is the orthogonal complement of the closed span of automorphic representations all of whose vectors have zero G_D(k)\G_D(A_k)-period. The period uses the fixed quotient measure.

Hypotheses: k,O,G,D as in the statement; periods are defined on automorphic smooth vectors.

Prerequisites: `AutomorphicFormsOnReductiveGroups:AF.2`.

Proof route: Import automorphic Hilbert spaces and homogeneous-space measures. Take the closed zero-period spectral span before taking its orthogonal complement; do not define a pointwise kernel of an unbounded period functional on arbitrary L² vectors.

API:

- `QuaternionPeriodSpectrum.projector` (projection): The closed spectral subspace has an orthogonal projection commuting with G(A_k).

- `QuaternionPeriodSpectrum.selected_period` (characterisation): An irreducible automorphic copy contained in L²_D has period not identically zero on its smooth vectors.

- `QuaternionPeriodSpectrum.conjugate` (compatibility): Conjugate quaternion embeddings give unitarily identified period spectra.

- `QuaternionPeriodSpectrum.zeroSpan` (universal-property): Writing Z_D for the closed span of all zero-period automorphic copies, L²_D=Z_D⊥ and orthogonal projection induces the canonical Hilbert-space isomorphism L²/Z_D≅L²_D.

- `QuaternionPeriodSpectrum.projector_ext` (extensionality): The orthogonal projector is determined by its kernel Z_D and image Z_D⊥; this characterization retains the embedded spectral multiplicities.

Uses: GS Proposition 10.5, pp. 28–29 — Selects a globalization carrying the period needed for exceptional theta; GS Corollary 10.6, p. 29 — Converts the period into theta nonvanishing.

Checks:

- `QuaternionPeriodSpectrum.constant` (compatibility): The constant automorphic representation has nonzero period and lies in the selected spectrum.

- `QuaternionPeriodSpectrum.zeroPeriod` (non-example): A summand with identically zero period has zero projection to L²_D.

- `QuaternionPeriodSpectrum.scaleMeasure` (compatibility): Multiplying the quotient measure by a nonzero positive scalar leaves the spectral subspace unchanged.

- `QuaternionPeriodSpectrum.multiplicityTwo` (non-example): In the orthogonal multiplicity model V⊕V with period P(v₁,v₂)=P₀(v₁)+P₀(v₂), the zero-period spectral copy is anti-diagonal and the selected copy is diagonal. The first coordinate copy has nonzero period but is not contained in the selected subspace.

Acceptance: Every irreducible automorphic copy contained in L²_D has a nonzero period. A copy with zero period has zero projection. Nonzero period on an arbitrary embedded copy does not by itself imply containment in L²_D when multiplicities occur.

Sources: [GS] §10.2, p. 28 — The selected space is the orthogonal complement of all zero-period spectral copies. The source deduces nonvanishing on copies contained in it, without an iff for arbitrary embedded copies.

Planet: Quaternion period spectrum.

#### generic-spectrum — The fixed-supercuspidal generic spectrum

For split simple G/k, a global Whittaker character ψ, a finite place w and a generic supercuspidal σ of G(k_w), let L²_{ψ-gen,σ} be the orthogonal complement, inside the σ-isotypic cuspidal L² part at w, of the closed span of copies on which the global ψ-Whittaker functional vanishes. It is the globally generic selected spectrum with this exact local component. Its Hilbert decomposition retains the surviving automorphic multiplicities; local Whittaker models alone do not define it.

Hypotheses: k is a number field; G is split simple; σ is generic supercuspidal and ψ is a nondegenerate global Whittaker character.

Prerequisites: `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicFormsOnReductiveGroups:AF.3`.

Proof route: Select the global cuspidal constituents satisfying both conditions and complete their Hilbert sum. Keep the actual automorphic multiplicity spaces and their global Whittaker functional; select generic embedded copies or equivalently the orthogonal complement of the zero-Whittaker spectral span in the fixed-σ cuspidal part. No general automorphic multiplicity-one theorem is assumed.

API:

- `GenericSpectrum.component` (projection): Every irreducible copy in the selected orthogonal complement is cuspidal, has nonzero global ψ-Whittaker functional, and has local component σ at w.

- `GenericSpectrum.weakContainment` (characterisation): Weak containment is computed using this Hilbert sum of selected irreducibles.

- `GenericSpectrum.whittakerRescale` (compatibility): Conjugate global Whittaker data transport the subspace and its constituent conditions.

- `GenericSpectrum.projector` (projection): Projection to the closed selected subspace commutes with the adelic action; its kernel in the fixed-σ cuspidal part is the zero-Whittaker spectral span.

Uses: GS Proposition 10.7, pp. 29–30 — Applies weak containment and isolation inside this specified global family; GS Lemma 10.8, p. 30 — Identifies the relative isolation locus for G₂.

Checks:

- `GenericSpectrum.wrongLocal` (non-example): A generic cuspidal representation with w-component inequivalent to σ is excluded.

- `GenericSpectrum.nongeneric` (non-example): A nongeneric cuspidal summand with w-component σ is excluded.

- `GenericSpectrum.allowed` (non-example): In a multiplicity-two model V⊕V with Whittaker functional W(v₁,v₂)=W₀(v₁)+W₀(v₂), W₀ nonzero, the selected part is the diagonal copy; the anti-diagonal copy is excluded. Taking the full isotypic component would wrongly include it.

Acceptance: The selected w-component is exact, not just in the same inertial class.

Sources: [GS] §10.3, p. 29 — The local component σ and global Whittaker nonvanishing jointly specify the cuspidal family used in Proposition 10.7; the Hilbert sum retains automorphic multiplicities.

Planet: Generic cuspidal spectrum.

#### poincare-transfer — Poincaré series and weak containment

In the quaternion-period setting, the prescribed product of local distinguished representations is weakly contained in the restriction of L²_D. In the Whittaker setting with fixed supercuspidal σ at w, products of generic square-integrable local representations, together with hyperspecial vectors away from the prescribed places and one auxiliary place, are weakly contained in L²_{ψ-gen,σ}. The local embeddings and support conditions are part of the input.

Hypotheses: The global quaternion-period or fixed-supercuspidal Whittaker data, local embeddings, Haar measures and prescribed support in the statement.

Prerequisites: `LG.1/period-spectrum`, `LG.1/generic-spectrum`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.1/gan-savin-isolated-summand`, `SmoothRepresentationsOfLocalGroups:SR.2`, `AutomorphicFormsOnReductiveGroups:AF.2`.

Proof route: Apply the Poincaré-series weak-containment construction of Sakellaridis–Venkatesh, as used in GS Proposition 10.5 and 10.7. Use the imported local distinguished embeddings and the generic discrete-series summand of L²_ψ(U\G). The exact analytic input is requested from the automorphic supplier, not reconstructed here.

Acceptance: Weak containment yields a summand only after the relevant relative isolation theorem is applied.

Sources: [GS] §10.2, proof of Proposition 10.5, pp. 28–29; §10.3, proof of Proposition 10.7, pp. 29–30 — The two proofs invoke homogeneous-space Poincaré series to obtain weak containment. Their precise measure, local-vector and extra-place contracts are requested from AF.2.

#### relative-globalization — Globalization with a nonzero quaternion period

For a nonempty finite set S of finite places of totally real k, prescribe π_u on split G₂(k_u), each supercuspidal with nonzero PGSp₆ theta lift or Steinberg, and prescribe any irreducible finite-dimensional representation of compact G₂(k_u) at each real u. There are D⊂O and an automorphic Π of Aut(O) with those exact local components and nonzero D-period.

Hypotheses: k is totally real; O is definite at every real place and split at finite places; the nonempty prescribed finite set and all local representations are as in the statement.

Prerequisites: `LG.1/poincare-transfer`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.4/steinberg-isolated`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.4/supercuspidal-isolated`.

Proof route: Choose local D_u using the exceptional local period lemmas and globalize the quaternion algebra inside the definite octonion algebra. Apply Poincaré weak containment and the corrected isolated-summand theorem, not a subsequence claim about an indexed family.

Acceptance: The finite set S is nonempty; the real components need not yet be regular.

Sources: [GS] §10.2, Proposition 10.5 and proof, pp. 28–29 — Proposition 10.5 prescribes Steinberg/supercuspidal finite components and compact real components in a quaternion-period spectrum. Isolation-to-summand uses the corrected Fell-closure statement.

Planet: Quaternion period globalization.

#### cuspidal-exceptional-theta — Cuspidal global exceptional theta lifts

For Π constructed by quaternion-period globalization, its global theta lift to split PGSp₆ is nonzero. It is cuspidal if a prescribed finite component is Steinberg, or a prescribed real highest weight is regular. Its local components are the nonzero local theta lifts.

Hypotheses: The globalization of Proposition 10.5, with one of the two stated extra hypotheses for cuspidality.

Prerequisites: `LG.1/relative-globalization`.

Proof route: Use the nonzero quaternion Fourier coefficient supplied by the period. Use the constant-term and local cuspidality criterion for the exceptional kernel; import the archimedean regular-weight computation.

Acceptance: Without either additional condition, only nonvanishing is claimed.

Sources: [GS] §10.2, Corollary 10.6 and proof, p. 29 — Corollary 10.6 uses the quaternion period for theta nonvanishing and the local supercuspidal component for cuspidality, with a nonzero local exceptional lift required.

#### g2-isolation — Relative isolation for generic G₂ discrete series

Let δ be a generic discrete series of G₂(F) whose PGSp₆ theta lift is also discrete series. Fix an auxiliary generic supercuspidal σ whose PGSp₆ theta lift is supercuspidal. Then δ is isolated among irreducible G₂(F) representations occurring locally in the globally generic cuspidal spectrum with auxiliary component σ.

Hypotheses: The two relevant finite places are distinct; δ and its PGSp₆ theta partner are generic discrete series, and the fixed auxiliary σ and its partner are generic supercuspidals.

Prerequisites: `LG.1/generic-spectrum`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3/heiermann-opdam-standard-module`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3/discrete-series-isolated-tempered`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`.

Proof route: Assume a convergent family in this local spectrum. SRU expresses its members as generic standard modules. Use the exceptional explicit induction formulas to transport possible limits to the classical group, where generic discrete series are isolated in the corresponding global family. Conclude using Howe duality.

Acceptance: The hypothesis on the theta lift excludes the club examples whose PGSp₆ lift is induced.

Sources: [GS] §10.3, Lemma 10.8 and proof, p. 30 — Lemma 10.8 transfers relative generic isolation from PGSp₆ using explicit nontempered theta formulas and generic standard modules. Tempered-dual isolation alone is insufficient.

Planet: Generic G₂ isolation.

#### generic-globalization — Globalization of isolated generic discrete series

For split simple G over a number field, prescribe generic discrete series at finitely many places, each isolated among local components of the fixed-supercuspidal globally generic family. Then there is a globally generic cuspidal automorphic representation with those components and spherical components outside that finite set and at most one further finite place. Specify the auxiliary generic supercuspidal in the fixed family as part of the prescribed data.

Hypotheses: G is split simple; all prescribed representations are generic square-integrable and satisfy the stated relative isolation.

Prerequisites: `LG.1/poincare-transfer`, `LG.1/g2-isolation`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.1/gan-savin-isolated-summand`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`.

Proof route: Use Poincaré-series weak containment and relative isolation place by place. For G₂ use Lemma 10.8, for classical groups import ILM, and for real components import the far-from-walls isolation criterion. Keep the extra finite place allowed by Proposition 10.7.

Acceptance: The theorem does not imply all other finite places are spherical; applications comparing functional equations must handle the extra place.

Sources: [GS] §10.3, Proposition 10.7 and proof, pp. 29–30 — Proposition 10.7 prescribes the isolated generic discrete component and an auxiliary supercuspidal component; it permits one further uncontrolled finite place.

Planet: Generic discrete-series globalization.

### LG.2. Triality and the generic spin transfer

Targets: `triality-descent`, `local-spin-lift`, `global-spin-lift`, `spin-gamma`, `spin-twist`.

#### triality-descent — The three triality maps over F

For split D₄ over F construct the natural central isogeny f₁:SO₈→PGSO₈ and its two triality companions f₂,f₃. Their dual maps identify the vector representation and the two half-spin representations of Spin₈. Reuse the integral pinned D₄ triality automorphism already in current Tau Ceti; this target is its comparison, central quotient descent and compatibility with these F-rational group models.

Hypotheses: F is a nonarchimedean local field of characteristic zero; use the fixed split D₄ models and pinned triality.

Prerequisites: `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Proof route: Compare TauCeti.D4Tripled.trialityAutomorphism and its order-three/root-subgroup formulas with the split simply connected D₄ model. Descend the appropriate central quotients and identify the three dual eight-dimensional representations. No new abstract triality automorphism is planned.

API:

- `TrialityMaps.cycle` (relation): The order-three pinned automorphism cycles the vector and two half-spin quotient maps.

- `TrialityMaps.dual` (compatibility): The dual representation of f₁ is vector and those of f₂,f₃ are the two half-spin representations.

- `TrialityMaps.baseChange` (functoriality): The maps commute with extension of characteristic-zero fields.

- `TrialityMaps.spinorTwist` (compatibility): A quadratic similitude twist pulls back along f₂ or f₃ to the corresponding spinor-norm character on SO₈(F).

Uses: GS §4.3, p. 17 — Changes the classical vector lift into the spin lift; GS §12.7, p. 39 — Determines the quadratic twisting formula.

Checks:

- `TrialityMaps.centre` (characterisation): The three eight-dimensional representations of Spin₈ have distinct order-two central kernels.

- `TrialityMaps.threeCycles` (compatibility): Applying the triality cycle three times returns each quotient map.

- `TrialityMaps.fixedSpin7` (compatibility): After restricting to Spin₇, f₁ gives 1⊕q and f₂,f₃ both give s, not 1⊕q.

Acceptance: All three maps are defined over F; a complex diagram automorphism alone is insufficient.

Sources: [GS] §4.1, pp. 16–17 — The three central quotient maps and their dual eight-dimensional representations appear in §4.1. The current integral triality automorphism is reused, with the rational comparison and descent still required.

Planet: Triality over F.

#### local-spin-lift — Local spin transfer for generic PGSp₆

For generic σ∈Irr(PGSp₆(F)), take its nonzero classical theta lift to PGSO₈(F), pull back along f₂, choose a constituent modulo the even-orthogonal outer automorphism, and apply Arthur’s standard transfer to GL₈. This defines SpinLift(σ), independent of that choice and of choosing f₂ or f₃.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.2/triality-descent`, `LG.0/branching`, `MetaplecticAutomorphicForms:MP.3`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use generic theta nonvanishing in the split tower and Arthur’s even-orthogonal parameter normalization. The two constituent choices are outer conjugate and have the same GL₈ transfer; the two half-spin restrictions agree.

API:

- `SpinLift.satake` (compatibility): At unramified places the Satake conjugacy class is composed with s.

- `SpinLift.choice_independent` (characterisation): Changing the SO₈ constituent or exchanging f₂ and f₃ gives the same GL₈ representation.

- `SpinLift.tempered` (compatibility): The lift of a generic tempered σ is tempered.

- `SpinLift.parameter` (projection): Its GL₈ LLC parameter is the transfer of the triality-transformed orthogonal parameter.

Uses: GS Proposition 4.1, pp. 18–19 — Compares analytic spin factors and twisting; GS Definition of KS parameters, p. 20 — Prescribes their eight-dimensional image.

Checks:

- `SpinLift.sphericalIdentity` (compatibility): The unramified tempered parameter trivial on Weil and SL₂ gives eight eigenvalues one.

- `SpinLift.centralSign` (non-example): Multiplying an unramified Spin₇ parameter by central −1 multiplies all eight spin eigenvalues by −1; the vector parameter is unchanged.

- `SpinLift.dimension` (compatibility): The output has rank eight, whereas the Sp₆ standard transfer has rank seven.

Acceptance: At an unramified generic σ, the GL₈ Satake parameter is s of its Spin₇ Satake parameter.

Sources: [GS] §4.2–§4.3, p. 17 — The construction is theta to PGSO₈, triality, restriction and the orthogonal standard transfer; it is defined for generic PGSp₆ and is independent of the outer-orbit choice.

Planet: Local spin lifting.

#### global-spin-lift — Global isobaric spin transfer

If a cuspidal Σ on PGSp₆(A_k) has nonzero cuspidal classical theta lift to PGSO₈, apply triality and the global Arthur standard transfer. The result SpinLift(Σ) is an isobaric automorphic representation of GL₈ with the local SpinLift(Σ_u) at generic finite places, and with the corresponding triality-theta transfer at the remaining places. Isobaricity is the conclusion; cuspidality needs a separate argument.

Hypotheses: k is a number field; Σ is cuspidal on PGSp₆(A_k), with the nonzero cuspidal classical theta lift specified in the statement.

Prerequisites: `LG.2/local-spin-lift`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`, `ModularityAndLanglandsExtensions:ML.4`.

Proof route: Transfer any automorphic SO₈ constituent after triality; constituent independence and strong multiplicity one identify the resulting isobaric representation. Use the local classical theta comparison at each place; at complex places use Adams–Barbasch.

API:

- `GlobalSpinLift.local` (compatibility): Every local standard parameter of the triality transfer matches the prescribed local theta construction.

- `GlobalSpinLift.unique` (characterisation): The unramified spin Satake classes determine the isobaric GL₈ representation.

- `GlobalSpinLift.orthogonal` (structure): The associated global Arthur GL₈ parameter is orthogonal, with trivial determinant.

Uses: GS Proposition 5.1, p. 20 — Constructs the spin Galois comparison using isobaric summands; GS Lemma 8.3, pp. 24–25 — Transfers a spin L-function pole across nearly equivalent global representations.

Checks:

- `GlobalSpinLift.g2Line` (compatibility): On a global exceptional G₂ theta image the spin Satake polynomial has an extra factor X−1.

- `GlobalSpinLift.rankEight` (compatibility): The degrees of all isobaric summands add to eight.

- `GlobalSpinLift.nonCuspidal` (non-example): The case 1⊞A with A cuspidal of rank seven is allowed; a definition requiring GL₈ cuspidality would reject it.

Acceptance: The G₂-image example gives 1⊞a rank-seven transfer and is reducible.

Sources: [GS] §4.3, pp. 17–18; §5.2, p. 21 — The cuspidal theta lift has an isobaric Arthur transfer of degree eight. No cuspidality conclusion is built into this general construction; the extra hypotheses for irreducibility are separate.

Planet: Global spin lifting.

#### spin-gamma — Spin gamma factors and local lifting

For generic discrete-series σ of PGSp₆(F), the Langlands–Shahidi gamma factor γ(s,σ,spin,ψ) equals the standard GL₈ gamma factor of SpinLift(σ). The convention is the unitary automorphic normalization, with the same nontrivial ψ and compatible Haar measures.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.2/global-spin-lift`, `LG.1/generic-globalization`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Proof route: Globalize over a totally complex field using one or two copies of F and prescribed σ, a Steinberg place and a generic supercuspidal place. Compare global functional equations using unramified identities and Adams–Barbasch at complex places; one-versus-two copies removes the possible root-of-unity ambiguity. Resolve or control the extra finite place permitted by Proposition 10.7 before cancelling factors.

Acceptance: No equality for an uncontrolled extra nonspherical local component may be assumed in this proof.

Sources: [GS] §4.4, Proposition 4.1(i) and proof, pp. 18–19 — Proposition 4.1(i) states the local gamma comparison. Its functional-equation proof has an uncontrolled extra-place factor, retained as a proof gap.

Planet: Spin gamma-factor comparison.

#### spin-twist — Quadratic twisting of the generic spin lift

For generic discrete-series σ and a quadratic χ:F×→{±1}, SpinLift(σ⊗χ∘sim)≅SpinLift(σ)⊗χ∘det. Here sim on PGSp₆ means its class modulo squares. The same identity for general generic tempered Siegel lifts is a separate explicit-theta calculation used by the club bridge.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.2/spin-gamma`, `LG.2/triality-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Compare twisted global functional equations and use GL₈ local parameter detection, or use the spinor-norm pullback and the theta twisting identity. Keep the established discrete-series scope separate from the induced club case.

Acceptance: Quadratic twists leave the seven-dimensional standard parameter unchanged and twist the eight-dimensional spin parameter.

Sources: [GS] §4.4, Proposition 4.1(ii), pp. 18–19 — Proposition 4.1(ii) states quadratic-twist equivariance; its deduction uses the gamma comparison and thus inherits its extra-place proof obligation.

### LG.3. The G₂ parameter map and its characterizations

Targets: `standard-containment`, `llc-map`, `alternative-map`, `map-agreement`, `nontempered`, `tempered`, `discrete`, `tempered-small-packets`, `rank-seven-lift`, `pair-gamma`, `gamma-input`, `gamma-compatibility`, `gamma-uniqueness`, `theta-uniqueness`, `global-compatibility`.

#### standard-containment — The classical theta parameter factors through G₂

If π has nonzero exceptional theta lift θ(π) to PGSp₆(F), the local Langlands parameter assigned by Arthur to rest θ(π) is vφ for a unique φ∈Φ(G₂). The restriction is an orbit of Sp₆ constituents under PGSp₆(F), not a chosen constituent without conjugacy control.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/chenevier-local`, `LG.1/cuspidal-exceptional-theta`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `ModularityAndLanglandsExtensions:ML.4`.

Proof route: For nonsupercuspidal π use the explicit exceptional theta formulas and the known Levi LLC. For supercuspidal π globalize on the definite octonion form with a Steinberg place; the rank-seven Arthur transfer is cuspidal and regular algebraic. Apply Chenevier locally and standard injectivity.

Acceptance: The global octonion algebra is over k; its localization at the prescribed place is split.

Sources: [GS] §3.1, Proposition 3.1, p. 11; §3.3, pp. 11–12 — Proposition 3.1 proves the classical standard parameter lies in the G₂ image by globalization and Chenevier descent; all-place Galois comparison is an explicit supplier contract.

Planet: G₂ factorization of theta parameters.

#### llc-map — The G₂ parameter map

Use the exceptional theta dichotomy Irr(G₂)=Irr♠⊔Irr♥. On Irr♠ set L(π)=j rec_PD×(θ_Dπ), using the degree-three division algebra and JL. On Irr♥ let L(π) be the unique G₂ parameter whose v-image is rec_Sp₆(rest θπ). The definition is on representation isomorphism classes.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/standard-containment`, `LG.0/a2-parameters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use uniqueness of the nonzero irreducible local theta quotient on each side and the dichotomy supplied by the exceptional theta owner. Apply JL in the spade case; in the heart case use the proved existence and uniqueness of the G₂ lift.

API:

- `G2LLC.spade` (simp): For π on the division-algebra side, Lπ=j rec_PD×(θ_Dπ).

- `G2LLC.heart` (compatibility): For π on the PGSp₆ side, vLπ=rec_Sp₆(rest θπ).

- `G2LLC.iso` (functoriality): Isomorphic representations give the same parameter class.

- `G2LLC.unique_standard` (characterisation): On Irr♥ the vector parameter uniquely determines Lπ.

Uses: GS §3.4, pp. 12–13 — Determines spectral properties and the rank-seven lift; GS §§6–8, pp. 21–25 — Defines the fibres whose nonemptiness and labels are to be proved.

Checks:

- `G2LLC.steinberg` (compatibility): The G₂ Steinberg representation maps to the principal SL₂ parameter with trivial Weil part.

- `G2LLC.unramified` (compatibility): For an unramified irreducible representation, L agrees with the Satake class and the monodromy prescribed by the spherical LLC.

- `G2LLC.divisionOpposite` (compatibility): Replacing the cubic division algebra by its opposite and the associated PGL₃ parameter by its dual leaves the G₂ parameter unchanged.

Acceptance: The two diagrams of Main Theorem (iv) commute as full WD parameters.

Sources: [GS] §3.1, pp. 10–11 — The two theta branches define the map through the cubic division parameter or through the unique standard G₂ preimage. Existence and uniqueness come from the separate prerequisite nodes.

Planet: The G₂ Langlands map.

#### alternative-map — The split PGL₃ definition

Decompose Irr♥=Irr♣⊔Irr♦ by whether the PGL₃⋊⟨duality⟩ lift is nonzero. On Irr♣ define L_B(π)=j rec_PGL₃(τ), where τ is the underlying PGL₃ constituent of that lift, determined up to duality. On Irr♠ and Irr♦ retain the division and PGSp₆ definitions respectively.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/llc-map`, `LG.0/a2-parameters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use exceptional theta duality to obtain τ modulo τ↔τ∨. Use injectivity modulo the normalizer to descend this prescription to representation classes.

API:

- `G2LLC.splitA2` (simp): For π lifting to τ±, L_Bπ=j rec τ.

- `G2LLC.dual_choice` (characterisation): τ and τ∨ give the same composite G₂ parameter.

- `G2LLC.partition` (data): The three loci spade, club and diamond cover Irr(G₂) disjointly.

Uses: GS Proposition 3.2, pp. 14–16 — Compares split and division theta packets at one A₂ parameter; GS Main Theorem (vi), corrected club case — Provides the explicit Siegel-lift route.

Checks:

- `G2LLC.stPlus` (compatibility): The lift of St_PGL₃⁺ has parameter j of the principal SL₂ in SL₃.

- `G2LLC.stMinus` (compatibility): The lift of St_PGL₃⁻ has the same unenhanced parameter as the plus lift, although it is a different representation.

- `G2LLC.nonselfdualOrbit` (compatibility): A nonselfdual τ and τ∨ have the same image even when they are distinct PGL₃ representations.

Acceptance: No arbitrary sign of the extension τ± is used to change the unenhanced parameter.

Sources: [GS] §3.2, p. 11 — The split PGL₃ branch uses a constituent only up to duality and leaves the division and diamond branches unchanged; [HD] Theorems 8.2 and 8.5, PDF pp. 25–29; Theorem 15.2, PDF pp. 52–53 — The split PGL₃ lifts, their ± genericity, and their exact PGSp₆ Siegel partners supply the explicit comparison.

#### map-agreement — Agreement of the two definitions

L_B=L. More explicitly, if π=θ_B(τ±), then rec_Sp₆(rest θπ)=v j rec_PGL₃(τ), including reducible tempered Siegel inductions and non-tempered Langlands quotients.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/alternative-map`, `LG.3/llc-map`, `LG.0/branching`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use the companion paper’s explicit theta formulas for nonsupercuspidal representations and Theorems 8.2, 8.5, 15.2 for the remaining PGL₃ lifts. Compare the resulting Levi parameters after normalized induction; apply vector injectivity.

Acceptance: The generic constituent of I₃(St_PGL₃) is tempered and not discrete series.

Sources: [GS] §3.2, p. 11 — The paper compares the two definitions using the explicit theta formulas. The required nontempered, tempered and selfdual constituent formulas are imported, rather than inferred from Howe duality alone; [HD] Theorems 8.2 and 8.5, PDF pp. 25–29; Theorem 15.2, PDF pp. 52–53 — The split PGL₃ lifts, their ± genericity, and their exact PGSp₆ Siegel partners supply the explicit comparison.

#### nontempered — Non-tempered Langlands quotients and singleton packets

For every non-tempered π=J_P^G₂(τ), with τ the standard essentially tempered inducing data in a proper Levi, Lπ is rec_M(τ) followed by M∨→G₂∨. This gives a bijection between non-tempered representations and non-tempered parameter classes. The proper Levis are the two copies of GL₂ and the split rank-two torus.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/map-agreement`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Import Langlands classification with normalized induction and the positive chamber convention. Insert the explicit exceptional theta standard-module formulas, compare the two GL₂ embeddings separately, and identify their unique Langlands quotients.

Acceptance: Use Langlands quotients, not arbitrary constituents of a reducible standard module.

Sources: [GS] §3.4, p. 12 — The nontempered classification identifies positive Langlands quotients and singleton packets. The exact proper-Levi theta formulas are supplier inputs, with normalized induction fixed; [HD] §13.3, Lemma 13.4, PDF p. 42; §13.5, Lemma 13.8, PDF p. 47; Theorem 15.1(v), PDF p. 52 — The explicit nontempered exceptional theta formulas supply the induction comparison, under the supplier contract retained in this packet.

#### tempered — Tempered induction and the parameter map

π is tempered exactly when Lπ has bounded Weil image. If π is a constituent of normalized induction from a unitary discrete series τ of a proper Levi M, then Lπ is the composite of rec_M(τ) with the dual Levi embedding.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/map-agreement`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use the tempered classification and the explicit theta induction/reducibility formulas, including both maximal parabolics. Check each constituent shares the appropriate bounded inducing parameter.

Acceptance: The Weil image, rather than the algebraic SL₂ image, is required to be bounded.

Sources: [GS] §1.1(ii), p. 3; §3.4, p. 12 — The main theorem and §3.4 identify bounded Weil image with temperedness, using the classification and parameter comparisons of the earlier nodes.

#### discrete — Discrete series detection

π is square-integrable precisely when Lπ does not factor through a proper dual Levi. This condition concerns the full WD parameter, and allows a nontrivial Deligne SL₂.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/tempered`, `LG.0/a2-parameters`, `LG.0/spin-parameters`.

Proof route: Check discrete versus induced cases with the exceptional theta classification; use the A₂ and diamond parameter detection results. Separate supercuspidal parameters from parameters carrying a nontrivial SL₂.

Acceptance: The G₂ Steinberg parameter is discrete but not trivial on SL₂.

Sources: [GS] §1.1(i), p. 3; §3.4, p. 12 — The discrete-series criterion is nonfactorization through a proper dual Levi; it does not equate discrete G₂ representations with discrete PGSp₆ theta partners.

#### tempered-small-packets — Tempered non-discrete packets

Every bounded non-discrete φ has a fibre of cardinality |Irr(Sφ)|, equal to one or two. The packet has a unique generic member labelled by the trivial character. This statement holds also at p=3.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/tempered`, `LG.3/discrete`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Proof route: Compute the rank-one R-groups for the two maximal Levis and the toral cases. Use the explicit exceptional theta reducibility list to identify the constituents and normalize the generic character.

Acceptance: A two-member packet must contain both constituents, with precisely one generic constituent.

Sources: [GS] §3.4, p. 12 — The tempered nondiscrete discussion gives the component groups and one/two-member packets through explicit parabolic constituents, with Whittaker normalization.

#### rank-seven-lift — The rank-seven standard lift

Define Lif(π)∈Irr(GL₇(F)) by the Arthur transfer of rest θπ on Irr♥, and by the GL₇ LLC representation of φτ⊕1⊕φτ∨ on Irr♠, where τ=JL(θ_Dπ). Thus rec_GL₇(Lifπ)=vLπ. The direct-sum prescription is used even when a written parabolic induction is reducible.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/llc-map`, `LG.0/branching`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`.

Proof route: Use GL_n LLC to specify the unique representation attached to a direct sum. Compare the two constructions with vL using their defining diagrams.

API:

- `G2StandardLift.parameter` (compatibility): rec(Lifπ)=vLπ as full WD representations.

- `G2StandardLift.spade` (simp): The spade parameter is φτ⊕1⊕φτ∨.

- `G2StandardLift.heart` (simp): The heart lift is Arthur’s rank-seven standard transfer.

- `G2StandardLift.duality` (characterisation): Lif is unchanged when the chosen cubic parameter is dualized.

Uses: GS §3.4, p. 13 — Defines local gamma factors; GF Definition 2.1 and Theorem 2.4, pp. 3–6 — Makes the analytic factor independent of a proposed LLC characterization.

Checks:

- `G2StandardLift.rank` (compatibility): Every output has rank seven; the spade dimensions are 3+1+3.

- `G2StandardLift.selfdual` (compatibility): The resulting parameter is orthogonal with determinant one.

- `G2StandardLift.a2Test` (compatibility): For diagonal A₂ Satake data (a,b,(ab)⁻¹) its polynomial is P₇(a,b) from LG.0.

Acceptance: An induced representation must not be mistaken for an irreducible output without an irreducibility check.

Sources: [GS] §3.4, p. 13 — The lift combines the Sp₆ standard transfer and the cubic direct-sum parameter. Choosing the GL₇ LLC representation avoids an unjustified irreducibility assertion about written parabolic inductions.

Planet: The rank-seven lift.

#### pair-gamma — Gamma factors of G₂ × GL_r

For ψ nontrivial and smooth additive on F, π∈Irr(G₂) and τ∈Irr(GL_r), define γ_G₂(s,π×τ,ψ)=γ_RS(s,Lif(π)×τ,ψ). It is a meromorphic function, using the normalized Rankin–Selberg factor and the same additive character on both sides.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/rank-seven-lift`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`.

Proof route: Compose the standard lift with the imported Rankin–Selberg gamma factor. Track ψ and local reciprocity conventions so the parameter-side comparison is meaningful.

API:

- `G2PairGamma.standardLift` (simp): The G₂ pair factor equals the Rankin–Selberg factor of Lifπ.

- `G2PairGamma.product` (compatibility): Induction in the GL_r variable multiplies the factors of its supercuspidal support.

- `G2PairGamma.changeCharacter` (compatibility): Replacing ψ(x) by ψ(ax) multiplies γ by det(φτ)(a)⁷ |a|^{7r(s−1/2)}, since det(vLπ)=1.

- `G2PairGamma.unramified` (characterisation): For unramified data and an unramified ψ it is the quotient of the tensor-product Euler factors in the usual epsilon normalization.

Uses: GS Main Theorem (ix), p. 4 — States preservation of pair factors; GS Main Theorem (x), p. 4 — Characterizes the correspondence through these invariants.

Checks:

- `G2PairGamma.principalSeries` (compatibility): For toral A₂ data χ₁χ₂χ₃=1, the factor is γ(τ) times the six factors γ(χ_i^{±1}×τ).

- `G2PairGamma.characterScale` (compatibility): A GL₁ twist of nontrivial seventh-power central character detects the character-scaling multiplier.

- `G2PairGamma.degree` (non-example): For τ of rank r the tensor parameter has dimension 7r, so an exponent 8r in the additive-character formula is wrong.

Acceptance: The definition depends on the full GL_r parameter, not just its Satake class.

Sources: [GS] §3.4, p. 13 — The G₂ pair factor is obtained from the degree-seven lift and the Rankin–Selberg factor. The independent analytic characterization is a separate theorem, not a consequence of this definition; [GF] §2.1, Definition 2.1, p. 3 — The pair factor is defined through the standard rank-seven transfer; Theorem 2.4 separately characterizes it analytically.

Planet: G₂ pair gamma factors.

#### gamma-input — The independent gamma-factor characterization

GF Theorem 2.4 uniquely characterizes these local nonarchimedean factors by cuspidal-support multiplicativity and a restricted global functional equation. The G₂ torus rule uses 1⊕⊕χ_i^{±1}; the P-Levi rule uses φτ⊕φτ∨⊕detφτ⊕detφτ⁻¹⊕1; the Q-Levi rule uses φτ⊕φτ∨⊕Adφτ. The GL_r rule is multiplicativity under parabolic induction. Globally k is totally real, G=Aut(O), Π is cuspidal and spherical at every split real place, T is cuspidal on GL_r, and either Π has nonzero cuspidal theta lift to split PGSp₆ or nonzero lift to PD× for a degree-three central simple algebra (possibly split). For S containing infinity and all ramification of Π,T,ψ, the partial tensor L-function continues meromorphically and satisfies L^S(1−s,Π×T∨)=∏_{u∈S}γ_u(s,Π_u×T_u,ψ_u) L^S(s,Π×T).

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/pair-gamma`, `LG.1/relative-globalization`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`.

Proof route: Apply GF Proposition 2.3 to transfer supercuspidal support and deduce the four local multiplicativity formulas. Use the two permitted global theta routes for the functional equation and globalize the supercuspidal pair to prove uniqueness. The general analytic characterization remains source-gated until its proof is owned.

Acceptance: No global functional equation for every cuspidal G₂ representation, or archimedean multiplicativity theorem, is asserted.

Sources: [GF] §2.6, Theorem 2.4 and §§2.7–2.8, pp. 5–8 — Theorem 2.4 gives uniqueness and existence with the four stated multiplicativity formulas and the restricted totally real global family. It is not an unrestricted global functional equation.

#### gamma-compatibility — Preservation of pair gamma factors

For every π, τ and ψ as above, γ_G₂(s,π×τ,ψ)=γ(s,(vLπ)⊗rec_GL_r(τ),ψ). The comparison is between meromorphic functions, with full WD monodromy and matching reciprocity conventions.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/pair-gamma`, `LG.3/rank-seven-lift`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `LG.3/gamma-input`.

Proof route: Use the standard-lift parameter identity and preservation of Rankin–Selberg factors by GL_n LLC. Combine with the independent characterization to identify the analytically normalized family.

Acceptance: The tensor product parenthesis encloses vLπ, not τ or the whole scalar function.

Sources: [GS] §3.4, p. 13; Main Theorem (ix), p. 4 — The degree-seven WD comparison and GL_n compatibility give the formula, while the independent gamma input identifies it with the analytic G₂ factor.

#### gamma-uniqueness — Characterization by gamma factors

The map L is uniquely determined by discrete-series detection, tempered induction, non-tempered Langlands quotients, and preservation of the preceding pair gamma factors for all GL_r twists. For bounded seven-dimensional WD representations arising here, equality of these factors for all twists implies isomorphism.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/gamma-input`, `LG.3/gamma-compatibility`, `LG.3/nontempered`, `LG.3/tempered`, `LG.3/discrete`, `LG.0/standard-injectivity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Apply the full-parameter local converse theorem for GL₇ in the tempered case; the required version includes reducible tempered parameters, not only supercuspidal ones. Use standard injectivity to recover the G₂ parameter, then normalized Levi/Langlands classification for the non-tempered case.

Acceptance: A converse theorem for irreducible Weil representations alone does not close this proof.

Sources: [GS] §3.4, pp. 13–14 — The proof reduces arbitrary r to supercuspidals and invokes a full-WD tempered GL₇ local converse theorem. An irreducible-Weil-only converse would not suffice.

Planet: Gamma-factor characterization.

#### theta-uniqueness — Characterization by the theta diagrams

A map Irr(G₂)→Φ(G₂) satisfying Main Theorem (i)–(iv), with the fixed normalizations above, equals L. The two theta branches determine the parameter by injectivity of j modulo duality and injectivity of v.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/llc-map`, `LG.0/a2-parameters`, `LG.0/standard-injectivity`.

Proof route: Use the exceptional dichotomy to put each π in one defining branch. Compare the diagram images and apply the corresponding injectivity result.

Acceptance: This characterization does not presuppose an enhancement or a packet labelling.

Sources: [GS] §1.1(v), p. 4; §3.4, p. 12 — The division and PGSp₆ theta diagrams determine the map once exceptional dichotomy and standard injectivity are available.

#### global-compatibility — All-places global–local compatibility

Let k be totally real and Π be globally generic, regular algebraic and cuspidal on split G₂, with a Steinberg finite component. Any semisimple associated rank-seven Galois representation with the prescribed almost-everywhere Satake classes has a unique G₂-valued lift up to G₂-conjugacy. At every finite place u its full Frobenius-semisimplified WD parameter is L(Π_u), after the fixed coefficient-field identification. At u|ℓ require the potentially semistable comparison with its precise algebraic normalization.

Hypotheses: k,Π and the associated semisimple Galois representation satisfy exactly the stated hypotheses; all supplier normalization and local-compatibility gates remain in force.

Prerequisites: `LG.0/chenevier-galois`, `LG.3/llc-map`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `AutomorphicGaloisRepresentationsPartII:AG2.6`.

Proof route: Theta lift Π to PGSp₆ and take the rank-seven cuspidal transfer; Steinberg ensures cuspidality. Use Chenevier for the global factorization; apply the distinct prime-to-ℓ and coefficient-prime local–global inputs, then standard injectivity.

Acceptance: Frobenius semisimplification retains N; ordinary semisimplification of a Weil representation is not the claimed all-places result.

Sources: [GS] §1.1(viii), p. 4; §3.4, p. 12 — The asserted all-places identity is stronger than unramified matching; the proof plan separately requests ramified and coefficient-prime WD comparison with monodromy.

### LG.4. A₂ packets and cubic inner forms

Targets: `cubic-labels`, `nonselfdual-packet`, `selfdual-packet`, `subregular-packet`, `enhanced-a2-theta`.

#### cubic-labels — Cubic inner forms and central characters

Use inv:H¹(F,PGL₃)≅(1/3)ℤ/ℤ and the Kottwitz pairing with Z(SL₃)=μ₃. Label M₃(F), D₁, D₂ by 0,1/3,2/3, so their characters of μ₃ are 1,χ,χ⁻¹. For a discrete PGL₃ parameter use JL to obtain the representations of PD₁× and PD₂×; opposite algebra and contragredient interchange the two nontrivial labels. The algebras and general invariant map are imported, not redefined.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `LG.0/a2-parameters`.

Proof route: Apply the Brauer invariant and fixed local reciprocity convention to choose the Kottwitz pairing. Restrict the inner-form GL₃/JL correspondence to trivial centre; compare contragredients with opposite algebras.

API:

- `CubicLabels.invariant` (data): The three degree-three classes have invariants 0,1/3,2/3.

- `CubicLabels.opposite` (relation): Taking opposites negates the invariant and inverts the Kottwitz character.

- `CubicLabels.jlDual` (compatibility): JL of the contragredient has the dual SL₃ parameter, with the opposite-algebra identification.

- `CubicLabels.split` (simp): The split class pairs with the trivial μ₃ character.

Uses: GS Proposition 3.2, pp. 14–16 — Labels the nonselfdual three-member A₂ packet; GS Theorem 9.1(i), p. 26 — Separates split and division theta occurrence by restriction to μ₃.

Checks:

- `CubicLabels.zero` (compatibility): M₃(F) has invariant zero and the trivial central character.

- `CubicLabels.twoDivision` (compatibility): D₁ and D₂ are distinct opposite Brauer classes, with characters χ and χ⁻¹.

- `CubicLabels.oppositeTwice` (characterisation): Applying the opposite operation twice returns the original invariant and label; it does not identify the two division classes.

Acceptance: Record the convention χ(ζ₃)=ζ₃; reversing the Brauer/reciprocity sign swaps D₁ and D₂ consistently.

Sources: [GS] §3.5, pp. 14–15 — The split and two cubic division forms give the three μ₃ characters via the Brauer/Kottwitz normalization. Opposite algebra and duality exchange the nontrivial labels.

Planet: Cubic inner-form labels.

#### nonselfdual-packet — Nonselfdual A₂ packets

Let φ=jφτ be discrete with φτ not self-dual, so Sφ=μ₃. The split theta lift gives the unique generic member with label 1; the two cubic inner-form lifts give labels χ,χ⁻¹. For p≠3 these give a bijection L⁻¹(φ)≅Irr(μ₃). For p=3 retain the canonical injection and do not claim all nontrivial labels occur.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.4/cubic-labels`, `LG.3/map-agreement`.

Proof route: Use exceptional Howe duality for all three inner forms and the duality relation. Use the cubic invariant pairing to identify enhancements; establish the residual-characteristic restriction in the division-lift input.

Acceptance: Labels χ and χ⁻¹ may coincide only after an explicitly changed normalization, not as characters of μ₃.

Sources: [GS] §3.5, Proposition 3.2, pp. 14–16 — Proposition 3.2 supplies the three labels for μ₃ in the nonselfdual case, with its residue-characteristic qualification and local division-lift input.

Planet: Nonselfdual A₂ packets.

#### selfdual-packet — Selfdual A₂ packets with S₃ enhancements

Let φ=jφτ be discrete and φτ self-dual, so Sφ≅S₃. Construct and verify the packet bijection with {1,sgn,std₂} for p≠3, with the generic member labelled 1. The two split τ± lifts account for the two labels restricting trivially to μ₃; the division-algebra lift accounts for std₂, whose restriction is χ⊕χ⁻¹. For p=3 prove the stated injection; prove bijectivity in the subregular SL₂ case separately.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.4/cubic-labels`, `LG.3/alternative-map`, `LG.0/a2-parameters`.

Proof route: Treat the normalizer action by inversion on μ₃ and the two extensions of selfdual τ. Use HD Theorem 8.5 to separate generic and nongeneric split lifts, including residue characteristic two. Prove the division lift’s central restriction and exclude further members. This separate S₃ argument is a recorded proof obligation, not supplied by the nonselfdual proof in Proposition 3.2.

Acceptance: The two-dimensional S₃ character restricts to a sum of two nontrivial μ₃ characters, not a single Kottwitz character.

Sources: [GS] §3.5, Proposition 3.2 and proof, pp. 14–16 — The stated selfdual packet has S₃ enhancements. The printed μ₃-centralizer proof is insufficient for it; the separate split-extension and division argument remains an explicit gap; [HD] Theorems 8.2 and 8.5, PDF pp. 25–29; Theorem 15.2, PDF pp. 52–53 — The split PGL₃ lifts, their ± genericity, and their exact PGSp₆ Siegel partners supply the explicit comparison.

Planet: Selfdual S₃ packets.

#### subregular-packet — The subregular three-member packet

For the parameter with trivial Weil part and subregular SL₂ in G₂, Sφ=S₃ and the packet is {π_gen[1],π_sc[1],π_deg[1]} labelled {1,sgn,std₂}, respectively. The split St_PGL₃⁺ and St_PGL₃⁻ lift to the first two; the trivial PD× representation lifts to π_deg[1]. This packet is complete also at p=3.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.4/selfdual-packet`, `LG.3/map-agreement`.

Proof route: Compute the explicit Steinberg split theta lifts from HD Theorem 8.5 and the division lift from its §7. Check the three component-group characters and the separate nonvanishing valid in residue characteristic three.

Acceptance: π_sc[1] is supercuspidal but its parameter has nontrivial SL₂; genericity is essential in the later supercuspidal bijection.

Sources: [GS] §3.5, Proposition 3.2, p. 14 — The principal SL₂ in SL₃ yields the three-member subregular packet, including the exceptional supercuspidal member; this special case is retained at p=3; [HD] Theorems 8.2 and 8.5, PDF pp. 25–29; Theorem 15.2, PDF pp. 52–53 — The split PGL₃ lifts, their ± genericity, and their exact PGSp₆ Siegel partners supply the explicit comparison.

#### enhanced-a2-theta — Enhanced PGL₃ and division theta compatibility

Assume p≠3. For τ∈Irr(PGL₃), the set of irreducible lifts from τ and τ∨ is exactly the enhanced G₂ representations (jφτ,η) with η trivial on the image of π₀Z_SL₃(φτ). For τ discrete and its division JL transfer, the division theta lifts are exactly those with η nontrivial on that image. In the selfdual discrete case this means {1,sgn} on the split side and std₂ on the division side.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.4/nonselfdual-packet`, `LG.4/selfdual-packet`, `LG.3/nontempered`, `LG.3/tempered-small-packets`.

Proof route: Combine packet parametrization with the split and division theta classification. For non-discrete τ use the explicit induction and R-group cases rather than extrapolating from μ₃.

Acceptance: The criterion is restriction of an irreducible character, not evaluation of a scalar on an arbitrary centralizer element.

Sources: [GS] §9, Theorem 9.1(i), p. 26 — Theorem 9.1(i) identifies restrictions of enhancements to μ₃ with the split/division labels, subject to the A₂ packet hypotheses rather than an all-parameter claim.

Planet: Enhanced PGL₃ theta compatibility.

### LG.5. Kret–Shin parameters and exceptional spin compatibility

Targets: `kret-shin-input`, `ks-spin-irreducibility`, `ks-parameter`, `ks-existence`, `diamond-ks-unique`, `diamond-spin`, `club-spin-bridge`, `full-spin`.

#### kret-shin-input — Kret–Shin Galois representation input

Let k be totally real, n≥2 and Σ cuspidal on GSp_{2n}(A_k). Assume (St): a finite component is a character twist of Steinberg; and (L-coh): Σ∞|sim|^{-n(n+1)/4} is ξ-cohomological for an irreducible algebraic ξ of Res_{k/ℚ}GSp_{2n}. For each ℓ and ℂ≅Q̄_ℓ there is a continuous GSpin_{2n+1}-valued ρΣ, unique up to conjugacy in the sense of Theorem A, whose SO quotient is the Galois representation of the Sp restriction and whose Gm quotient is the central character by class field theory. Outside rational primes 2, ramification of k or Σ, and ℓ, Frobenius semisimple classes match unramified Satake. At ℓ it is de Rham with the prescribed Hodge cocharacter and the crystalline/semistable qualifications of Theorem A(iii). For central-trivial Σ and n=3 it lands in Spin₇; the exponent in (L-coh) is −3.

Hypotheses: The precise (St) and (L-coh) hypotheses in the statement.

Prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

Proof route: Use KS Theorem A / Theorem 10.3 with its exact normalization; this is a source-gated theorem, not an already provided AG2 result. Separate its almost-everywhere statement from the all-places standard and spin comparisons needed locally. Generic and spin-regular infinity are additional hypotheses in applications, not hypotheses of Theorem A itself.

Acceptance: The Steinberg hypothesis is essential to the uniqueness statement used here; uniqueness for arbitrary Spin₇ representations is false.

Sources: [KS] Theorem A, online-first PDF pp. 2–4 (journal pp. 76–78) — Theorem A constructs the GSpin-valued representation under (St) and (L-coh), with its exact unramified and p-adic Hodge qualifiers. Central triviality specializes n=3 to Spin₇.

Planet: Kret–Shin Galois representations.

#### ks-spin-irreducibility — Irreducibility of the spin Galois representation

Let k be totally real and Σ cuspidal on PGSp₆(A_k). Assume the (St) and (L-coh) hypotheses of Kret–Shin and (spin-REG): the spin parameter is regular at every real place. For each coefficient prime and coefficient-field identification, the eight-dimensional spin representation sρΣ of the Kret–Shin Spin₇-valued Galois representation is absolutely irreducible.

Hypotheses: The full (St), (L-coh) and (spin-REG) hypotheses in the statement; central triviality means Σ is viewed on GSp₆ through PGSp₆.

Prerequisites: `LG.5/kret-shin-input`, `LG.0/branching`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`.

Proof route: Use KS Proposition 13.1(4), together with the identification of its compatible system with sρΣ. The Steinberg place restricts the projected connected monodromy to SO₇, G₂ or principal PGL₂, as in Theorem A(v). The G₂ case has spin restriction 1⊕7 and a repeated zero weight. The principal SL₂ case has restriction Sym⁶⊕1, again with repeated zero weight. Spin regularity excludes both proper cases; full Spin₇ monodromy acts irreducibly on spin.

Acceptance: Regularity alone is not the hypothesis: the Steinberg and cohomological conditions are indispensable to this argument. A general global spin transfer remains merely isobaric.

Sources: [KS] §13, Proposition 13.1(3)–(4) and proof, PDF pp. 60–61 (journal pp. 134–135); Theorem A(v), PDF p. 3 (journal p. 77) — Proposition 13.1 proves irreducibility under (St), (L-coh) and (spin-REG). Its n=3 proof excludes G₂ and principal PGL₂ by repeated spin weights.

#### ks-parameter — Kret–Shin parameters of generic discrete series

For generic discrete-series σ of PGSp₆, a KS parameter is a discrete Spin₇ parameter φ satisfying qφ=rec_Sp₆(rest σ) and sφ=rec_GL₈(SpinLift σ). This is a set of parameter classes; existence and singleton assertions are separate theorems.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.2/local-spin-lift`, `LG.0/weak-equivalence`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Take the fibre of the joint standard and spin comparison over the two prescribed parameters. Impose discreteness as in Proposition 5.1; do not choose an element before existence is proved.

API:

- `KSParameters.standard` (projection): Every member has q-image equal to the local Langlands parameter assigned by Arthur to the Sp₆ restriction.

- `KSParameters.spin` (projection): Every member has s-image equal to the GL₈ spin-transfer parameter.

- `KSParameters.membership` (characterisation): Discreteness and these two image conditions exactly characterize membership.

- `KSParameters.weakClass` (compatibility): Any two members map to the same weak parameter class.

Uses: GS Proposition 5.2, pp. 20–21 — Proves uniqueness on the exceptional image; GS Proposition 8.1, pp. 23–24 — Distinguishes the generic Xu packet by spin data.

Checks:

- `KSParameters.steinberg` (compatibility): For σ=St_PGSp₆ the principal Spin₇ SL₂ parameter satisfies both comparisons.

- `KSParameters.wrongSign` (non-example): A quadratic twist which changes the spin parameter is not a member, despite having the same standard parameter.

- `KSParameters.g2Image` (compatibility): For a diamond generic G₂ theta image, iLπ is a member, and all members are conjugate to it.

Acceptance: Its members have one common weak class even when they are not a single conjugacy class.

Sources: [GS] §5.2, Proposition 5.1 and following paragraph, p. 20 — The paragraph after Proposition 5.1 defines the simultaneous standard and spin comparisons, with discreteness; it does not assert uniqueness of every Spin₇ lift.

Planet: Kret–Shin local parameters.

#### ks-existence — Existence of KS parameters for generic discrete series

Every generic discrete-series σ of PGSp₆ has a KS parameter. Any two have the same q-image and differ, after conjugacy, by a quadratic character of W_F; no general singleton conclusion follows.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.5/kret-shin-input`, `LG.5/ks-parameter`, `LG.1/generic-globalization`, `LG.2/global-spin-lift`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `ModularityAndLanglandsExtensions:ML.4`, `LG.5/ks-spin-irreducibility`.

Proof route: Globalize σ with a Steinberg place, a generic supercuspidal place and cohomological generic spin-regular infinity; use the classical theta nonvanishing/cuspidality input. Compare spin ρΣ with Galois representations of the isobaric GL₈ summands by almost-everywhere matching, then use full local–global compatibility at a place different from ℓ. Lift the resulting WD parameter and retain its monodromy.

Acceptance: Verify algebraicity and the precise shift for each required isobaric summand before using Galois comparison. Under the full Steinberg, cohomological and spin-regular globalization hypotheses, ks-spin-irreducibility also supplies the irreducibility needed if the proof deduces cuspidality; it does not make arbitrary spin transfers cuspidal.

Sources: [GS] §5.2, Proposition 5.1 and proof, p. 20 — Proposition 5.1 uses a cohomological globalization and a GL₈ comparison. The proof plan keeps summandwise algebraicity and local compatibility explicit, and now records the full-hypothesis irreducibility input separately.

Planet: Existence of KS parameters.

#### diamond-ks-unique — Uniqueness of KS parameters on the diamond image

If π is generic discrete series on the G₂ diamond locus and σ=θπ, then σ is generic discrete series and its KS parameter set consists of the single class iLπ.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.5/ks-existence`, `LG.0/quadratic-rigidity`, `LG.1/generic-globalization`, `LG.2/global-spin-lift`, `LG.3/llc-map`, `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`.

Proof route: Globalize π with a Steinberg place and the required archimedean conditions; take its cuspidal PGSp₆ theta lift. Almost-everywhere spin branching and isobaric strong multiplicity one give SpinLift(Σ)=1⊞StdLift(Σ). Thus s iLπ is the local spin parameter. Any other KS parameter is a quadratic twist, so apply quadratic rigidity.

Acceptance: The premise requires θπ itself to be discrete series; it cannot be applied to π_gen[1].

Sources: [GS] §5.2, Proposition 5.2 and proof, pp. 20–21 — Proposition 5.2 uses the discrete PGSp₆ hypothesis and the G₂ spinor argument to remove quadratic ambiguity on the diamond image; it does not cover all club partners.

Planet: Exceptional KS uniqueness.

#### diamond-spin — The spin identity on the diamond locus

For generic discrete-series π in Irr♦(G₂), rec_GL₈(SpinLift θπ)=s i Lπ=1⊕vLπ.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.5/diamond-ks-unique`, `LG.0/branching`.

Proof route: Read the spin condition of the unique KS parameter and apply branching.

Acceptance: This is the proved scope of Corollary 5.3 before adding a club-case bridge.

Sources: [GS] §5.2, Corollary 5.3, p. 21, with Proposition 5.2 hypotheses — Corollary 5.3 supplies the spin identity where Proposition 5.2 applies, namely the discrete diamond theta image.

#### club-spin-bridge — The spin identity for explicit Siegel lifts

Let π be generic discrete series in Irr♣(G₂), coming from a discrete τ of PGL₃ with φτ. HD Theorem 15.2 gives θπ=I₃(τ) when τ is not selfdual, and θπ=I₃(τ)_gen when τ is selfdual. Compute the classical theta lift and its triality transfer to prove rec_GL₈(SpinLift θπ)=φτ⊕φτ∨⊕1⊕1=s i j φτ. This includes the generic subregular representation π_gen[1].

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/map-agreement`, `LG.2/local-spin-lift`, `LG.0/branching`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use HD Theorem 15.2, PDF pp. 52–53, for the exact PGSp₆ constituent; it is tempered induced, not discrete series. Calculate the split classical theta lift of each generic Siegel constituent, apply f₂ and the SO₈ LLC, and retain the constituent’s full WD parameter. The classical calculation is an explicit supplier request and unresolved proof obligation.

Acceptance: For τ=St_PGL₃, the spin parameter must be two copies of Sym² of SL₂ plus two trivial lines (3+3+1+1), not an irreducible eight-dimensional SL₂ module.

Sources: [GS] §1.1(vi), p. 4; §3.2, p. 11 — The generic-discrete diagram requires a separate club calculation: the subregular generic member can have a proper Siegel-induced PGSp₆ partner. Proposition 5.2 cannot supply this case; [HD] Theorems 8.2 and 8.5, PDF pp. 25–29; Theorem 15.2, PDF pp. 52–53 — The split PGL₃ lifts, their ± genericity, and their exact PGSp₆ Siegel partners supply the explicit comparison.

Planet: Siegel-lift spin compatibility.

#### full-spin — Spin compatibility for every generic G₂ discrete series

For every generic discrete-series π of G₂, θπ is nonzero generic tempered and rec_GL₈(SpinLift θπ)=s iLπ. On the diamond locus θπ is discrete series; on the club locus it is a proper Siegel-induced tempered representation.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.5/diamond-spin`, `LG.5/club-spin-bridge`.

Proof route: Use the exceptional dichotomy and the fact that generic π does not lie in the division-algebra spade locus. Apply the two separate spin computations.

Acceptance: The diagram’s intermediate codomain is generic tempered, including the club examples.

Sources: [GS] §1.1, Main Theorem (vi), p. 4, with corrected codomain — The intended spin diagram is assembled from the diamond theorem and the separate club bridge, with generic tempered PGSp₆ as the corrected intermediate codomain.

### LG.6. Diamond fibres and distinguished Xu packets

Targets: `diamond-surjectivity`, `generic-unique`, `distinguished-xu`, `two-place-globalization`, `one-in-all-in`, `diamond-fibre`, `diamond-enhancements`.

#### diamond-surjectivity — Surjectivity on diamond discrete parameters

For each φ∈Φ♦_ds(G₂), there is a generic discrete-series π with Lπ=φ. Thus the diamond parameter map is surjective for every residue characteristic.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.0/spin-parameters`, `LG.5/ks-existence`, `LG.2/spin-gamma`, `LG.2/spin-twist`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`, `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Proof route: When the Deligne SL₂ is nontrivial, use the explicit exceptional theta classification. For supercuspidal φ choose the generic Sp₆ representation for q iφ and a PGSp₆ lift. A KS parameter differs from iφ by a quadratic character; correct the lift by twisting. Use the spin gamma comparison and the spin pole criterion of Savin–Weissman to obtain a nonzero G₂ lift.

Acceptance: The nonvanishing criterion needs a generic discrete-series σ and the analytic spin L-factor, not just a formal eigenvalue one.

Sources: [GS] §6, Proposition 6.1 and proof, pp. 21–22 — Proposition 6.1 uses the spin-pole converse and the discrete parameter to construct a diamond preimage; its exceptional global theta input is recorded as a supplier gap.

Planet: Diamond surjectivity.

#### generic-unique — The unique generic diamond member

For φ∈Φ♦_ds(G₂), L⁻¹(φ) has exactly one generic member. Equivalently, among generic PGSp₆ representations whose standard restriction has parameter q iφ, exactly one has nonzero G₂ theta lift.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.6/diamond-surjectivity`, `LG.5/diamond-ks-unique`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`.

Proof route: The generic lifts of the fixed Sp₆ packet form a quadratic-character homogeneous set. Use exceptional KS uniqueness to equate their parameter classes; Xu’s equality of representation and parameter stabilizers equates the representations. Then apply Howe duality.

Acceptance: A nontrivial quadratic stabilizer must be allowed; the homogeneous set is not assumed free.

Sources: [GS] §8.1, Proposition 8.1 and proof, pp. 23–24 — Proposition 8.1 uses generic packet uniqueness on the classical side and theta duality to obtain exactly one generic member of each diamond fibre.

Planet: The generic diamond member.

#### distinguished-xu — The distinguished Xu packet

For diamond discrete φ, put φ♭=q iφ and let X*(φ) be the unique Xu packet over φ♭ containing θπ_gen, where π_gen is the unique generic member of L⁻¹(φ). It is a packet of representations, distinguished by a point, rather than a chosen lift of φ♭ without a rule.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.6/generic-unique`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`.

Proof route: Use the disjoint Xu partition and the unique generic member to select one packet. Verify independence of all representatives of φ and π_gen.

API:

- `DistinguishedXu.contains` (constructor): θπ_gen belongs to X*(φ).

- `DistinguishedXu.unique` (characterisation): A Xu packet over φ♭ is X*(φ) exactly when its generic member lifts to G₂.

- `DistinguishedXu.restriction` (compatibility): Restriction bijects X*(φ) with the PGSp₆ orbit set in the Sp₆ packet of φ♭.

Uses: GS Proposition 8.2, p. 24 — Identifies the whole G₂ fibre via theta; GS §9, p. 26 — Anchors the partial PGSp₆ LLC equivariantly.

Checks:

- `DistinguishedXu.steinberg` (compatibility): For the principal G₂ SL₂ parameter the distinguished packet contains St_PGSp₆.

- `DistinguishedXu.otherPacket` (non-example): A different Xu packet over the same φ♭ cannot contain θπ_gen.

- `DistinguishedXu.stabilizer` (characterisation): If a quadratic character stabilizes iφ, it stabilizes X*(φ); it does not create another distinguished packet.

Acceptance: Every other Xu packet over φ♭ has a generic member whose G₂ theta lift is zero.

Sources: [GS] §8.2, p. 24 — The unique generic G₂ member specifies one Xu packet above the standard parameter; the definition chooses a representation packet by this rule, not an arbitrary lift.

Planet: The distinguished Xu packet.

#### two-place-globalization — Globalization with two identical local components

For π in a diamond discrete fibre, choose totally real k with k_{w₁}≅k_{w₂}≅F and globalize π at both places to Π with nonzero cuspidal PGSp₆ theta lift Σ. For generic π use the split G₂ form, an auxiliary generic depth-zero supercuspidal whose theta lift is supercuspidal, and archimedean discrete series far enough from the walls. For nongeneric π, which is supercuspidal here, use the definite octonion form and a Steinberg finite place. In each case the Sp₆ global parameter of Σ is generic.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.1/generic-globalization`, `LG.1/cuspidal-exceptional-theta`, `LG.1/relative-globalization`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`.

Proof route: Use the auxiliary local examples from exceptional finite-field theta to ensure global cuspidality in the generic route. In the nongeneric route use the quaternion-period globalization and Steinberg; the field and definite algebra are defined over k. Keep the archimedean isolation and matching requirements explicit.

Acceptance: Both chosen finite completions identify the same representation, permitting simultaneous equal packet substitutions.

Sources: [GS] §8.4, proof of Lemma 8.3, pp. 24–25 — The proof of Lemma 8.3 prescribes the same generic discrete representation twice for sign cancellation, together with auxiliary and archimedean conditions; the relative isolation export is requested explicitly.

#### one-in-all-in — One in, all in for a Xu packet

For any Xu packet over φ♭=q iφ with φ diamond discrete, either every member has nonzero local theta lift to split G₂ or no member does.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.6/two-place-globalization`, `ModularityAndLanglandsExtensions:ML.4/xu-multiplicity-formula`, `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `ModularityAndLanglandsExtensions:ML.4`, `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Proof route: Start with σ=θπ and a member σ′ of the same Xu packet. Globalize two copies of σ and replace both by σ′. Xu’s multiplicity formula allows this because the two equal local component-character changes cancel. The nearly equivalent representation Σ′ has the same partial spin L-function ζ^S(s)L^S(s,Σ,std), with a pole at one. Apply GS20 Theorem 1.1 to obtain global exceptional theta to a G₂ form. At finite places that form is split, so σ′ lifts locally.

Acceptance: One-place substitution without trivial global component group is not justified by this proof.

Sources: [GS] §8.4, Lemma 8.3 and proof, pp. 24–25 — Lemma 8.3 changes the two local packet members, cancels their global signs and applies the spin-pole theta converse. The multiplicity and converse inputs retain their proof gates; [GS] §8.4, p. 25, application of GS20 Theorem 1.1 — The exceptional spin-pole-to-theta implication is cited here as a supplier contract; its primary proof has not been audited in this job.

Planet: One in, all in.

#### diamond-fibre — A diamond fibre is a Xu packet

Exceptional theta induces a bijection L⁻¹(φ)↔X*(φ) for each diamond discrete φ. No other Xu packet over φ♭ participates in G₂ theta.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.6/one-in-all-in`, `LG.6/distinguished-xu`, `LG.6/generic-unique`.

Proof route: All members of X* lift by one-in-all-in; their vector parameters recover φ by injectivity. A different packet’s generic member has zero theta by generic uniqueness, hence all of it does. Apply Howe duality for injectivity.

Acceptance: The result identifies the full fibre, including nongeneric members.

Sources: [GS] §8.2, Proposition 8.2, p. 24; §8.5, p. 25 — Proposition 8.2 and §8.5 identify the fibre with the distinguished Xu packet using one-in-all-in and exceptional Howe duality.

Planet: Diamond fibres.

#### diamond-enhancements — The enhancement map for diamond fibres

Compose theta L⁻¹(φ)≅X*(φ), Xu’s Whittaker-normalized labelling X*(φ)≅Irr(S_{iφ}/image μ₂), and the dual-group isomorphism Sφ≅S_{iφ}/image μ₂. This gives the enhancement bijection L⁻¹(φ)≅Irr(Sφ) for diamond discrete φ at every p.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.6/diamond-fibre`, `LG.0/spin-parameters`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`.

Proof route: Transport irreducible characters along the component-group isomorphism, with the central quotient built in. Use the fixed Whittaker normalization to identify the generic member with the trivial character.

API:

- `DiamondEnhancement.equiv` (equivalence): The enhancement assignment is a bijection with Irr(Sφ).

- `DiamondEnhancement.generic` (simp): The unique generic representation maps to the trivial character.

- `DiamondEnhancement.theta` (compatibility): The theta partner has the corresponding Xu character pulled back from the central quotient.

Uses: GS Main Theorem (vii), p. 4 — Completes the discrete packets outside the A₂ locus; GS Theorem 9.1(ii), pp. 26–27 — Gives the enhanced theta identity on the stated discrete locus.

Checks:

- `DiamondEnhancement.principal` (compatibility): The principal G₂ SL₂ parameter has trivial component group and the singleton Steinberg packet.

- `DiamondEnhancement.centralQuotient` (non-example): A raw Spin₇ enhancement nontrivial on the image of μ₂ is excluded for the split PGSp₆ packet.

- `DiamondEnhancement.count` (characterisation): The fibre size equals the number of irreducible characters of Sφ, not the order of Sφ unless that group is abelian.

Acceptance: The construction makes no claim that the raw Spin₇ component group equals the G₂ component group.

Sources: [GS] §8.3, p. 24 — The classical Whittaker-normalized labels descend through the central μ₂ quotient and the G₂ component-group isomorphism to label diamond fibres.

Planet: Diamond enhancements.

### LG.7. The G₂ correspondence and enhanced theta applications

Targets: `main-correspondence`, `generic-supercuspidal`, `partial-pgsp-llc`, `enhanced-exceptional-theta`.

#### main-correspondence — The local Langlands correspondence for split G₂

L:Irr(G₂(F))→Φ(G₂) is a natural surjective map with finite fibres. It satisfies discrete-series detection, tempered induction and Langlands-quotient compatibility, the two defining theta diagrams, both uniqueness characterizations, the corrected generic-discrete spin identity, and pair-gamma compatibility. Every fibre is in natural bijection with Irr(Sφ) if p≠3; at p=3 this holds outside possibly the discrete A₂ image, where a canonical injection is the general target and the subregular packet is still complete. For tempered φ the trivial label is its unique generic member. The global–local assertion has the hypotheses of LG.3/global-compatibility.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.3/nontempered`, `LG.3/tempered-small-packets`, `LG.3/discrete`, `LG.3/theta-uniqueness`, `LG.3/gamma-uniqueness`, `LG.3/global-compatibility`, `LG.5/full-spin`, `LG.4/nonselfdual-packet`, `LG.4/selfdual-packet`, `LG.4/subregular-packet`, `LG.6/diamond-enhancements`.

Proof route: Assemble the non-tempered, tempered non-discrete, A₂-discrete and diamond-discrete cases; those partitions are exhaustive. Read the enhancement, spectral and compatibility properties from the separate results; all proof and supplier gates propagate into this theorem.

Acceptance: At residue characteristic three do not silently promote the A₂ injection to a bijection.

Sources: [GS] §1.1, Main Theorem, pp. 3–4 — The main theorem assembles surjectivity, finiteness, spectral properties and enhancements; the possible p=3 A₂ exception and the corrected generic-spin codomain are retained.

Planet: The G₂ local Langlands correspondence.

#### generic-supercuspidal — The generic supercuspidal correspondence

L restricts to a bijection between generic supercuspidal G₂ representations and discrete G₂ parameters trivial on Deligne SL₂. This recovers the HKT correspondence through theta and triality, without importing potential modularity or automorphic descent as new prerequisites.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.7/main-correspondence`.

Proof route: Use the unique generic member in each discrete packet and the exceptional theta supercuspidal classification. Distinguish generic supercuspidals from nongeneric supercuspidals with nontrivial SL₂, such as π_sc[1].

Acceptance: Supercuspidal on the left is accompanied by generic; dropping that condition is false.

Sources: [GS] §1.4, p. 6; §§3–8 — The comparison with HKT is the restriction to generic supercuspidals after the full map is constructed, not an extension of genericity to every packet member.

Planet: Generic supercuspidal parameters.

#### partial-pgsp-llc — The partial PGSp₆ correspondence

Fix diamond discrete φ, write φ♭=q iφ, and consider all Xu packets over φ♭ and all Spin₇ lifts of φ♭. Each is a homogeneous set for quadratic characters; match the distinguished packet X*(φ) with iφ and extend equivariantly. Xu’s equality of stabilizers makes this a well-defined canonical bijection of homogeneous sets, with each packet labelled by Irr(S_{φ̃}/image μ₂).

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.6/distinguished-xu`, `LG.6/diamond-enhancements`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`.

Proof route: For a quadratic χ assign X*⊗χ to iφ⊗χ. Independence of χ follows from equality of stabilizers. The basepoint is essential to make a canonical assignment.

API:

- `PartialPGSpLLC.basepoint` (simp): The distinguished packet is assigned iφ.

- `PartialPGSpLLC.twist` (functoriality): Twisting a packet by χ twists its assigned Spin₇ parameter by χ.

- `PartialPGSpLLC.stabilizer` (characterisation): Two characters produce the same assigned packet exactly when they produce the same parameter.

- `PartialPGSpLLC.labels` (compatibility): Each matched packet has Xu’s central-quotient character labelling.

Uses: GS Theorem 9.1(ii), pp. 26–27 — Interprets the exceptional theta correspondence as enhanced functoriality; GS §12.8, p. 40 — Identifies the diamond weak fibre as a single genuine Xu packet.

Checks:

- `PartialPGSpLLC.identity` (compatibility): The trivial quadratic character recovers the distinguished packet and iφ.

- `PartialPGSpLLC.nonfree` (characterisation): A nontrivial quadratic stabilizer, when present, fixes both sides and must not create a duplicate packet.

- `PartialPGSpLLC.central` (non-example): Using Irr of the raw component group instead of its central quotient adds forbidden labels.

Acceptance: No freeness of the quadratic action, nor a full PGSp₆ LLC outside these orbits, is asserted.

Sources: [GS] §9, p. 26 — The construction extends the distinguished packet/parameter pair equivariantly under quadratic characters. Equality of stabilizers gives homogeneous sets, without assuming the action is free.

Planet: Partial PGSp₆ correspondence.

#### enhanced-exceptional-theta — Enhanced G₂–PGSp₆ theta compatibility

On diamond discrete φ, if π has enhancement (φ,η), then θπ has assigned parameter iφ and the Xu enhancement η′ satisfying η=η′∘i_* after the central quotient. This proves the Gross–Savin enhanced relation on Φ♦_ds(G₂); it does not assign enhanced PGSp₆ parameters for all G₂ representations.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.7/partial-pgsp-llc`, `LG.6/diamond-enhancements`.

Proof route: Transport the character labelling through the defining theta bijection and component-group isomorphism. Restrict the claim to the locus where the partial PGSp₆ LLC has actually been constructed.

Acceptance: The published unrestricted wording of Theorem 9.1(ii) is replaced by this precise scope.

Sources: [GS] §9, Theorem 9.1(ii), pp. 26–27 — The enhanced PGSp₆ statement is restricted to the diamond discrete range in which the assignment is defined; the printed all-G₂ wording is not retained.

Planet: Enhanced exceptional theta compatibility.

### LG.8. Classical discrete-series globalization and theta

Targets: `shin-input`, `pgsp-globalization`, `heart-global-theta`, `heart-ds-parameters`.

#### shin-input — Shin’s automorphic density input

Let k be totally real, G connected reductive with discrete series at infinity, and A_G×ℝ=A_{G,ℝ}. Let S be finite, G unramified away from S and infinity, and Z(G)=1. For a relatively quasi-compact Plancherel-regular subset U of the local unitary dual at S with positive Plancherel measure, infinitely many cuspidal automorphic representations have S-component in U, are unramified outside S and infinity, and are discrete series at infinity. The theorem itself does not prescribe arbitrary spin-regular archimedean parameters.

Hypotheses: All hypotheses listed in the statement, including the equality of split central tori.

Prerequisites: `AutomorphicSpectralTheory:AS.6`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3/discrete-series-isolated-tempered`.

Proof route: Use Shin Theorem 5.8 with all standing assumptions of §5.2. For the finite discrete-series components use isolated positive-Plancherel-mass atoms and Corollary 4.12, not a claimed arbitrary-infinity conclusion of Theorem 5.8. The density proof remains source-gated until its owner supplies it. In the usual C₃ dominant-weight coordinates take λ_t=t(8,4,2), t∈ℕ_{>0}, at every real place. Its coordinate sum 14t is even, so it belongs to the PGSp₆ root lattice. With ρ=(3,2,1), put h=λ_t+ρ=(8t+3,4t+2,2t+1). The inequalities h₁>h₂+h₃ and h₂>h₃>0 make the eight half-signed sums (±h₁±h₂±h₃)/2 distinct: in any signed difference the largest nonzero coordinate dominates all smaller ones. All positive-root pairings tend to infinity, as required by Definition 3.5. A common central normalization shift does not alter distinctness.

Acceptance: Positive Plancherel measure and trivial algebraic centre are explicit, not consequences of a genericity assertion.

Sources: [Shin] §5.2, Theorem 5.8 and proof, author PDF pp. 26–27 (journal pp. 108–109) — Theorem 5.8 supplies finite-place density with all §5.2 hypotheses. Corollary 4.12 and Definition 3.5 allow the explicit spin-regular weight sequence, beyond the theorem’s bare infinity conclusion; [Shin] Definition 3.5, author PDF p. 14; Corollary 4.12, author PDF p. 24 (journal p. 106) — The density limit holds along any weight sequence satisfying Definition 3.5. The explicit λ_t=t(8,4,2) sequence provides the additional spin regularity for PGSp₆.

Planet: Automorphic Plancherel density.

#### pgsp-globalization — Globalization of arbitrary PGSp₆ discrete series

Let σ be discrete series of PGSp₆(F), k totally real with k_{v₀}≅F and v₁≠v₀ finite. There is cuspidal Σ of PGSp₆(A_k) with Σ_{v₀}=σ, Σ_{v₁}=St, generic cohomological spin-regular discrete series at every real place, and quadratic-unramified components at every other finite place. The prescribed σ is discrete series; this is not a globalization of arbitrary irreducibles.

Hypotheses: k,v₀,v₁,σ as in the statement, with σ discrete series.

Prerequisites: `LG.8/shin-input`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `ModularityAndLanglandsExtensions:ML.4/xu-multiplicity-formula`, `ModularityAndLanglandsExtensions:ML.4`, `AutomorphicSpectralTheory:AS.6`.

Proof route: Apply Shin Corollary 4.12 with positive-mass atoms at v₀ and v₁ and the explicit λ_t sequence specified in shin-input; Definition 3.5 applies and every real spin parameter is regular. The Steinberg component makes the global Sp₆ parameter generic with trivial global component group. Change the real packet members to generic ones by the multiplicity formula; lift back to PGSp₆ and use a global quadratic character to correct v₀ and v₁ simultaneously.

Acceptance: The explicit inequalities h₁>h₂+h₃ and h₂>h₃>0 enforce spin regularity, while divergence of root pairings enforces Shin’s density hypothesis. Packet substitution preserves the archimedean parameter. The global quadratic correction must still satisfy the two finite local prescriptions.

Sources: [GS] §12.5, Lemma 12.4 and proof, p. 37 — Lemma 12.4 globalizes a discrete series and Steinberg place; the proof plan now makes the spin-regular weight selection explicit before the packet substitutions and quadratic correction; [Shin] Definition 3.5, author PDF p. 14; Corollary 4.12, author PDF p. 24; Theorem 5.8, author PDF pp. 26–27 — The selected finite atoms have positive Plancherel measure; the specified weight sequence makes the density construction spin-regular at every real place.

Planet: PGSp₆ discrete-series globalization.

#### heart-global-theta — The classical theta lift of the heart globalization

If σ in the preceding globalization lies in Irr♥(PGSp₆), then Θ(Σ) to split PGSO₈ is nonzero and cuspidal. Its local components are the nonzero local theta lifts. A Steinberg place has zero lower PGO₆ lift, so the tower property gives cuspidality at this first nonzero lift.

Hypotheses: σ is discrete series in Irr♥(PGSp₆), and Σ is the globalization of LG.8/pgsp-globalization.

Prerequisites: `LG.8/pgsp-globalization`, `MetaplecticAutomorphicForms:MP.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Proof route: At v₀ use the heart hypothesis; elsewhere use generic or quadratic-unramified local nonvanishing. The standard degree-seven L-function is nonzero at one for the generic global Arthur parameter; apply the second-term-range Rallis inner product formula. The tower and Rallis inputs remain an explicit pending-owner gap.

Acceptance: Without the heart hypothesis local nonvanishing at v₀ is not supplied.

Sources: [GS] §12.6, Lemma 12.5 and proof, pp. 37–38 — Lemma 12.5 uses the Rallis inner product and first-occurrence/tower results to give a nonzero cuspidal classical theta lift of this globalization. Those classical results have a separate supplier gate.

Planet: Nonzero classical global theta.

#### heart-ds-parameters — KS parameters for nongeneric heart discrete series

For every discrete-series σ in Irr♥(PGSp₆), there exists a discrete Spin₇ parameter whose standard image is the local Langlands parameter assigned by Arthur to rest σ and whose spin image is the parameter of the triality-theta GL₈ transfer. Its weak class is unique.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.8/heart-global-theta`, `LG.5/kret-shin-input`, `LG.2/global-spin-lift`, `LG.0/weak-equivalence`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `LG.5/ks-spin-irreducibility`.

Proof route: Apply Kret–Shin to the globalization, whose Steinberg, (L-coh) and (spin-REG) hypotheses hold. Use ks-spin-irreducibility: the eight-dimensional spin Galois representation is irreducible. The generic orthogonal global transfer is isobaric. Establish algebraicity, normalization and Galois realizations of its summands; almost-everywhere spin matching and Chebotarev identify their direct sum with sρΣ. Irreducibility forces a single summand, giving the cuspidality used on GS p. 38. Apply full local–global compatibility, with monodromy, to obtain the local KS parameter.

Acceptance: The conclusion is existence plus uniqueness of a weak class, not uniqueness of a Spin₇ conjugacy class.

Sources: [GS] §12.4, Theorem 12.3, p. 36; conclusion of §12.6, p. 38 — The discrete-heart part of Theorem 12.3 uses the globalization and the spin Galois comparison. KS Proposition 13.1 supplies irreducibility under the full hypotheses, so the proposed cuspidality objection E19 is rejected; [KS] §13, Proposition 13.1(4) and proof, PDF pp. 60–61 (journal pp. 134–135) — The full globalization hypotheses give spin Galois irreducibility, which supports the cuspidality deduction once the algebraic isobaric summands have been compared.

### LG.9. The extended spin transfer and all KS parameters

Targets: `extended-spin`, `spin6-parameters`, `heart-levi-parameters`, `all-ks`.

#### extended-spin — Spin transfer on every PGSp₆ representation

Use the classical theta partition into Irr♠ and Irr♥, with Irr♣ the heart representations also lifting to split PGO₆. On the heart define SpinLift by the f₂ transform of θ♥ followed by Arthur transfer. On Irr♠♣ use θ♠♣ to PGL₂(D) or PGL₄, JL to a duality orbit of PGL₄, and attach the GL₈ representation with parameter φτ⊕φτ∨. The definitions must agree on the club overlap.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.2/local-spin-lift`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`.

Proof route: Import the split/anisotropic classical theta partition, conservation and lower-tower map, retaining outer-automorphism orbits. Use GL_n LLC for the direct-sum output and compute both constructions on club constituents to prove agreement.

API:

- `ExtendedSpinLift.heart` (simp): On Irr♥ the lift is the triality-theta Arthur transfer.

- `ExtendedSpinLift.lowerTower` (simp): On Irr♠♣ the GL₈ parameter is φτ⊕φτ∨.

- `ExtendedSpinLift.overlap` (compatibility): The two formulas agree on Irr♣.

- `ExtendedSpinLift.generic` (compatibility): For generic σ it equals the spin lift of LG.2.

Uses: GS Theorem 12.3, p. 36 — Supplies the spin datum for all weak parameters; GS Theorem 12.6, pp. 38–39 — Defines and characterizes the weak LLC.

Checks:

- `ExtendedSpinLift.dualOrbit` (characterisation): Replacing τ by τ∨ leaves the GL₈ parameter unchanged.

- `ExtendedSpinLift.rank` (compatibility): The lower-tower formula has dimension 4+4, not 4+1+4.

- `ExtendedSpinLift.clubAgreement` (compatibility): A club constituent computed in the heart tower and in the PGO₆ tower gives the same full WD parameter.

Acceptance: For nontempered data the GL₈ output is the unique LLC constituent, not the entire induced module.

Sources: [GS] §12.2–§12.3, pp. 34–36 — The heart uses triality-theta transfer; the lower towers use the six-dimensional JL parameter plus two lines. Agreement on their overlap is a required classical theta comparison.

Planet: The extended spin lift.

#### spin6-parameters — The lower-tower parameter formula

For σ∈Irr♠♣, let τ be its PGL₄ theta/JL datum modulo duality, with φτ in SL₄=Spin₆. Under the fixed inclusion h:Spin₆→Spin₇, q hφτ≅1⊕Λ²φτ and s hφτ≅φτ⊕φτ∨. The first is the local Langlands parameter assigned by Arthur to rest σ and the second is the extended spin parameter.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/extended-spin`, `LG.0/dual-diagram`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Compare the D₃=A₃ representation identities with the local theta LLC formula in both split and quaternionic towers. Treat reducible standard modules and the duality orbit explicitly.

Acceptance: The determinant of φτ is one; the Λ² representation is six-dimensional and orthogonal.

Sources: [GS] §12.3(b)–§12.4, pp. 35–36 — The Spin₆=SL₄ normalization gives φτ⊕φτ∨ for the degree-eight spin parameter and the exterior-square degree-seven standard parameter, with full monodromy.

Planet: Lower-tower KS parameters.

#### heart-levi-parameters — Nondiscrete heart parameters from proper Levis

For each nondiscrete σ∈Irr♥, construct its Spin₇ parameter from the LLC of its proper Levi inducing data and prove simultaneously qφ=rec_Sp₆(rest σ) and sφ=rec_GL₈(SpinLift σ). Use the standard C₃ numbering α₁, α₂, α₃, with α₃ long. Cover the seven standard proper Levis indexed by ∅, {α₁}, {α₂}, {α₃}, {α₁,α₂}, {α₁,α₃}, {α₂,α₃}: the minimal torus, the three semisimple-rank-one refinements, and the maximal GL₃, GL₂×PGL₂ and GL₁×PGSp₄ types with their actual central quotients. Use the actual quotient Levi, normalized induction and Langlands quotient rather than an unjustified direct product identification.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/extended-spin`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `MetaplecticAutomorphicForms:MP.3`, `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`.

Proof route: For tempered σ enumerate the constituent and R-group cases for each proper Levi and compute the classical theta lift’s orthogonal inducing parameter. For nontempered σ transport its positive standard-module exponents through theta and compare unique Langlands quotients. Verify the vector and spin branching on each dual Levi, including the PGSp₄/GSp₄ normalization. These omitted tables are a recorded proof obligation.

Acceptance: Checking only the Siegel GL₃ Levi cannot establish Theorem 12.3 for all irreducibles.

Sources: [GS] §12.4, proof of Theorem 12.3, second bullet, p. 36 — The source reduces nondiscrete heart existence to proper Levis without the tables; this node specifies those missing induction and WD calculations as a target, not an established proof.

Planet: Proper-Levi KS parameters.

#### all-ks — Existence and weak uniqueness for all PGSp₆

For every σ∈Irr(PGSp₆), there exists a unique class φ∈Φw(PGSp₆) with qφ=rec_Sp₆(rest σ) and sφ=rec_GL₈(SpinLift σ). Existence means that the two image parameters have a common admissible Spin₇ lift; uniqueness is in the weak quotient.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/spin6-parameters`, `LG.9/heart-levi-parameters`, `LG.8/heart-ds-parameters`, `LG.0/weak-equivalence`.

Proof route: Use the lower-tower, heart nondiscrete, and heart discrete cases, which cover all σ. Weak uniqueness follows from the defining joint-image equivalence, once existence is proved.

Acceptance: The uniqueness statement does not prove acceptability of Spin₇.

Sources: [GS] §12.4, Theorem 12.3 and proof, p. 36 — Theorem 12.3 combines the discrete-heart, lower-tower and proper-Levi cases to obtain existence and a unique weak class, without asserting simultaneous Spin₇ conjugacy.

Planet: The joint standard and spin parameter.

### LG.10. The weak PGSp₆ correspondence and its fibres

Targets: `weak-llc`, `spectral-properties`, `heart-twist`, `lower-tower-twist`, `surjective-restriction`, `discrete-diamond-fibres`, `lower-tower-fibres`, `levi-fibres`, `weak-fibres`.

#### weak-llc — The weak PGSp₆ correspondence

Define Lw(σ) to be the unique weak class of LG.9/all-ks. It is the unique map whose standard image is the local Langlands parameter assigned by Arthur to the Sp₆ restriction and whose spin image is the extended GL₈ spin-transfer parameter.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/all-ks`.

Proof route: Use existence and weak uniqueness to define the map on isomorphism classes. Read the two comparison diagrams from its joint-image characterization.

API:

- `WeakPGSpLLC.standard` (projection): qLwσ=rec_Sp₆(rest σ).

- `WeakPGSpLLC.spin` (projection): sLwσ=rec_GL₈(SpinLift σ).

- `WeakPGSpLLC.unique` (characterisation): These two image identities uniquely characterize Lw.

- `WeakPGSpLLC.g2` (compatibility): For diamond G₂ theta partners, Lwθπ is the class of iLπ.

Uses: GS Theorem 12.6, pp. 38–39 — States spectral and quadratic-twist compatibility; GS Theorem 12.7, pp. 39–40 — Studies surjectivity and packet fibres.

Checks:

- `WeakPGSpLLC.steinberg` (compatibility): St_PGSp₆ maps to the weak class of the principal Spin₇ SL₂ parameter.

- `WeakPGSpLLC.lowerTower` (compatibility): A lower-tower σ maps to the class of hφτ from LG.9/spin6-parameters.

- `WeakPGSpLLC.centralTwist` (non-example): An unramified central sign changes the weak class whenever it changes its spin parameter, although the standard datum remains the same.

Acceptance: The codomain is Φw, not the full set of Spin₇ conjugacy classes.

Sources: [GS] §12.7, Theorem 12.6, p. 38 — Theorem 12.6 defines the weak class through both transfers. The spectral predicates, twists and surjectivity are justified separately.

Planet: The weak PGSp₆ correspondence.

#### spectral-properties — Temperedness and discreteness of the weak parameter

Lw carries tempered representations to weak classes of bounded parameters and discrete series to weak classes of discrete parameters. The predicates are independent of the chosen representative of the weak class. This target states the forward implications of Theorem 12.6, without strengthening them to converses without proof.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.10/weak-llc`, `LG.9/heart-levi-parameters`, `LG.9/spin6-parameters`, `LG.8/heart-ds-parameters`, `LG.0/elementwise-conjugacy`.

Proof route: Use the explicit Levi/tempered calculations and the discrete constructions. Verify weak equivalence preserves the two spectral predicates in this Spin₇ setting; boundedness is detected by a faithful spin representation, and discreteness needs a centralizer argument, not faithfulness alone.

Acceptance: The quotient must support well-defined spectral predicates before they appear in the theorem.

Sources: [GS] §12.7, Theorem 12.6, p. 38 — The theorem states temperedness and discreteness on weak classes. Boundedness follows from a faithful spin representation; the Levi/centralizer comparison needed for discreteness remains a gap.

#### heart-twist — Quadratic twists in the heart tower

For σ∈Irr♥ and quadratic χ, SpinLift(σ⊗χ∘sim)=SpinLift(σ)⊗χ∘det. The similitude character on PGSO₈ modulo squares is trivial on f₁(SO₈(F)) and pulls back along f₂ to the spinor-norm character. Hence Lw(σ⊗χ)=Lw(σ)⊗χ.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.10/weak-llc`, `LG.2/triality-descent`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use the similitude theta twisting identity, the f₂ spinor-norm pullback, and the quadratic-twist rule for the SO₈ LLC. The standard parameter is unchanged because the twist is trivial on Sp₆; the spin parameter changes by χ.

Acceptance: Treating the similitude character as trivial on f₂ would give the wrong spin twist.

Sources: [GS] §12.7, proof of Theorem 12.6, pp. 38–39 — The proof compares both standard and spin images after quadratic twisting; the standard image is unchanged and the spin image is centrally twisted, with theta similitude conventions fixed.

Planet: Quadratic-twist compatibility.

#### lower-tower-twist — Quadratic twists in both lower towers

For σ∈Irr♠♣ and quadratic χ, its theta/JL PGL₄ datum becomes τ⊗χ∘det (using reduced norm on GL₂(D) before JL). Since χ²=1, (φτ⊗χ)⊕(φτ⊗χ)∨=(φτ⊕φτ∨)⊗χ, while Λ²(φτ⊗χ)=Λ²φτ. Therefore the extended spin lift twists by χ and Lw(σ⊗χ)=Lw(σ)⊗χ.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/spin6-parameters`, `LG.10/weak-llc`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Establish the similitude-character pullback in the split PGO₆ and quaternionic PGO₅,₁ tower and prove JL respects this reduced-norm twist. Apply the explicit spin/vector formulas; check overlap with the heart twisting identity on Irr♣. The omitted classical theta identity is a recorded obligation.

Acceptance: A nonquadratic character would change Λ² by χ² and is outside the assertion.

Sources: [GS] §12.7, final paragraph of the proof of Theorem 12.6, p. 39 — The source leaves the lower-tower case implicit. The split and quaternionic norm-character calculations, including both added lines, remain explicit required targets.

#### surjective-restriction — Surjectivity and restriction onto a classical packet

Lw is surjective. For every weak class [φ], restriction gives a surjection Lw⁻¹([φ])→Π_{qφ}(Sp₆)/PGSp₆(F). In particular every orbit of a Sp₆ representation in that packet occurs in the fibre.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.10/heart-twist`, `LG.10/lower-tower-twist`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`, `LG.10/weak-llc`.

Proof route: Choose any classical packet member. The existence of a Spin₇ lift implies its central character is trivial, so lift it to PGSp₆. The weak parameter of that lift has the same q-image as φ; the two actual Spin₇ lifts differ by a quadratic character after conjugacy. Correct by this character and use twisting.

Acceptance: The target is the PGSp₆ orbit set, rather than individual arbitrary Sp₆ constituents.

Sources: [GS] §12.8, Theorem 12.7(i) and proof, p. 39 — Theorem 12.7(i) uses a generic member of each classical parameter packet and compares the weak class; restriction covers the classical packet orbits rather than identifying every representation.

Planet: Surjectivity of the weak correspondence.

#### discrete-diamond-fibres — Constancy on a discrete diamond Xu packet

Let σ be discrete series in the classical diamond locus (its parameter does not factor through Spin₆), and X the Xu packet containing it. Then Lw is constant on X.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.8/pgsp-globalization`, `LG.8/heart-global-theta`, `LG.10/weak-llc`, `ModularityAndLanglandsExtensions:ML.4/xu-multiplicity-formula`, `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`, `ModularityAndLanglandsExtensions:ML.4`.

Proof route: Globalize σ with a Steinberg place; the global component group is trivial. Change its local member to any σ′∈X at v₀; Xu’s multiplicity formula keeps the resulting representation automorphic and cuspidal. Both global classical theta lifts are nonzero. Their f₂ Arthur GL₈ transfers are nearly equivalent and hence equal; their standard Sp₆ parameters are already equal. Apply weak uniqueness locally.

Acceptance: One-place substitution is justified here by trivial global component group, unlike the two-place argument in LG.6.

Sources: [GS] §12.8, proof of Theorem 12.7(ii), pp. 39–40 — The discrete diamond argument uses two-place packet substitution to preserve both transfers and hence the weak class; the exact multiplicity formula export is required.

#### lower-tower-fibres — Constancy on lower-tower Xu packets

If a discrete parameter factors through Spin₆ and X is a Xu packet in the corresponding lower-tower locus, show that all σ∈X have the same extended spin parameter φτ⊕φτ∨ and hence the same Lw. Treat split and quaternionic theta lifts and their intersection with the heart separately.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/spin6-parameters`, `LG.10/weak-llc`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Proof route: Use the local lower-tower theta and JL packet formulas to compare the rank-four data modulo duality throughout X. Prove that the direct sum is constant even when the rank-four data are changed by the orthogonal outer involution; check the heart overlap. This is one of Appendix C’s omitted cases and remains a proof obligation.

Acceptance: Equality of only the rank-six Λ² parameters is insufficient to infer equality of φτ⊕φτ∨.

Sources: [GS] §12.8, proof of Theorem 12.7(ii), p. 39 — The source leaves the lower-tower packet comparison unstated. The node requires the JL, outer-orbit and enhancement calculation rather than deducing it from theta duality alone.

#### levi-fibres — Reduction of Xu-packet constancy to discrete data

For every proper Levi of PGSp₆, prove the compatibility of its Xu packet induction and Langlands quotient with the two transfers defining Lw. Constancy on the discrete inducing packets must imply constancy on each tempered induced Xu packet, and on its non-tempered standard-module quotient packet. Include all proper-Levi types listed in LG.9/heart-levi-parameters.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.9/heart-levi-parameters`, `LG.10/discrete-diamond-fibres`, `LG.10/lower-tower-fibres`, `ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Proof route: Track the normalized induction parameters and R-group constituents before taking Langlands quotients. Use the standard and spin restriction formulas on the dual Levi to compare both image parameters; the assertion that a reduction is easy does not replace these cases.

Acceptance: The reduction must cover nongeneric constituents as well as generic induced representations.

Sources: [GS] §12.8, opening of the proof of Theorem 12.7(ii), p. 39 — The proof begins by reducing to discrete data. The node spells out the required normalized induction, Langlands quotient and packet-constancy compatibility on every proper Levi.

#### weak-fibres — The fibres are unions of Xu packets

Every fibre of Lw is a union of complete Xu packets. For the weak class of iφ with φ diamond discrete G₂, the fibre is the single distinguished Xu packet X*(φ). No assertion of a full enhanced PGSp₆ LLC is made for general weak classes.

Hypotheses: F is a nonarchimedean local field of characteristic zero; p is its residue characteristic. Parameters are admissible W_F × SL₂(ℂ) homomorphisms modulo dual-group conjugacy; the Weil part is continuous and Frobenius-semisimple and the SL₂ part is algebraic. All Weil–Deligne comparisons retain monodromy.

Prerequisites: `LG.10/discrete-diamond-fibres`, `LG.10/lower-tower-fibres`, `LG.10/levi-fibres`, `LG.6/diamond-fibre`, `LG.5/diamond-ks-unique`, `LG.0/quadratic-rigidity`.

Proof route: Combine the discrete and proper-Levi constancy cases to get unions. For iφ, quadratic rigidity shows that its weak class has one actual Spin₇ class; the generic member of every Xu packet and generic uniqueness exclude additional packets.

Acceptance: A general weak fibre can contain multiple Xu packets; the exceptional singleton conclusion is restricted to diamond discrete G₂ parameters.

Sources: [GS] §12.8, Theorem 12.7(ii) and final paragraph, pp. 39–40 — The final assertion is constancy on Xu packets, hence fibres are unions of packets. Equality with a single Xu packet is not claimed.

Planet: Weak fibres and Xu packets.

## Coverage and proof boundaries

This is a complete target-level planning pass with an accepted independent review. Each layer is planned, and none is closed. Every implementation status remains unchecked. The outstanding proof and ownership requirements below are part of the plan, rather than assertions that the underlying mathematics has been formalized.

| Layer | Coverage | Remaining work |
|---|---|---|
| LG.0 | planned | Discharge exceptional parameter and group-model contracts, Griess/Gross–Savin conjugacy and component-group inputs, and both Chenevier source gates. Prove the full-WD elementwise-conjugacy extension, including commuting unipotent parts. |
| LG.1 | planned | Supply local exceptional period/nonvanishing inputs, exact Poincaré weak containment and relative generic/archimedean isolation exports. |
| LG.2 | planned | Compare and descend current integral triality, supply classical theta/complex matching and analytic spin factors, and control the extra globalization place in the gamma proof. |
| LG.3 | planned | Discharge the exceptional carrier/classification and Chenevier/gamma source gates; supply full-WD local converse and all-places Galois compatibility, including coefficient-prime places. |
| LG.4 | planned | Complete the separate selfdual S₃ enhancement argument and check division-lift nonvanishing at the stated residue characteristics. |
| LG.5 | planned | Discharge Kret–Shin and isobaric-summand local compatibility; prove the explicit club Siegel spin bridge. |
| LG.6 | planned | Supply exact Xu two-place cancellation, archimedean matching and the exceptional global spin-pole converse; propagate classification gates. |
| LG.7 | planned | Close the dependent A₂ and diamond packet proofs, the club spin identity and all-places compatibility before asserting unconditional endpoints. |
| LG.8 | planned | Discharge the Shin density proof and finite-atom/packet-substitution contracts, Rallis/tower input and Kret–Shin algebraic-summand comparison. The explicit spin-regular weight sequence is supplied in the proof sketch. |
| LG.9 | planned | Compute all proper C₃ Levi and overlap cases and close the discrete heart and lower-tower source/supplier inputs. |
| LG.10 | planned | Prove weak discreteness invariance, lower-tower twisting/packet identities and the full induction/Langlands quotient fibre reduction. |

### Recorded gaps

**Exceptional theta and parameter supplier has no addressable stages.** ExceptionalThetaCorrespondencesForG2 is a routed candidate, but no roadmap, packet or reserved stage is present in this checkout. Import its intended ownership of admissible exceptional parameters, irreducible smooth representation loci ♠/♥/♣/♦, exceptional Howe duality/dichotomy, explicit induction formulas, local quaternion-period lemmas 10.1–10.4, global theta kernels and local–global matching, auxiliary depth-zero examples, and GS20 Theorem 1.1 (spin pole ⇒ nonzero global theta to some G₂ form) with its exact hypotheses. These are not new definitions of this roadmap. No fictitious candidate stage is used as a prerequisite. The exceptional supplier must expose contracts and proof closure before these targets are closed. Consuming targets: `LG.0/dual-diagram`, `LG.0/a2-parameters`, `LG.1/relative-globalization`, `LG.1/cuspidal-exceptional-theta`, `LG.1/g2-isolation`, `LG.3/standard-containment`, `LG.3/llc-map`, `LG.3/alternative-map`, `LG.3/map-agreement`, `LG.3/discrete`, `LG.4/nonselfdual-packet`, `LG.4/selfdual-packet`, `LG.5/club-spin-bridge`, `LG.6/diamond-surjectivity`, `LG.6/two-place-globalization`, `LG.6/one-in-all-in`.

**Exceptional conjugacy and component-group comparison.** The source cites Griess and Gross–Savin for injectivity, normalizers, invariant-spinor detection and Sφ≅S_{iφ}/image μ₂. The cited primary proofs were not audited here in full; the targets state their exact required conclusions. A proof owner must supply the complex admissible-WD versions, the nonisotropic-spinor argument, and the special centralizer computations, using the current group models. Reading a compact-group statement or counting eigenvalues is not a proof of these parameter theorems. Consuming targets: `LG.0/dual-diagram`, `LG.0/a2-parameters`, `LG.0/spin-parameters`, `LG.0/standard-injectivity`.

**Current-library group-model comparison.** Current Tau Ceti contains the integral D₄ triality automorphism and explicit G₂ short-root carriers. These are absent or less complete at the formal baseline. Import the current declarations when available at the consuming pin, and prove their comparison with octonion G₂, the simply connected D₄ model and the central quotients used here. Do not redevelop triality, spin groups or general reductive group schemes. Consuming targets: `LG.0/dual-diagram`, `LG.2/triality-descent`.

**Chenevier source-gated descent theorems.** LG.0/chenevier-local and LG.0/chenevier-galois record Theorem E and Theorem 6.4 with the published hypotheses, checked in the primary source. Their proofs and the W×SU₂-to-W×SL₂ convention bridge have no exact supplier node. Designate an owner for these descent results and discharge their Galois/group-theoretic dependencies; no G₂-valued global representation is inferred merely from a characteristic polynomial identity. Consuming targets: `LG.0/chenevier-local`, `LG.0/chenevier-galois`.

**Kret–Shin source gate and isobaric local comparison.** The exact (St), (L-coh) theorem and Proposition 13.1 spin irreducibility under the additional (spin-REG) hypothesis are checked in the primary source. Their proofs are not supplied by the existing AG2 endpoints. An owner must establish the GSpin-valued theorem, central-trivial specialization, local WD lift, and local–global comparison for every regular algebraic isobaric GL₈ summand with its shift. Irreducibility under the full hypotheses supports the cuspidality deduction after that comparison; regularity by itself does not. Consuming targets: `LG.5/kret-shin-input`, `LG.5/ks-existence`, `LG.8/heart-ds-parameters`, `LG.5/ks-spin-irreducibility`.

**Independent analytic gamma-factor source gate.** GF Theorem 2.4 is recorded with its restricted global family and all four multiplicativity formulas. Its analytic existence/uniqueness proof still needs an owner and the exceptional globalization contracts; it is not assumed as an unrestricted global functional equation or a consequence of defining an arbitrary family from a proposed LLC. Consuming targets: `LG.3/gamma-input`, `LG.3/gamma-uniqueness`.

**Selfdual S₃ enhancement argument.** The projective μ₃-centralizer construction in GS Proposition 3.2 does not apply when the normalizer enlarges the component group to S₃. Prove the separate split ± extension and division-lift argument in LG.4/selfdual-packet, with the 2-dimensional restriction χ⊕χ⁻¹, including p=2. Its expected result is a target, not a claimed repair already proved by the μ₃ argument. Consuming targets: `LG.4/selfdual-packet`, `LG.4/subregular-packet`, `LG.4/enhanced-a2-theta`.

**Club spin bridge through explicit Siegel constituents.** For a generic discrete G₂ club member, compute the full WD parameter of the classical theta/triality lift of I₃(τ) or I₃(τ)_gen and obtain φτ⊕φτ∨⊕1⊕1. Proposition 5.2 assumes a discrete PGSp₆ partner and cannot prove this. The explicit MP.3 extension request records the required input, and LG.5/club-spin-bridge records the exceptional comparison. Consuming targets: `LG.5/club-spin-bridge`, `LG.5/full-spin`.

**Functional-equation globalization at the extra place.** GS Proposition 10.7 permits one further finite place where sphericity is not controlled, whereas the proof of Proposition 4.1 cancels every finite place except its stated Steinberg, supercuspidal and repeated σ places. Prove a stronger globalization, show that the remaining place contributes a known matching factor, or modify the comparison argument to eliminate it. Until this is done the cancellation argument is not closed. Consuming targets: `LG.2/spin-gamma`, `LG.2/spin-twist`.

**Rallis and lower-tower supplier is pending.** The proposed MetaplecticAutomorphicFormsPartIIShimuraWaldspurger has no addressable stages here. The heart-global-theta proof needs the second-term-range Rallis inner product formula (GQT Theorem 1.4(ii)), all-place nonvanishing and the tower cuspidality implication with PGSp₆–PGSO₈ similitude normalizations. These are imported classical-theta results, not planned again as exceptional results. Consuming targets: `LG.8/heart-global-theta`, `LG.5/ks-existence`, `LG.8/heart-ds-parameters`.

**Shin density proof and packet-substitution source gate.** Theorem 5.8 itself concludes only discrete series at infinity. The explicit λ_t=t(8,4,2) argument in shin-input supplies the extra spin-regular weight selection through Definition 3.5 and Corollary 4.12. The density theorem still needs a proof owner; verify both finite Plancherel atoms, the packet substitution and the global quadratic correction. The weight-cone calculation itself is no longer an unfilled obligation. Consuming targets: `LG.8/shin-input`, `LG.8/pgsp-globalization`.

**Appendix C omitted proper-Levi and lower-tower cases.** Fill the exact tables/proofs in LG.9/heart-levi-parameters, the split/quaternionic twisting calculation in LG.10/lower-tower-twist, the lower-tower packet comparison in LG.10/lower-tower-fibres and the normalized induction/Langlands quotient reduction in LG.10/levi-fibres. Imported Howe duality alone does not prove these LLC, twist or Xu-packet identities. Consuming targets: `LG.9/heart-levi-parameters`, `LG.10/lower-tower-twist`, `LG.10/lower-tower-fibres`, `LG.10/levi-fibres`.

**Weak spectral predicates require proof.** Theorem 12.6 uses boundedness and discreteness on weak classes. Faithfulness of spin detects boundedness, but discreteness requires showing that joint standard/spin equivalence preserves the relevant centralizer/Levi condition for Spin₇ WD parameters. Supply this comparison explicitly before descending discreteness to Φw. Consuming targets: `LG.10/spectral-properties`.

**Classical classification proof gates propagate.** The imported ML.4 trace-formula-inputs-register explicitly retains the twisted weighted fundamental lemma and stabilization proof boundaries. Its local/global Arthur and Xu statements are therefore used with those supplier gates, not represented as independently proved by this roadmap. The global transfers, packet substitutions and enhanced endpoints inherit that status. Consuming targets: `LG.2/local-spin-lift`, `LG.2/global-spin-lift`, `LG.3/standard-containment`, `LG.6/one-in-all-in`, `LG.6/diamond-enhancements`, `LG.8/pgsp-globalization`, `LG.10/discrete-diamond-fibres`.

**Full-WD elementwise-conjugacy extension.** CG Lemma 3.10 is a compact-group conjugacy criterion. The full GS Lemma 12.2 target tests every element of W_F×SL₂, including unipotents. A proof must control the joint semisimple/unipotent conjugacy data; density gives equality of characters but not by itself pointwise conjugacy on these elements. Supply this extension before treating the full-WD target as established. Consuming targets: `LG.0/elementwise-conjugacy`.

### Supplier requests

**`tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.** Supply the split group models and identifications used for G₂, SL₃, PGSp₆ and D₄. Compare the current short-root G₂ representation carrier with octonion automorphisms and the integral tripled D₄ carrier with the Chevalley model. No reconstruction of pinned groups or triality is requested. Consuming targets: `LG.0/dual-diagram`, `LG.2/triality-descent`.

**`tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`.** Export the B₃/D₄ fundamental-representation models, Spin₆=SL₄ normalization, and restrictions needed to prove vj=1+3+3∨, si=1+v and the Spin₈-to-Spin₇ branching. Reuse the current Clifford and spin library. Consuming targets: `LG.0/dual-diagram`, `LG.0/branching`, `LG.9/spin6-parameters`, `LG.0/unacceptability-test`.

**`tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈`.** Provide the comparison between the existing integral pinned D₄ triality automorphism and the vector/half-spin central quotients. The present roadmap owns only its descent to the paper’s f₁,f₂,f₃ and their theta applications. Consuming targets: `LG.2/triality-descent`.

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.** Export the local Brauer invariant and local duality pairing specialized to H¹(F,PGL₃)=(1/3)ℤ/ℤ, with the reciprocity sign; include the opposite-algebra inversion and Kottwitz μ₃-character convention. Consuming targets: `LG.4/cubic-labels`.

**`EndoscopicTransferAndUnitaryTraceComparison:ET.6`.** Export char-zero local GL_n LLC (n=1,2,3,4,7,8), compatibility with direct sums, normalized induction, duality, determinants, quadratic twists and Rankin–Selberg gamma factors, retaining N. Export JL for GL₁(D₃) and GL₂(D₂), including trivial-centre descent and opposite/dual and reduced-norm-twist rules. Supply the full-WD tempered GL₇ local converse theorem for all GL_r twists; a converse only for irreducible Weil representations is insufficient. Consuming targets: `LG.0/a2-parameters`, `LG.3/llc-map`, `LG.3/map-agreement`, `LG.3/nontempered`, `LG.3/rank-seven-lift`, `LG.3/gamma-compatibility`, `LG.3/gamma-uniqueness`, `LG.4/cubic-labels`, `LG.5/club-spin-bridge`, `LG.9/spin6-parameters`, `LG.10/lower-tower-twist`.

**`SmoothRepresentationsOfLocalGroups:SR.2`.** Use normalized parabolic induction, Jacquet functors, induction in stages, the irreducible Langlands quotient and compatibility with smooth similitude restriction for the G₂, C₃ and D₄ Levis. Include the generic and nongeneric R-group constituents used by the explicit theta formulas. Consuming targets: `LG.1/poincare-transfer`, `LG.1/g2-isolation`, `LG.3/map-agreement`, `LG.3/nontempered`, `LG.3/tempered`, `LG.3/tempered-small-packets`, `LG.9/heart-levi-parameters`, `LG.10/levi-fibres`.

**`SmoothRepresentationsOfLocalGroups:SR.3`.** Export the irreducible tempered and positive-standard-module classifications and exact hypotheses for admissibility/restriction to finite-index or derived subgroups. Include the Langlands quotient convention used on all proper C₃ Levis. Consuming targets: `LG.3/nontempered`, `LG.9/heart-levi-parameters`.

**`SmoothRepresentationsOfLocalGroupsPartII:SRU.3`.** Extend the relative-isolation export to generic discrete series in the local support of globally generic cusp forms for symplectic similitude groups, in precisely ILM Proposition A.5 and Lemma A.2 form. Supply the real discrete-series far-from-walls isolation condition with an explicit root/weight inequality and its stability under the theta infinitesimal-character matching. Existing isolation in the tempered dual alone is not this relative-spectrum theorem. Consuming targets: `LG.1/g2-isolation`, `LG.1/generic-globalization`, `LG.6/two-place-globalization`.

**`AutomorphicFormsOnReductiveGroups:AF.2`.** Provide automorphic Hilbert sums and period selection, plus the Poincaré-series weak-containment statement used in GS Proposition 10.5 and 10.7 (SV Theorem 16.3.2 and Remark 16.4.1): specified local distinguished/generic embeddings, quotient measures, prescribed compact/hyperspecial vectors, and the one additional finite place. Also export the generic square-integrable summand in L²_ψ(U\G). Consuming targets: `LG.1/period-spectrum`, `LG.1/generic-spectrum`, `LG.1/poincare-transfer`.

**`AutomorphicFormsOnReductiveGroups:AF.3`.** Supply the cuspidal spectral summands selected by global Whittaker nonvanishing and the supercuspidal local cuspidality criterion for the Poincaré construction. Consuming targets: `LG.1/generic-spectrum`.

**`ModularityAndLanglandsExtensions:ML.4`.** In addition to the exact imported local Arthur and Xu nodes, export global Sp₆ and SO₈ standard transfers with all local parameters, the generic-parameter multiplicity formula, the Steinberg criterion giving a generic parameter with trivial global component group, and the two-identical-place sign cancellation in Xu’s multiplicity formula. Preserve the supplier’s trace-formula-input gates rather than assuming its classification is already closed. Consuming targets: `LG.2/global-spin-lift`, `LG.3/standard-containment`, `LG.5/ks-existence`, `LG.6/one-in-all-in`, `LG.8/pgsp-globalization`, `LG.10/discrete-diamond-fibres`.

**`MetaplecticAutomorphicForms:MP.3`.** Export the all-residue-characteristic similitude theta correspondences PGSp₆–PGSO₈ and PGSp₆–(PGO₆,PGO₅,₁), their Howe duality, conservation/partition, restriction/outer-orbit behavior and lower-tower JL identification. Include the classical local LLC formulas on every proper C₃ Levi, the explicit generic Siegel spin formula φτ+φτ∨+1+1, lower-tower overlap, similitude/spinor-norm twist rules (including GL₂(D) reduced norm), generic split-tower nonvanishing, and Adams–Barbasch matching at complex places. The present work imports these classical correspondences and owns their exceptional comparison. Consuming targets: `LG.2/local-spin-lift`, `LG.5/club-spin-bridge`, `LG.8/heart-global-theta`, `LG.9/extended-spin`, `LG.9/spin6-parameters`, `LG.9/heart-levi-parameters`, `LG.10/heart-twist`, `LG.10/lower-tower-twist`, `LG.10/lower-tower-fibres`.

**`AutomorphicLFunctionsAndLocalFactors:AL.4`.** Extend unramified Euler-factor operations to the Langlands–Shahidi spin factors for generic PGSp₆: local gamma and L normalizations, tempered holomorphy, global functional equation, quadratic twisting, and the pole-at-zero comparison used to recognize exceptional theta images. Supply the standard degree-seven nonvanishing at one for generic global Arthur parameters and the spin pole identity used with the exceptional Siegel–Weil converse. Rankin–Selberg input alone does not supply spin factors. Consuming targets: `LG.2/spin-gamma`, `LG.6/diamond-surjectivity`, `LG.6/one-in-all-in`, `LG.8/heart-global-theta`.

**`AutomorphicGaloisRepresentationsPartII:AG2.2`.** For rank seven and every algebraic cuspidal summand of the isobaric rank-eight transfer, supply the associated semisimple Galois representations in the precise L-algebraic/unitary normalization used here, with coefficient-field transport. Kret–Shin’s GSpin-valued representation and Chenevier’s G₂ descent remain separate source gates. Consuming targets: `LG.0/chenevier-local`, `LG.0/chenevier-galois`, `LG.3/global-compatibility`, `LG.5/kret-shin-input`, `LG.5/ks-existence`, `LG.8/heart-ds-parameters`.

**`AutomorphicGaloisRepresentationsPartII:AG2.5`.** Supply prime-to-ℓ all-places local–global compatibility for the rank-seven transfer and algebraic cuspidal summands of rank eight, including potentially ramified places, Frobenius semisimplification with N retained, and direct sums with the correct shifts. Verify the exact Taylor–Yoshida/Caraiani hypotheses for these summands. Consuming targets: `LG.0/chenevier-local`, `LG.3/global-compatibility`, `LG.5/kret-shin-input`, `LG.5/ks-existence`, `LG.8/heart-ds-parameters`.

**`AutomorphicGaloisRepresentationsPartII:AG2.6`.** Supply potentially semistable WD local–global compatibility at places above the coefficient prime for the regular algebraic self-dual rank-seven transfer, with monodromy and the specified normalization. Chenevier’s global descent plus prime-to-ℓ comparison does not establish this case. Consuming targets: `LG.3/global-compatibility`.

**`AutomorphicSpectralTheory:AS.6`.** Provide a proof owner for Shin Theorem 5.8 with all §5.2 assumptions and Corollary 4.12 along sequences satisfying Definition 3.5. LG.8/shin-input supplies the explicit spin-regular sequence λ_t=t(8,4,2); preserve the Plancherel-regularity, positive-measure and centre assumptions. Consuming targets: `LG.8/shin-input`, `LG.8/pgsp-globalization`.

### Ownership and current upstream reuse

**LocalLanglandsCorrespondenceForG2, ExceptionalThetaCorrespondencesForG2.** The exceptional theta supplier is a routed candidate with no addressable stages in this checkout. Retain all exceptional parameter, local/global theta and local period foundations with that candidate; this roadmap owns only the LLC comparison, spin transfer applications and packets. Publish supplier contracts before closure; do not invent stage ids.

**LocalLanglandsCorrespondenceForG2, MetaplecticAutomorphicForms, MetaplecticAutomorphicFormsPartIIShimuraWaldspurger.** Classical similitude theta and the Rallis/tower inputs are prerequisites rather than new exceptional theory. Place the explicit C₃/D₄ Levi, overlap and twist exports in MP.3 or its classical theta extension, and the Rallis/tower proof in the pending Part II. The present roadmap keeps only their exceptional and weak-LLC comparisons.

**LocalLanglandsCorrespondenceForG2, AutomorphicGaloisRepresentationsPartII, AutomorphicSpectralTheory.** The precise Kret–Shin, Chenevier and Shin theorems are source-gated inputs with no exact current proof owner. Assign the GSpin and G₂ descent proofs to extensions of the Galois direction and the density proof to the automorphic spectral direction; preserve the exact contracts here until the owning nodes exist.

Current Tau Ceti already has integral D₄ triality and explicit short-root G₂ data. Consumers should compare those carriers with octonion/central-quotient models and reuse the existing rational spinor-norm roadmap. No edits or internal roadmap-link review were performed here.

### Routed input coverage

Every routed input item has the following target assignment. This records routing, not a separate claim of proof closure.

| Input | Targets |
|---|---|
| `PAPER-GAN-SAVIN-23-B/2` | `LG.7/main-correspondence` |
| `PAPER-GAN-SAVIN-23-B/3` | `LG.3/discrete` |
| `PAPER-GAN-SAVIN-23-B/4` | `LG.3/tempered` |
| `PAPER-GAN-SAVIN-23-B/5` | `LG.3/nontempered` |
| `PAPER-GAN-SAVIN-23-B/6` | `LG.3/llc-map` |
| `PAPER-GAN-SAVIN-23-B/7` | `LG.3/llc-map` |
| `PAPER-GAN-SAVIN-23-B/8` | `LG.3/theta-uniqueness` |
| `PAPER-GAN-SAVIN-23-B/9` | `LG.5/club-spin-bridge`, `LG.5/full-spin` |
| `PAPER-GAN-SAVIN-23-B/10` | `LG.7/main-correspondence` |
| `PAPER-GAN-SAVIN-23-B/11` | `LG.3/global-compatibility` |
| `PAPER-GAN-SAVIN-23-B/12` | `LG.3/gamma-compatibility` |
| `PAPER-GAN-SAVIN-23-B/13` | `LG.3/gamma-uniqueness` |
| `PAPER-GAN-SAVIN-23-B/14` | `LG.7/generic-supercuspidal` |
| `PAPER-GAN-SAVIN-23-B/24` | `LG.0/dual-diagram` |
| `PAPER-GAN-SAVIN-23-B/25` | `LG.0/a2-parameters` |
| `PAPER-GAN-SAVIN-23-B/26` | `LG.0/spin-parameters` |
| `PAPER-GAN-SAVIN-23-B/27` | `LG.0/standard-injectivity` |
| `PAPER-GAN-SAVIN-23-B/28` | `LG.3/llc-map` |
| `PAPER-GAN-SAVIN-23-B/29` | `LG.3/standard-containment` |
| `PAPER-GAN-SAVIN-23-B/30` | `LG.3/alternative-map` |
| `PAPER-GAN-SAVIN-23-B/31` | `LG.0/chenevier-local` |
| `PAPER-GAN-SAVIN-23-B/34` | `LG.3/nontempered` |
| `PAPER-GAN-SAVIN-23-B/35` | `LG.3/tempered` |
| `PAPER-GAN-SAVIN-23-B/36` | `LG.3/tempered-small-packets` |
| `PAPER-GAN-SAVIN-23-B/37` | `LG.0/chenevier-galois` |
| `PAPER-GAN-SAVIN-23-B/39` | `LG.3/rank-seven-lift`, `LG.3/pair-gamma` |
| `PAPER-GAN-SAVIN-23-B/40` | `LG.3/gamma-input` |
| `PAPER-GAN-SAVIN-23-B/42` | `LG.3/gamma-uniqueness` |
| `PAPER-GAN-SAVIN-23-B/43` | `LG.4/nonselfdual-packet`, `LG.4/selfdual-packet` |
| `PAPER-GAN-SAVIN-23-B/44` | `LG.4/cubic-labels` |
| `PAPER-GAN-SAVIN-23-B/45` | `LG.4/cubic-labels` |
| `PAPER-GAN-SAVIN-23-B/47` | `LG.4/nonselfdual-packet`, `LG.4/selfdual-packet` |
| `PAPER-GAN-SAVIN-23-B/48` | `LG.2/triality-descent` |
| `PAPER-GAN-SAVIN-23-B/49` | `LG.0/branching` |
| `PAPER-GAN-SAVIN-23-B/51` | `LG.2/local-spin-lift` |
| `PAPER-GAN-SAVIN-23-B/52` | `LG.2/global-spin-lift` |
| `PAPER-GAN-SAVIN-23-B/53` | `LG.2/spin-gamma` |
| `PAPER-GAN-SAVIN-23-B/54` | `LG.2/spin-twist` |
| `PAPER-GAN-SAVIN-23-B/55` | `LG.2/spin-gamma` |
| `PAPER-GAN-SAVIN-23-B/56` | `LG.2/global-spin-lift` |
| `PAPER-GAN-SAVIN-23-B/57` | `LG.2/global-spin-lift` |
| `PAPER-GAN-SAVIN-23-B/58` | `LG.5/kret-shin-input` |
| `PAPER-GAN-SAVIN-23-B/59` | `LG.5/ks-existence` |
| `PAPER-GAN-SAVIN-23-B/60` | `LG.5/ks-parameter` |
| `PAPER-GAN-SAVIN-23-B/61` | `LG.0/elementwise-conjugacy`, `LG.0/unacceptability-test` |
| `PAPER-GAN-SAVIN-23-B/62` | `LG.5/diamond-ks-unique` |
| `PAPER-GAN-SAVIN-23-B/63` | `LG.0/quadratic-rigidity` |
| `PAPER-GAN-SAVIN-23-B/64` | `LG.5/diamond-spin` |
| `PAPER-GAN-SAVIN-23-B/65` | `LG.6/diamond-surjectivity` |
| `PAPER-GAN-SAVIN-23-B/73` | `LG.6/generic-unique` |
| `PAPER-GAN-SAVIN-23-B/74` | `LG.6/distinguished-xu` |
| `PAPER-GAN-SAVIN-23-B/75` | `LG.6/diamond-fibre` |
| `PAPER-GAN-SAVIN-23-B/76` | `LG.6/diamond-enhancements` |
| `PAPER-GAN-SAVIN-23-B/77` | `LG.6/two-place-globalization`, `LG.6/one-in-all-in` |
| `PAPER-GAN-SAVIN-23-B/78` | `LG.7/partial-pgsp-llc` |
| `PAPER-GAN-SAVIN-23-B/79` | `LG.4/enhanced-a2-theta` |
| `PAPER-GAN-SAVIN-23-B/80` | `LG.7/enhanced-exceptional-theta` |
| `PAPER-GAN-SAVIN-23-B/89` | `LG.1/period-spectrum` |
| `PAPER-GAN-SAVIN-23-B/90` | `LG.1/relative-globalization` |
| `PAPER-GAN-SAVIN-23-B/91` | `LG.1/poincare-transfer` |
| `PAPER-GAN-SAVIN-23-B/94` | `LG.1/cuspidal-exceptional-theta` |
| `PAPER-GAN-SAVIN-23-B/95` | `LG.1/generic-spectrum` |
| `PAPER-GAN-SAVIN-23-B/96` | `LG.1/poincare-transfer` |
| `PAPER-GAN-SAVIN-23-B/97` | `LG.1/generic-globalization` |
| `PAPER-GAN-SAVIN-23-B/98` | `LG.1/generic-globalization` |
| `PAPER-GAN-SAVIN-23-B/99` | `LG.1/g2-isolation` |
| `PAPER-GAN-SAVIN-23-B/103` | `LG.1/generic-globalization` |
| `PAPER-GAN-SAVIN-23-B/119` | `LG.0/weak-equivalence` |
| `PAPER-GAN-SAVIN-23-B/121` | `LG.9/extended-spin` |
| `PAPER-GAN-SAVIN-23-B/122` | `LG.8/heart-ds-parameters`, `LG.9/spin6-parameters`, `LG.9/heart-levi-parameters`, `LG.9/all-ks` |
| `PAPER-GAN-SAVIN-23-B/123` | `LG.8/shin-input` |
| `PAPER-GAN-SAVIN-23-B/124` | `LG.8/pgsp-globalization` |
| `PAPER-GAN-SAVIN-23-B/126` | `LG.8/heart-global-theta` |
| `PAPER-GAN-SAVIN-23-B/127` | `LG.10/weak-llc`, `LG.10/spectral-properties`, `LG.10/heart-twist`, `LG.10/lower-tower-twist` |
| `PAPER-GAN-SAVIN-23-B/128` | `LG.10/surjective-restriction`, `LG.10/discrete-diamond-fibres`, `LG.10/lower-tower-fibres`, `LG.10/levi-fibres`, `LG.10/weak-fibres` |

## Source corrections and scope

All findings are stated in our own words and carry independent verdicts. E1–E18 and E20–E21 are confirmed with the qualifications below; E19 is rejected because it omitted the applicable Kret–Shin irreducibility theorem. E22 is scoped to the HKT preprint proof read, and E23 to Shin’s author copy. A bounded correction search does not establish that no later correction exists.

### E1 — confirmed (gap)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §3.5, proof of Proposition 3.2, pp. 14–16.

Finding as proposed: The enhancement argument treats the discrete centralizer as a group of order three throughout.

Correction or disposition: Use that construction for nonselfdual A₂ parameters and give the separate S₃ argument of LG.4/selfdual-packet.

Check: For the selfdual three-dimensional principal SL₂ parameter, the G₂ component group is S₃; its irreducibles cannot be identified with three μ₃ characters by the proposed centralizer construction. Reach: the proof.

Independent review: At GS pp. 14–16 the μ₃-centralizer construction does not handle the S₃ centralizer already listed in Lemma 2.4. The principal SL₂ in SL₃ supplies the selfdual test; retain a separate S₃ proof obligation.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E1; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E2 — confirmed (gap)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §9, Theorem 9.1(ii), p. 27.

Finding as proposed: The enhanced theta assertion is worded for arbitrary G₂ representations.

Correction or disposition: Restrict the enhanced PGSp₆ assertion to the diamond discrete locus where the assigned Xu packet was constructed.

Check: Division-side representations have zero PGSp₆ theta, and the club/nondiscrete cases have no full enhanced PGSp₆ assignment in the paper. Reach: a stated result.

Independent review: Theorem 9.1(ii), p. 27 uses an unrestricted G₂ input although the assigned PGSp₆ enhancement was constructed only for diamond discrete parameters; spade inputs have zero PGSp₆ theta. The restricted endpoint is the justified one.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E2; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E3 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §1.1, Main Theorem (ix), p. 4.

Finding as proposed: The gamma-factor formula closes a parenthesis before the tensor product.

Correction or disposition: Use the factor of the tensor parameter (vLπ)⊗φτ.

Check: The corrected placement agrees with the well-typed identity on p. 13. Reach: nothing.

Independent review: The parenthesis in Main Theorem (ix), p. 4 places the tensor product outside its gamma-factor argument; the formula on p. 13 fixes its intended type.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E3; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E4 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §1.2, p. 5.

Finding as proposed: The appendix number and the spelling of Griess disagree with the later headings and bibliography.

Correction or disposition: Appendix A is §10, Appendix B is §11; attribute the conjugacy result to Griess.

Check: The section headings and the cited author identify the intended references. Reach: nothing.

Independent review: The appendix headings are §§10 and 11 and the bibliography gives Griess. These resolve the inconsistent references on p. 5 without a mathematical change.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E4; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E5 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §2.1, p. 8; §3.1, p. 10.

Finding as proposed: The theta partition is attributed to the Howe-duality part of Theorem 2.1.

Correction or disposition: Cite Theorem 2.1(ii) for dichotomy.

Check: Part (i) concerns Howe duality, while the partition is stated in part (ii). Reach: nothing.

Independent review: The partition is Theorem 2.1(ii), while (i) states Howe duality; the references on pp. 8 and 10 select the wrong part.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E5; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E6 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §3.3, p. 11.

Finding as proposed: The definite octonion algebra is placed over the local field even though its real and finite localizations are then used.

Correction or disposition: Take the octonion algebra over the totally real global field k.

Check: A local nonarchimedean algebra has no collection of archimedean localizations for the globalization argument. Reach: nothing.

Independent review: The globalization on p. 11 requires an octonion algebra over the totally real number field, with the stated localizations. The local F cannot be its base.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E6; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E7 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §4.4, proof of Proposition 4.1(i), p. 19.

Finding as proposed: The functional-equation identity is described as one for G₂ representations.

Correction or disposition: Its local representations are of PGSp₆.

Check: The three factors involve the chosen local components of the PGSp₆ globalization. Reach: nothing.

Independent review: All factors in the p. 19 comparison belong to the PGSp₆ globalization, so the group named there must be PGSp₆.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E7; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E8 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §7, equation (7.2) and property (d), p. 22.

Finding as proposed: The text confuses the parameter being lifted and uses a packet subscript not defined there.

Correction or disposition: The lifts are of φ♭; the stability statement concerns the Xu packet over φ♭.

Check: The projection Spin₇→SO₇ and the packet notation in (a)–(c) fix both meanings. Reach: nothing.

Independent review: The lifting target in (7.2) and the Xu packet in §7 are over φ♭. The printed parameter and subscript are inconsistent with their definitions on pp. 21–22.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E8; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E9 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §9, p. 26.

Finding as proposed: The distinguished packet is placed in a set of parameter lifts.

Correction or disposition: It is a Xu packet contained in the representation set above φ♭.

Check: The parameter-lift set and the representation set were defined separately in §7. Reach: nothing.

Independent review: The distinguished object in §9 is a representation packet, whereas the printed ambient set parametrizes Spin₇ lifts. The construction in §8.2 fixes the correction.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E9; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E10 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §10.1, p. 27.

Finding as proposed: The description of an open orbit omits its quaternion-algebra label.

Correction or disposition: Insert the label D when identifying its stabilizer with Aut(D).

Check: The preceding orbit classification determines the missing object. Reach: nothing.

Independent review: The orbit stabilizer on p. 27 depends on the quaternion algebra D already used to label the orbit; the missing label is determined by the preceding construction.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E10; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E11 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §10.1, proof of Lemma 10.1, p. 27.

Finding as proposed: Vanishing on open rank-three orbits is said to force rank exactly two.

Correction or disposition: The rank is at most two; account also for ranks zero and one in the low-rank theta exclusion.

Check: Excluding rank three does not rule out either smaller rank; the temperedness contradiction survives. Reach: the proof.

Independent review: The exclusion of rank three only gives rank at most two. The ranks zero and one are also in the low-rank obstruction, so the intended temperedness contradiction is unchanged.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E11; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E12 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.3, p. 35; §12.7, p. 39.

Finding as proposed: The extended spin formulas mix the earlier G₂ group symbol and π with the PGSp₆ representation σ.

Correction or disposition: Use Irr(PGSp₆) and theta of σ consistently in Appendix C.

Check: The domain of the extended spin construction is PGSp₆ throughout. Reach: nothing.

Independent review: Appendix C defines maps on PGSp₆ representations σ; occurrences of the earlier G₂/π symbols at these locations are inconsistent with that domain.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E12; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E13 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.4, p. 36.

Finding as proposed: The final Sp₆ subscript in the lower-tower formula repeats the rank digit.

Correction or disposition: Use the Sp₆ correspondence.

Check: Only the six-dimensional symplectic group occurs in this comparison. Reach: nothing.

Independent review: Only Sp₆ appears in the lower-tower comparison on p. 36; the repeated digit in its subscript has no mathematical role.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E13; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E14 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.5, proof of Lemma 12.4, p. 37.

Finding as proposed: The prescribed local representation and the selected Sp₆ summand acquire inconsistent variable names.

Correction or disposition: Keep σ for the prescribed local representation and the originally chosen Σ′♭ for its global restriction.

Check: The extra local π and extra-prime global summand have not been defined. Reach: nothing.

Independent review: Lemma 12.4 introduces σ and Σ′♭, not the replacement local variable and second-prime summand used later on p. 37.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E14; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E15 — confirmed (misprint)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.8, proof of Theorem 12.7, p. 39.

Finding as proposed: The weak correspondence and the PGSp₆ globalization are denoted using symbols from the G₂ proof.

Correction or disposition: Use Lw and the theta lift of Σ.

Check: The map and automorphic representation in Appendix C have different domains from their earlier G₂ analogues. Reach: nothing.

Independent review: Theorem 12.7 uses Lw and the globalization Σ from Appendix C. The earlier G₂-map and Π symbols on p. 39 do not name these objects.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E15; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E16 — confirmed (error)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; Main Theorem (vi), p. 4; Proposition 5.2 and Corollary 5.3, pp. 20–21.

Finding as proposed: The diagram sends every generic discrete G₂ representation to a discrete PGSp₆ representation.

Correction or disposition: Use generic tempered as intermediate codomain; prove spin compatibility on the club locus by the separate Siegel calculation.

Check: HD Theorems 8.5 and 15.2 give π_gen[1] from split PGL₃ Steinberg and its proper Siegel-induced PGSp₆ partner. Proposition 5.2 assumes that partner is discrete, so does not cover it. Reach: a stated result.

Independent review: HD Theorems 8.5 and 15.2 identify the generic subregular discrete G₂ member and its proper Siegel-induced PGSp₆ partner. Hence the discrete intermediate codomain on GS p. 4 is false; Proposition 5.2 explicitly assumes a discrete partner.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E16; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E17 — confirmed (error)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §11.2, Proposition 11.6, p. 33.

Finding as proposed: Weak containment in an indexed Hilbert sum is asserted to yield convergence along an increasing-index subsequence.

Correction or disposition: Use membership in the Fell closure of the set of summand classes; isolation then gives membership in that set.

Check: Take the first summand to be isolated Steinberg and every subsequent summand trivial. Weak containment holds but every increasing-index subsequence is eventually trivial. The corrected isolated-summand result is already planned by SRU.1. Reach: a stated result.

Independent review: An indexed sum with first term an isolated Steinberg representation and every later term trivial weakly contains Steinberg but has no increasing-index subsequence converging to it. The Fell-closure/isolated-summand replacement suffices for the application.

Correction search: Inherited from PAPER-GAN-SAVIN-23-B/E17; no published correction identified in this bounded check. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E18 — confirmed (gap)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §4.4, proof of Proposition 4.1(i), pp. 18–19; Proposition 10.7, pp. 29–30.

Finding as proposed: The comparison cancels all other local factors after invoking a globalization that allows one further exceptional finite place.

Correction or disposition: Control that factor or strengthen/modify the globalization and functional-equation comparison.

Check: Proposition 10.7 gives sphericity outside the prescribed set and one additional place; that extra factor does not occur in the displayed cancellation. Reach: the proof.

Independent review: Proposition 10.7 permits one extra uncontrolled finite place. The cancellation in Proposition 4.1 does not identify its factor. This is a proof obligation, not a counterexample to the gamma identity.

Correction search: No published correction identified in this bounded check; proposed finding for independent review. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E19 — rejected (gap)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.6, concluding paragraph, p. 38.

Finding as proposed: Spin regularity at infinity is used to infer cuspidality of the GL₈ transfer.

Correction or disposition: The proposed objection is rejected. Under the actual full globalization hypotheses use KS Proposition 13.1(4) and algebraic-summand Galois comparison to justify cuspidality. General global spin transfer remains isobaric.

Check: The allegation tested spin regularity in isolation and omitted the Steinberg/cohomological irreducibility theorem available for this globalization; see the independent review for the argument. Reach: the proof.

Independent review: Rejected: the actual globalization also has (St) and (L-coh). KS Proposition 13.1(4), PDF pp. 60–61 (journal pp. 134–135), proves spin Galois irreducibility with (spin-REG). Its proof excludes the G₂ and principal PGL₂ monodromy cases by repeated spin weights. After algebraic-summand Galois comparison this forces the isobaric GL₈ transfer to be cuspidal. The finding considered regularity alone and missed these hypotheses.

Correction search: No published correction identified in this bounded check; proposed finding for independent review. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E20 — confirmed (gap)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.5, proof of Lemma 12.4, p. 37.

Finding as proposed: Shin Theorem 5.8 is used with a spin-regular infinity requirement beyond its stated conclusion.

Correction or disposition: Use Shin Corollary 4.12 with the explicit λ_t=t(8,4,2) sequence and the spin-weight inequalities now given in LG.8/shin-input.

Check: Theorem 5.8 concludes only discrete series at infinity; avoiding root walls does not by itself avoid all spin-weight coincidences. Reach: the proof.

Independent review: Confirmed only as an omitted refinement: Shin Theorem 5.8 itself specifies no spin-regular infinity type. Corollary 4.12 along λ_t=t(8,4,2) fills this step, since h=(8t+3,4t+2,2t+1) has eight distinct spin weights and divergent root pairings. No false conclusion is alleged.

Correction search: No published correction identified in this bounded check; proposed finding for independent review. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E21 — confirmed (gap)

Source: [GS] Published Forum Math. Pi 11 (2023), e28; §12.4 and §§12.7–12.8, pp. 36, 39–40.

Finding as proposed: The proper-Levi existence, lower-tower twisting and fibre reductions are left without case computations.

Correction or disposition: Provide the explicit tables and comparison proofs named in LG.9/heart-levi-parameters and LG.10/lower-tower-twist, lower-tower-fibres and levi-fibres.

Check: Each case is necessary for the all-irreducible quantifiers, and the discrete diamond argument alone does not establish it. Reach: the proof.

Independent review: Confirmed as missing case computations needed by formalization: GS p. 36 and pp. 39–40 reduce to proper Levis and lower towers without displaying their WD/twist/packet calculations. This is not evidence that the stated existence or fibre conclusion is false.

Correction search: No published correction identified in this bounded check; proposed finding for independent review. Searched: The published Cambridge PDF read 2026-10-19. Inherited extraction source-issue register (for E1–E17); checked against the cited locations. Web search 2026-10-19 for the exact Gan–Savin title plus correction/erratum; no primary correction identified.

### E22 — confirmed (error)

Source: [HKT] arXiv:1909.05933v3, proof of Lemma 4.6, PDF p. 21 (finding scoped to this preprint proof).

Finding as proposed: The proof describes the stabilizer of every nonzero complex spinor as a conjugate of G₂.

Correction or disposition: Use a nonisotropic invariant spinor. Complete reducibility makes the fixed subspace nondegenerate, so a nonzero fixed subspace contains such a vector.

Check: Nonzero isotropic spinors also exist in the complex spin representation and have a different stabilizer; they cannot be moved to a nonisotropic G₂-fixed spinor by Spin₇. Semisimplicity repairs this step without changing Lemma 4.6. Reach: the proof.

Independent review: The spin quadratic form separates isotropic and nonisotropic nonzero orbits. The invariant summand of a completely reducible orthogonal representation is nondegenerate, supplying the missing nonisotropic choice.

Correction search: No correction identified in the bounded check of the version read; no claim is made about the later published proof. Searched: The specified arXiv v3 proof, pp. 21–22. Web search for the HKT title, Lemma 4.6 and spinor correction on 2026-10-19; no primary correction identified.

### E23 — confirmed (misprint)

Source: [Shin] Author PDF of Automorphic Plancherel density theorem, proof of Theorem 5.8, p. 27 (journal p. 109).

Finding as proposed: The density proof refers to item 4.12 as a proposition.

Correction or disposition: Item 4.12 is Corollary 4.12, author PDF p. 24 (journal p. 106).

Check: The numbered item on p. 24 is the density corollary used by the argument. The packet inherited this incorrect type label and now corrects it. Reach: nothing.

Independent review: The cross-reference number is correct but its type differs from the item heading on author PDF p. 24.

Correction search: No separate correction identified in the bounded check of the author copy. Searched: Author PDF, Corollary 4.12 and the proof of Theorem 5.8.

## Sources

**[GS]** Wee Teck Gan and Gordan Savin. *The local Langlands conjecture for G₂*. Forum of Mathematics, Pi 11 (2023), e28, pp. 1–42. [Version read](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf), accessed 2026-10-19. Read: Main Theorem, pp. 3–4; §§2–9, pp. 7–27; Appendices A–C, pp. 27–40. SHA-256: `6fc3979d78510fb094e50de9bdd162dfaad43f51fe9b6b8a82ab3d84e0c93389`.

**[C]** Gaëtan Chenevier. *Subgroups of Spin(7) or SO(7) with each element conjugate to some element of G₂ and applications to automorphic forms*. Documenta Mathematica 24 (2019), 95–161. [Version read](https://ems.press/content/serial-article-files/26455), accessed 2026-10-19. Read: Theorem E, p. 100; §§6.1–6.4, pp. 146–150; Theorem 6.4, p. 148. SHA-256: `f21a45314ba0331c1217e3094a5929158a8e3e04bc2bc02bff36811ac9aa7d40`.

**[KS]** Arno Kret and Sug Woo Shin. *Galois representations for general symplectic groups*. JEMS 25 (2023), 75–152; online-first PDF numbered 1–78. [Version read](https://ems.press/content/serial-article-files/32783), accessed 2026-10-19. Read: Theorem A and hypotheses (St), (L-coh), PDF pp. 2–4 (journal pp. 76–78); Introduction: spin regularity and comparison requirements; §13, Proposition 13.1 and proof, PDF pp. 60–61 (journal pp. 134–135). SHA-256: `9cf72b144415e3e7f13e98454912855ea9edaae41c555f25b36c5ecfe435198a`.

**[GF]** Wee Teck Gan and Gordan Savin. *A theory of γ-factors for G₂ × GL_r*. arXiv:2308.12561v1, 24 August 2023. [Version read](https://arxiv.org/pdf/2308.12561v1), accessed 2026-10-19. Read: §§1–2.8, pp. 1–8; Definition 2.1, Proposition 2.3, Theorem 2.4. SHA-256: `ec559120d876d503184363a53bbe9d45f25f22e44d065391f2c022493bfbb4ab`.

**[CG]** Gaëtan Chenevier and Wee Teck Gan. *Spin(7) is unacceptable*. arXiv:2303.15897v1, 28 March 2023; later published Peking Math. J. 8 (2025), 601–639. [Version read](https://arxiv.org/pdf/2303.15897v1), accessed 2026-10-19. Read: Introduction; Lemma 3.10 and Proposition 3.12, PDF pp. 9–11; §4, Example 1 and Corollary 4.8, PDF pp. 13–14. SHA-256: `46a8d2b2e3ed070211aa2e7061cf67ce65976fd1a0f6f94ebee86e58aaafd25e`.

**[HKT]** Michael Harris, Chandrashekhar Khare and Jack Thorne. *A local Langlands parameterization for generic supercuspidal representations of p-adic G₂*. arXiv:1909.05933v3, 12 April 2021; published Ann. Sci. ENS 56 (2023), 257–286. [Version read](https://arxiv.org/pdf/1909.05933v3), accessed 2026-10-19. Read: Lemma 4.6 and proof, PDF pp. 21–22. SHA-256: `07b08d6673e3011222c1994034ee34806bf581cc2a63c889277b1dc1a65695a3`.

**[Shin]** Sug Woo Shin. *Automorphic Plancherel density theorem*. Israel Journal of Mathematics 192 (2012), 83–120; author PDF numbered 1–38. [Version read](https://math.berkeley.edu/~swshin/Plancherel.pdf), accessed 2026-10-19. Read: §5.2, Theorems 5.7 and 5.8 with standing assumptions, PDF pp. 26–28; Definition 3.5, author PDF p. 14; Theorem 4.11 and Corollary 4.12, author PDF pp. 22–24. SHA-256: `8a3499195c946f8e22cb6bf8c45641cb0a3d0e6891a5536075866c0bab791ab1`.

**[HD]** Wee Teck Gan and Gordan Savin. *Howe duality and dichotomy for exceptional theta correspondences*. arXiv:2102.00372v1, 31 January 2021; published Inventiones Mathematicae 232 (2023), 1–78. [Version read](https://arxiv.org/pdf/2102.00372v1), accessed 2026-10-19. Read: Theorems 8.2 and 8.5, PDF pp. 25–29; Theorems 15.1–15.3, PDF pp. 52–53; §13.3, Lemma 13.4, PDF p. 42; §13.5, Lemma 13.8, PDF p. 47. SHA-256: `8b3b6702909a6a936e5984f46a3c2fbfe629b63db4ba0ae9bd4356286508c6e5`.

## Suggested Lean scope

The suggested file uses existing complex units, finite diagonal matrices and characteristic polynomials for LG.0/a2-weight-model. Its four light definitions have real bodies. It states determinant, spin characteristic-polynomial, factorization, degree and monicity milestones, and includes identity, sign and distinct reciprocal-weight examples. The other targets require parameter, smooth-representation, automorphic or group-comparison carriers absent at the formal baseline. Their exact statements, hypotheses, APIs and Checks remain targets in this document. No assumed correspondence or data-valued placeholder stands for them.
