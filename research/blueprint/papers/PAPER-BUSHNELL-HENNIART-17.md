# Bushnell–Henniart: extraction and routing after independent review

**Partial extraction; independent verdict: revise.** Codex, session `codex-7e92bd`, reviewed [issue 1154](https://github.com/CBirkbeck/tauceti-explorer/issues/1154) on 23 September 2026. This report and the current JSON supersede the previous completion claim; the prior worker and completion records remain attributed in the JSON. See the [full independent review](../reviews/REV-PAPER-BUSHNELL-HENNIART-17.md) for per-item, declaration and source-finding evidence.

The [published paper](https://annals.math.princeton.edu/2017/185-3/p05), Annals 185 (2017), pp. 919–955, was read in full. It compares endo-classes of simple characters of GL_n(F) with Weil orbits of wild-inertia representations under the classical complex local Langlands correspondence. F is any nonarchimedean local field with finite residue field; Weil extensions are separable, whereas parameter fields on the simple-character side may be inseparable.

There are 151 items: **8 library, 9 planned, 134 missing**. Every missing item occurs in exactly one route. The independent review confirms all 17 source findings with bounded claims, accepts routes 3–5, and rejects routes 1, 2, 6 until their named obligations are resolved. The prior claim of completion merely changed unresolved gaps to “deferred” or “recorded”; all G1–G9 are open again. Nothing is claimed formalized and no Lean file was compiled.

## Mathematical contracts

Write R_F(x) for upper ramification and R_F^+(x) for the closed right-limit group. The Weil-orbit ultrametric obeys Δ<ε precisely for agreement on R_F(ε), and Δ≤ε for agreement on R_F^+(ε). Total wildness means irreducibility of the wild restriction, including multiplicity one. The decomposition function Σ is a normalized finite weighted sum of max(x,slope); it can have a positive initial value.

The GL-side distance A is the first normalized intertwining level. Real truncation uses t=ceil(e_a ε)−1, with its strict lower endpoint. Approximation fields define partial affine pieces c/d²+x/d. Prove their adjacent limits agree before constructing the continuous structure function Φ; it maps [0,∞) onto [Φ(0),∞), not generally onto [0,∞). The comparison of pair conductors proves Σ_LΘ(0)=Φ_Θ(0), so Ψ_Θ=Φ_Θ^−1∘Σ_LΘ is defined at every nonnegative x.

The higher-ramification theorem is Δ(LΘ,LΥ)<ε iff A(Θ,Υ)<Ψ_Θ(ε), with the corresponding non-strict equivalence. The function Ψ is continuous, strictly increasing, finitely piecewise affine and equal to identity beyond m_Θ; it need not be convex. General tame lifting satisfies Ψ_ΘK(x)=eΨ_Θ(x/e). Separate Φ and Σ scaling formulas require total wildness. In the totally wild case interpolation samples A_K(Θ_K,χΘ_K)=eΨ_Θ(sw(χ)/e) away from the finite set of Σ′ breaks. Density of these samples proves uniqueness. Rational Weil realization and Δ-density come after the LLC comparison, avoiding circular proof order.

The first decomposition break of an absolutely wild representation is the least positive Swan exponent of a self-twist; the general totally wild formula divides the corresponding value over its imprimitivity field by the tame index. In degree p with Swan m prime to p, the one-break value is m/(p+1). The wild-image assertion uses the authors’ cyclic-centre Heisenberg convention from BH96 §13, with no automatic centre-of-order-p claim. The final tensor examples remain conditional on their representation-theoretic suppliers and suitable determinant cube classes; μ3 alone fails over residue F4.

## Existing mathematics and corrected interfaces

The pinned Clifford restriction, orbit, multiplicity and dimension results are retained. The local-field principal-unit filtration and both graded quotients are already in Tau Ceti and are now credited directly. Hereditary-order units are a separate construction. The finite-group degree-divisibility theorem, together with the p-group cardinality and divisor-of-prime-power facts, supplies the numerical p-power dimension argument. Length additivity and the relative-index tower law remain existing imports, with finite-length and finite-index prerequisites before numerical division.

The source routes reuse SR.0/SR.2 for closed-profinite-subgroup occurrence, AL.0/AL.1/AL.3 for local Haar lattice comparison and local factors, and ET.6 for characteristic-zero LLC. ET.6 also owns mixed-characteristic GL_m type/segment theory; the pending types Part II imports that foundation and adds the endo-class theory and a separately proved equal-characteristic extension. ES7:equal-characteristic remains the correct owner for its classical realization, but its complex coefficient and pair-epsilon dictionary is open. Compact-open invariants are finite-dimensional under admissibility; compact restrictions of infinite-dimensional cuspidal representations are not asserted finite-dimensional.

## Routes and design instructions

### Route 1: Arithmetic Galois representations, Part II: complex Weil representations and ramification profiles — reject

The complex profile direction is useful, but G1/G2/G8 leave finite-image, conductor and projective-lifting interfaces unclosed. Reuse R01.3 generic conductor arguments and the pinned finite-group imports; a coefficient change does not justify duplicating them.

Extend Arithmetic Galois representations (ArithmeticGaloisRepresentations) with a complex smooth Weil-representation branch over every nonarchimedean local field with finite residue field, in either characteristic. Reuse the existing local field, upper ramification and Weil-group carriers from Local fields and ramification (tauceti:TauCetiRoadmap/LocalFieldsRamification) and Class field theory (tauceti:TauCetiRoadmap/ClassFieldTheory); import full equal-characteristic reciprocity from Function-field arithmetic (FunctionFieldArithmetic:FA.4). Reuse the pinned Clifford declarations and the existing finite induction/Clifford correspondence rather than rebuilding them. Import the smooth category and induction from Smooth representations of local groups (SmoothRepresentationsOfLocalGroups:SR.0,SR.2). The parent R01.1–R01.3 uses finite Q_l or finite-field coefficients: construct the complex finite-inertia specialization and comparison explicitly, not by renaming its carrier. Build finite-image reduction up to unramified twist, constituent orbits, Δ with strict R and weak R+ endpoints, finite-sum Swan calculus, Σ with its weighted-max formula, normalized Hom identities, conductor-of-a-pair formula, and tail agreement. Prove tame scaling for totally wild representations only. Then build self-twist groups, centric and imprimitivity fields, the derivative-jump criterion and the first-break theorem: for absolutely wild σ of dimension p^r>1, the first break a is min sw(χ) over nontrivial Weil self-twists and is integral; for general totally wild σ divide the corresponding minimum over its imprimitivity field by its tame ramification index. Retain the exact finite p-group and character-extension suppliers listed in G8. Do not identify a singleton constituent orbit with an irreducible restriction. Export the independent Weil profile branch before importing any LLC application; the density and uniqueness results needing LLC are owned by the types branch. Suggested modules are TauCeti/NumberTheory/Local/WeilRepresentation/{Smooth,Conductor,RamificationDistance,DecompositionFunction,SelfTwists,FirstBreak}.lean. Mandatory examples include a tame two-dimensional representation with trivial wild action, an exact break for C2, nonzero Σ(0), and tame rescaling. Every definition receives the item-level API and tests below; all implementation claims remain unchecked. Reuse R01.3’s generic finite-quotient conductor arguments through an explicit complex comparison; only the coefficient transport and new profile/self-twist statements belong here. Import the pinned finite-group degree-divisibility result for the p-power dimension consequence.

### Route 2: Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations — reject

The endo-class metrics and interpolation extension is justified, but BK recursion, normalized corestriction, profile gluing, corrected perturbation, conductor formula and example suppliers remain G3–G6/G9. The current Fintzen brief also assigns mixed-characteristic GL_m type theory to ET.6. The corrected brief imports that owner.

Reuse the already proposed SmoothRepresentationsPartII candidate from PAPER-FINTZEN-21: Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations. Add a separately scoped Bushnell–Kutzko GL_n simple-character and endo-class branch valid in every residue characteristic and for local fields of either characteristic; do not silently apply Fintzen’s p not dividing the Weyl-group-order hypothesis to this branch, or remove it from her theorem. The final targets are BH17 §6.4: for Θ, ε>0 and δ=Ψ_Θ(ε), Δ(LΘ,LΥ)<ε iff A(Θ,Υ)<δ, and the corresponding equivalence with ≤; and §7.5: for totally wild Θ there is a finite exceptional set D such that A_K(Θ_K,χΘ_K)=e Ψ_Θ(sw(χ)/e) for every tame K/F of index e and χ outside D, and these values uniquely determine Ψ among continuous increasing finite piecewise-affine functions. Include the canonical truncated-class/ramification-pair classification, general tame law Ψ_{Θ_K}(x)=eΨ_Θ(x/e), and Ψ=id iff Θ is essentially tame. Build hereditary orders, exact simple strata and critical exponents, BK simple-character recursion, transfer, potential simple characters and endo-equivalence; descend the degree/level invariants and approximation jumps; construct the normalized corestriction-volume exponent, piecewise parameter fields and continuous structure function Φ; then A, real-index truncation, the corrected interior-depth perturbation and density. Prove the explicit GL pair-conductor formula and first ramification bijection from their actual suppliers, including the previously acknowledged gap repair. Import general categories, Hecke and induction from the parent SR.0–SR.3; import classical characteristic-zero LLC from Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison:ET.6), the equal-characteristic classical realization from Excursion operators and spectral action (ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic), complex Rankin–Selberg factors from Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors:AL.1–AL.3), and local fields/reciprocity from their existing owners. Import Δ, Σ, Swan calculus and self-twist results from ArithmeticGaloisRepresentationsPartIIRamificationProfiles. Prove the initial-value equality before defining Φ inverse on its actual range, and place rational Weil realization and Δ-density after the comparison to avoid circularity. The final examples are conditional on the unverified epipelagic and conductor-divisibility inputs and on sufficient determinant cube classes; μ3 alone does not ensure those choices over residue F4. Separate the extra-special-image claim until its scalar normalization is checked. Suggested modules are TauCeti/RepresentationTheory/Local/GeneralLinear/{SimpleStrata,SimpleCharacters,EndoClass,StructureFunction,EndoDistance,HigherRamification,Interpolation}.lean. Acceptance tests include the period-1/period-2 scaling, the Q2 top-depth obstruction, scalar cancellation in an unramified quadratic parameter, the degree-one identity, and both exact piecewise-affine examples. No new generic types roadmap or duplicate general LLC construction is proposed. Import the AL.0 local lattice-volume and exact-complex comparison helpers, retaining fixed maps and finite positive measures. The minimal exponent arithmetic is expanded independently, but the BK93 integral exactness and adjacent-profile transition remain supplier gates; do not promote G4 to closed. Ownership correction from the current Fintzen review: ET.6 already owns mixed-characteristic GL_m supercuspidal/type and segment theory, with no prime-to-n restriction. Import its common BK objects and classification. This branch adds endo-equivalence, metric/profile theory and the separately proved equal-characteristic extension of those shared constructions; it must not create a second mixed-characteristic GL_m classification. Build partial affine pieces, prove adjacent gluing, then construct Φ. Interpret the finite wild-image assertion with the BH96 cyclic-centre convention, not an unproved centre-of-order-p condition.

### Route 3: SmoothRepresentationsOfLocalGroups — accept

The explicit finite-quotient occurrence argument is a scoped application of SR.0 smooth carriers and SR.2 closed-subgroup induction/Frobenius reciprocity. It avoids the acknowledged compact-induction error and does not claim the arbitrary Weil finite-dimensionality adapter complete.

The finite-quotient proof of occurrence is an instance of smooth restriction/induction and Frobenius reciprocity within the existing category and induction layers.

### Route 4: AutomorphicLFunctionsAndLocalFactors — accept

AL.0 owns the compact-open local Haar lattice comparison; AL.1/AL.3 own character conductors and pair factors. The fixed-map lattice proof, common exact uniformizer refinement and signed dilation are mathematically sound and explicitly separate from the unresolved BK-normalization/gluing application.

Character conductor realization, Rankin–Selberg exponent conventions and the pair Swan correction belong to the existing local-factor layers; they should be exported for the types application. AL.0 owns the local additive Haar-measure adapters: compact-open lattice index, exact-complex alternating volume, and scalar dilation. They consume the existing local-field/DVR carrier and generic length/index theorems. They are not adelic quotient volumes (AA.0) or discrete real covolumes (GN.0); the BK-normalized corestriction and its application remain in the types Part II.

### Route 5: EndoscopicTransferAndUnitaryTraceComparison — accept

ET.6 explicitly owns the independent mixed-characteristic classical GL_m correspondence and local-factor normalization. This source route imports that planned contract; it neither replaces it with a semisimple parameter nor extends its field hypothesis.

The paper consumes the classical characteristic-zero LLC already planned here, with dimension, dual, twist and epsilon normalization; it does not supply a new proof of that correspondence.

### Route 6: ExcursionOperatorsAndSpectralAction — reject

ES7:equal-characteristic is the right supplier direction, but its three-action realization still needs the exact complex coefficient dictionary and epsilon-of-pairs normalization required here. G7 remains an unresolved contract, not a consequence of semisimple FS agreement.

The existing equal-characteristic classical realization owns this comparison. The exact complex coefficient and pair-epsilon interface is an open request within its scope, not a consequence of semisimple parameter agreement alone.

## Open proof obligations

### G1: Finite-quotient and smooth-category adapters

Finish the finite-image comparison W_F→G_F, the finite induction/Frobenius occurrence construction on the actual smooth carriers, and extension of finite abelian characters to C×. The relative mathematical arguments are supplied; exact pinned declarations and transport lemmas remain to be enumerated. Include finite-dimensionality of arbitrary irreducible smooth W_F-representations before identifying the finite-dimensional carrier with the paper’s full set.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G2: Complex conductor calculus

Construct the complex finite-inertia Swan conductor, quotient independence, the upper step-sum identity, tame scaling and the induction formula. R01.3 plans ℓ-adic conductors; that is not automatically a declaration at these coefficient/topology conventions.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G3: Recursive simple-character suppliers

Acquire and read BK93 Chapters 1–3 and the exact transfer/intertwining/approximation proofs. BH96 §§1,7–9 were read selectively, and their statements are recorded; the transitive proof chain, simple-stratum carrier, H-recursion and conjugacy invariance remain open.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G4: Volume transition and gluing Φ

The fixed-map lattice-choice independence and all minimal-parameter dilation arithmetic now have explicit independent proofs via common uniformizer refinement, finite quotient lengths and coset measure. Still acquire BK93 (1.4.15), BHK98 §6.4 and BH03 §3.1 to verify the normalized corestriction, its allowed choices, minimal integral exactness, and adjacent-profile intercept transition, including inseparable parameter fields. Publisher/public-copy attempts in this continuation did not yield the prerequisite texts. AL.0 proof-to-library adapters remain to be elaborated.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G5: Perturbation and scalar twisting

Read BK94 Simple types §2.8 and Admissible dual of SL(N) II appendix. Prove the k<m perturbation variant, the translated H-group and simple-character identity with the actual level −v_a(β+c), and the terminating scalar-level reduction. The two printed statements are not safe as black boxes.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G6: Cuspidal realization, conductor formula and first ramification

Read BH13 intertwining, BHK98 §6.5/§6.15, BH03 §8.2 with its acknowledged repair, and the complete proof chain of BH14 §6.1–6.3. Pin the rank-deg Θ cuspidal realization and tame parameter theorem. The BH17 restatements are fully extracted, but do not close these proofs.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G7: Equal-characteristic and coefficient normalization

Use FA.4 for full local reciprocity in characteristic p and ES7:equal-characteristic for its classical realization. Identify the exact complex/ℓ-adic coefficient comparison and pair-epsilon compatibility; do not infer them from semisimple excursion agreement. ET.6 supplies only F/Q_p.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G8: Finite p-group and projective lifting interfaces

The cyclic restriction and relative index-p induction arguments are explicit. Still audit their finite group suppliers, finite-image/irreducibility transport for the now credited degree-divisibility theorem, projective-to-linear scalar twist making an absolutely wild representation finite p-group-valued, and the complete BH14 §1.3 extension interface. No unexamined projective obstruction is assumed away.

Unresolved. The named supplier must be read and its precise statement or proof-to-library adapter supplied; a citation alone does not establish it.

### G9: Degree-p classification and the final examples

Acquire Mœglin 1990 for the cyclic inducing field, uniqueness and the extra-special-image assertion; acquire BH14 epipelagic §§5.1–5.2 and BH01 conductor divisibility for tensor irreducibility. Use the cyclic-centre convention verified in BH96 §13 and finish the finite-group application and check the determinant-class existence hypotheses. The affine computations are conditional and are not existence proofs.

Open cyclic-induction uniqueness and epipelagic tensor suppliers. BH96 §13 p.190 resolves the terminology: scalar twists are not a counterexample to the broader cyclic-centre assertion. No new source mistake is registered on that basis.

## Independently checked source issues

| Finding | Locator | Effect | Verdict and evidence |
| --- | --- | --- | --- |
| E1 | BH17 §2.5 Proposition (1) proof, p.929 | the proof | confirmed: The positive finite upper groups begin with wild inertia, not the whole chosen Galois group. An unramified factor already disproves the printed equality; the separation proof only needs the wild orbit images. |
| E2 | BH17 §2.5 Proposition (2) proof, p.929 | the proof | confirmed: At a positive break a a nontrivial break character has no R_F(a)-invariants but is trivial on R_F^+(a). Thus the printed non-plus Hom criterion uses strict <, as the proposition’s endpoint assertions require. |
| E3 | BH17 §4.3 Remark, p.934 | nothing | confirmed: The displayed page image has e_a/e_a′. BH96 (1.4), printed p.112, scales the critical exponent by the relative period. For scalar π^−1 periods 1 and 2 give jumps 1 and 2, forcing the reciprocal correction. |
| E4 | BH17 §4.6 proof, p.937 | nothing | confirmed: The page image has Φ′_Θ(x) after defining φ(x)=eΦ_Θ(x/e). The chain rule gives Φ′_Θ(x/e), equal to Φ′_{Θ_K}(x) by the preceding degree comparison. The intended scaling theorem survives. |
| E5 | BH17 §5.3 auxiliary Lemma, p.939 | a stated result | confirmed: BH96 p.145 gives the minimal-character clause. For GL1(Q2), m=k=1, H1=U1 and every allowed θ is the same nontrivial character of U1/U2=C2. No second same-level character can fail to intertwine. Restricting to k<m removes this counterexample; the full corrected perturbation proof remains G5. |
| E6 | BH17 §7.2 explanatory equivalence, p.945 | nothing | confirmed: The tame quotient over Q2 admits S3=C3⋊C2 with Frobenius acting by inversion. Its irreducible standard representation has trivial wild action of dimension two, hence one constituent class with multiplicity two. This refutes the explanatory equivalence; subsequent results retain the correct irreducibility definition. |
| E7 | BH17 §7.4 Lemma, p.946 | a stated result | confirmed: BH96 p.112 supplies order level e_a k for a scalar of valuation −k. Over Q3 with E=Q3(i), i²=−1, β=1/9+i/3 and c=−1/9, the level drops from 2 to 1, while scalar translation leaves the commutator and k0=−1 unchanged. A Swan-2 character linearized by c exists by extending the nontrivial character on U2/U3 to O×/U3, then over 3^Z. Thus both the n/e_a issue and cancellation are real. Full translated-character compatibility remains G5. |
| E8 | BH17 §7.1 proof, p.945 | nothing | confirmed: The density lemma is visibly in §5.3, while §5.2 is the real-index truncation subsection. |
| E9 | BH17 §7.6 Proposition (2) proof, p.948 | nothing | confirmed: The page image reads v_F(α), although α is in E and the denominator is e(E/F)=p^s. The following sentence already uses v_E, confirming the intended normalized valuation. |
| E10 | BH17 §7.6 Proposition (2) proof, p.948 | the proof | confirmed: The inverse derivative is evaluated at Ψ(x), whereas δ1 bounds the input of Φ. Continuity at Ψ(m)=m gives a smaller valid radius, but the minimum of the two radii in different coordinates alone does not. This is a local proof repair. |
| E11 | BH17 §8.2 Lemma 2 proof, p.951 | nothing | confirmed: The immediately preceding §8.2 Lemma 1 proves the tame-self-twist kernel trivial; §8.1’s torsor lemma is a different result. BH14 pp.10–11 also gives the direct Schur argument. |
| E12 | BH17 §8.4 two-break paragraph, p.952 | a stated result | confirmed: The source’s absolutely wild hypothesis makes a integral. The Swan induction formula (BH epipelagic §1.3, arXiv p.4) for cyclic degree p, break a, gives m=sw_K χ+(p−1)a. The printed sw_K χ=a would force p\|m, contradicting §8.4. The corrected expression is conditional on the inducing extension’s break identification; the classification and uniqueness remain G9. |
| E13 | BH17 §8.5 existence assertions preceding Examples 1 and 2, p.953 | a stated result | confirmed: In the unramified quadratic extension of Q2, μ3 exists and the residue field is F4. Epipelagic §2.1 identifies a level-one degree-two parameter with a totally ramified quadratic generator, hence det α has valuation −1. All determinant ratios are units and all F4× cubes are 1; the required distinct cube classes cannot exist. No representation-existence conclusion is inferred from conditional affine computations. |
| E14 | BH14 §1.2 Proposition proof, p.10 of arXiv 1103.5316; correction acknowledged BH17 §2.1 p.927 | the proof | confirmed: BH14 arXiv p.10 was read afresh: it uses compact induction from P_F to assert occurrence. BH17 published p.927 explicitly replaces the incorrect proof with closed-profinite-subgroup occurrence. Confirmed only with this published repair, not as a newly discovered defect. |
| E15 | BH03 Local tame lifting IV, §8.2 Theorem; acknowledgement in BH17 §2.1 p.927 | the proof | confirmed: BH17 p.927 expressly acknowledges the older BH03 §8.2 gap and says Proposition 2 fills it. This confirms the acknowledgement and replacement input only. The full BH03 proof was not acquired, so no finer diagnosis is certified. |
| E16 | BH17 bibliography [2], p.954 | nothing | confirmed: The p.954 image prints the book DOI. Numdam’s authoritative BH96 record supplies 10.1007/BF02698646; the Princeton/De Gruyter record identifies 9781400882496 as The Admissible Dual of GL(N) via Compact Open Subgroups. |
| E17 | BH17 §4.5 proof, p.936 | nothing | confirmed: The p.936 image omits the opening square bracket in the second field degree. Both sides compare [F[γ_i]:F], so this is a typographic correction only. |

## Checks and continuation

The paper checker and the structural audit pass; the full independent review records 2709 passing exact diagnostics and their executable script. The declared library statements and their file hashes were verified at the two pins. No Lean compilation was performed. Resume the extraction at G3/G4/G5/G6 with the exact BK/BH prerequisite texts; retain the corrected construction order and all existing imports. Close G1/G2/G8 on their actual carriers, then G7’s equal-characteristic normalization and G9’s classification/tensor inputs. Relabelling a supplier as deferred does not complete it.
