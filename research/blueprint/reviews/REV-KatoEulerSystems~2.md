# Independent review: REV-KatoEulerSystems~2

**Accepted after corrections.** This is a complete target-level planning pass for KatoEulerSystems L0–L4, with five planned stages and no closed stage. All forty nodes are verified or corrected and justified at that planning granularity. The fourteen named proof gaps and thirty-one supplier requests remain open. Acceptance does not certify arithmetic existence, proof closure, execution of the geometric tests, or a completed formalization.

Reviewer: Codex, session `codex-cRvQsI`, 8 October 2026. Refs #7071. This session did none of BP-KatoEulerSystems or BP-KatoEulerSystems~2. The preceding [review](REV-KatoEulerSystems.md), the revision [handoff](../handoff/BP-KatoEulerSystems~2.md), all three deliverables and the binding protocols were read. The previous report is preserved; the packet now carries this review’s independent verdict.

## Counts

| Item | Reviewed result |
| --- | ---: |
| Nodes | 40: 11 constructions, 6 lemmas, 17 theorems, 6 comparisons |
| Dispositions | 29 verified, 11 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 17 confirmed; none removed or replaced |
| API items / construction tests | 60 / 41 |
| Planets | 23; each layer stays within six |
| Gaps / requested exports | 14 / 31, increased from 12 / 29 |
| Source findings | 12 confirmed; E11–E12 added to the ten inherited findings |
| Stages | 5 planned, 0 closed |
| Implementation status | Every node remains unchecked |

No node, API, construction test or planet was added or deleted. Eleven nodes were corrected. Two exact supplier gaps and requests were added. The declaration-source confirmations were renewed for all seventeen baseline entries. Source metadata now also identifies the public Ribet article used to check the image attribution.

## Corrections in this review

1. **Ordered Chern test and smoothing denominators.** The Beilinson test now names ch_(2,2), equivalently −c_(2,2), for the positive ordered Kummer cup, matching the existing Chern normalization node. Inverting the two diamond smoothing operators requires |c|,|d|>1. For diamond orders h_c,h_d the explicit nonzero denominator is (c^(2h_c)−1)(d^(2h_d)−1); a finite geometric series gives the inverse. Values ±1 are not invertible auxiliary operators. The defining symbol and its identity retain their original domain.
2. **Two distinct intertwining scalars.** Kato Lemma 8.8, p.185, gives n^(r−1) for T′(n). Setting a=b=n in the diamond relation gives n^(k−2−2r), not the same operator. At r′=k−1 the b monomial exponent is zero but the determinant contribution (ab)^(−r) persists. The acceptance checks now distinguish both facts.
3. **Rubin draft locator.** The public AWS Euler-factor-change lemma is IX.6.1, pp.141–143; IX.1.1 is an example there. Definition II.1.1 is on pp.21–22. The ES.2 adapter remains imported and its preserving-unramified-components property remains required. No claim is made about the numbering of the unread published book.
4. **Integral freeness in 13.14.** Integral zeta membership needs 12.4(3), p.221, not rational 12.4(2). The cohomological inequality node now directly depends on the Iwasawa-structure node and names the odd-prime residual-irreducibility argument, which full SL₂ image supplies. Its source explanation separates this reference slip, E11, from the rational display in 12.5(4), E8.
5. **Local quaternion image boundary.** The large-image node now proves the unipotent argument under an imported open SL₂ premise, checked on the split local quaternion branch. Ribet §3, pp.190–192, states quaternion-valued openness; a division algebra contains no nonzero nilpotent, so that citation cannot by itself give the unipotent claimed at every place in Kato 12.8.2. R19.3 is requested for the split/cyclotomic dictionary, the almost-all-place integral statement, and the remaining alternative rational input. E12 records a gap in the deduction, without a specific counterexample to the all-prime cohomological theorem. The ES.8, cohomological-divisibility and module-structure nodes now state this remaining proof dependency. The original all-prime cohomological targets are retained as conditional proof targets.
6. **Parabolic inverse-limit comparison.** Nakamura Lemma 3.4, p.221, requires global conductor Iwasawa torsion-freeness for every twist and injectivity of the twist-one inverse-limit localization/dual exponential on X(N),j_*V_k. Neither the R07 cohomology constructor nor generic R09 local exp* gives that theorem. An exact R07 L3 request and gap now serve the full-level characterization and downstream twist-one morphism. The uniqueness prototype remains conditional on injectivity and never claims this result on the open curve.
7. **Elliptic image inputs.** The R19.3 request separately specifies Serre’s every-p open GL₂ image, almost-all-p surjectivity and finite cyclotomic torsion for non-CM E/Q. The Mordell–Weil and final p-part nodes now directly name that owner, rather than silently substituting a general modular image statement.
8. **Positive fixed parametrization factor.** The ordinary/multiplicative elliptic signature now requires 0<r_E, as its local-period predecessor already does. Coleman image, rational p-power error, integral stronger bound and split augmentation remain conclusions.
9. **Source-record precision and synchronization.** E7 also records the repeated integral-dual claim in Nakamura §3.1.5, pp.215–216 and Remark 3.3 p.218. E10 includes Appendix A’s morphism reference 12.4→12.5(1), pp.266–267. E1 now gives p.141 for its second occurrence. All source findings have this reviewer’s own reasons; the source-version dates distinguish this run’s checks. The reader and suggested comments now match the current review, source findings and proof limits.

## The seventeen preceding signature objections

Each previously unverifiable node was checked against the actual revised type, not just the revision handoff. Unexpressible arithmetic hypotheses remain documented omissions as permitted by PROTOCOL §13; expressible conclusions now occur in the proposed types. The following repairs discharge the preceding review’s reasons for rejection.

| Suggested declaration | Required conclusion now present |
| --- | --- |
| `siegelGaloisDistribution` | Actual GL₂ action on indices, determinant root action and distribution identity. |
| `siegelDegeneracyProduct` | One-sided degeneracy norm relation with α unchanged and β rescaled. |
| `k2NormProjection` | Transfer of the level-indexed K₂ family and projection formula. |
| `k2AuxiliaryEulerFactor` | Transfer between levels equals the Hecke/diamond Euler factor, including ℓ. |
| `cyclotomicLimitIntegral` | Integral lifting and injectivity with coherent Q/Z-valued duality. |
| `integralZetaFiniteIndex` | Actual submodule inclusion and finiteness of its quotient. |
| `generalizedExplicitReciprocity` | Exp* of the localized zeta class equals the Eisenstein expression in all three p cases. |
| `beilinsonArchimedeanRegulator` | Z(0)=0 and the derivative/regulator equation with 2πi. |
| `nonCmLargeImage` | A nontrivial image unipotent, rational rank-one quotient and irreducibility; the integral companion requires the stronger full-image package. The nonsplit source attribution is now a separate gap. |
| `siegelAnalyticProduct` | Fixed exponential branch, both infinite products, algebraic smoothing and cusp-width order B₂/2. |
| `chernSymbolNormalization` | −c_(2,2) and ch_(2,2) compared to the actual ordered cup. |
| `heckeDualTwistDictionary` | Literal dual coefficients, rational transport, Hecke operators and central ℓ^(k−2), distinct from ℓ^(2(k−2)). |
| `rationalIwasawaStructure` | Integral H² torsion/H¹ torsion-freeness, rational H² torsion/H¹ rank-one freeness, and odd residual-irreducible integral freeness. No rational basis is assumed as a substitute for the conclusion. |
| `ellipticLocalLattice` | Actual log annihilator at two, odd-prime singular image, fixed positive r_E and ordinary/twisted period equations. |
| `ellipticCyclotomicFiniteGeneration` | Uniform finite-layer descent and finite generation from stabilized action, finite fixed torsion and pointwise continuity. |
| `ellipticOrdinaryMultiplicativeDivisibility` | Coleman value, finite torsion Selmer dual, fractional p^t bound and separate integral bound with split augmentation. |
| `ellipticNoFiniteSubmodule` | Typed local torsion, weak-Leopoldt and norm-freeness inputs imply absence of finite submodules; the conclusion is not assumed as a criterion. |

In the finite-generation argument, bounded rank and finite torsion are supplemented by uniform descent: after fixing the torsion and the rational span, σP−P is a homomorphism into the same finite fixed torsion group. Its exponent kills all such homomorphisms on one common finite-index subgroup. This places every point in one finite layer before applying Mordell–Weil. The repaired proposed type reflects that step.

## Baseline and ownership

All seventeen declaration statements were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The recorded Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; no packet baseline declaration claims an arithmetic Tau Ceti theorem. The exact declaration sources and their limits follow.

| Baseline declaration | Confirmed statement and limit |
| --- | --- |
| [mathlib:PowerSeries](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean) | MvPowerSeries Unit R; formal coefficients only, without convergence or fractional q powers. |
| [mathlib:UpperHalfPlane](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean) | Complex point with positive imaginary part; the analytic domain only. |
| [mathlib:ModularForm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Slash invariant, differentiable, bounded at cusps; no scheme or eigenform/Galois comparison. |
| [mathlib:CuspForm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) | Slash invariant, differentiable, zero at cusps; no newform realization. |
| [mathlib:Units](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Units/Defs.lean) | Value and inverse satisfy both inverse laws; correct carrier for coordinate-ring units. |
| [mathlib:AlgebraicGeometry.Scheme](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean) | Locally ringed space locally isomorphic to spectra; modular moduli and maps are further suppliers. |
| [mathlib:PadicInt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | Q_p subtype of norm ≤1, with the prime-p assumptions; correct coefficient ring. |
| [mathlib:DirichletCharacter](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean) | MulChar on ZMod n; primitive conductors and period embeddings are additional data. |
| [mathlib:LSeries](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Basic.lean) | Total tsum of Dirichlet terms; no analytic continuation theorem. |
| [mathlib:LinearMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean) | Bundled additive semilinear map; identity coefficient homomorphism specializes to linear maps. |
| [mathlib:Submodule](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean) | Additive submonoid stable under scalars; correct for filtration/image/zeta submodules. |
| [mathlib:Submodule.span](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean) | Intersection of submodules containing the set; correct generated-span construction. |
| [mathlib:Module.Dual](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean) | Literal M→ₗ[R]R; no integral symmetric-power self-duality. |
| [mathlib:Module.IsTorsion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Basic.lean) | Each element is killed by a regular non-zero-divisor; no domain assumption is inserted. |
| [mathlib:Module.IsTorsionFree](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Free.lean) | Regular scalar multiplication is injective; applies to the semilocal cyclotomic context. |
| [mathlib:Module.Finite](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean) | Top submodule is finitely generated; over Z this is finite generation of the group. |
| [mathlib:Matrix.GeneralLinearGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | Units of the matrix ring, with determinant over a commutative coefficient ring; actual two-index action. |

None was removed, replaced or promoted beyond this scope. The reviewed library-coverage audit was read for all five Kato stages. Generic scheme K-theory, symbols, Chern maps, Euler-system carriers and bounds, Iwasawa algebras, Selmer duality, periods and regulators stay with their existing owners. The nearby upstream HodgeStructures and RepresentationTheory/InductionRestriction documents were read in full for the roadmap density and conventions; the referenced ModularCurves, ModularForms and EllipticCurves anchors were checked directly.

The original 52 foreign fine-node statements, all 16 referenced foreign stage descriptions and nine upstream anchors were checked. The newly used R19.3 large-image fine node was read as well, with its primary Ribet source. Exact-stage requests record additional generality instead of assuming it from a title. ES.2 supplies the carrier/conductor adapter, ES.4 the finite bound and ES.8 the Iwasawa bounds. These are imported directly, not through a cyclotomic-unit application.

Proof dependencies are acyclic at node level. The geometric classes and analytic nonvanishing precede rational Iwasawa structure and the canonical map. The early CM supplier must precede that map and cannot prove itself from an equality containing the map. The critical-family comparison retains its compatibility premise; PadicFamilies L4 consumes Kato and is not installed as an upstream constructor. All five stage targets are realized and their remaining lists retain precise requests/gaps. No stage meets the stronger definition of closed.

## Seven assigned red-team findings

| Finding | Independent confirmation in all deliverables |
| --- | --- |
| RT-AREA-iwasawa-1/36 | Direct ES.2/ES.4/ES.8 imports replace the cyclotomic-unit route. Two inherited atlas edges still need the maintainer’s out-of-scope repair. |
| RT-AREA-iwasawa-3/2 | T_pE=H_p(1), so the moment twist is 2−r+(k−2)=k−r; weights 2 and 4 discriminate the wrong orientation. |
| RT-AREA-iwasawa-3/3 | ℓ^(−r), p^(−r), k−1−2r and good/bad/repeated-prime cases are retained without renormalizing T′. |
| RT-AREA-iwasawa-3/4 | The identified objects are filtration steps; equal interior steps have zero associated graded quotient and i≥k gives zero. |
| RT-AREA-iwasawa-3/5 | Global twist precedes specialization, loc_p and exp*, with negative κ exponent in the semilinear action. |
| RT-AREA-iwasawa-3/6 | The residue object is H¹ dualized with Q/Z coefficients, and inverse corestriction is dual to direct restriction; the away-from-p residue-field union has p-cohomological dimension zero. The repaired Lean signature includes the lift. |
| RT-AREA-iwasawa-3/7 | Theta existence uses divisor pushforward. For c=5,a=2 pullback is 25E[2]−E[10], which has additional 10-torsion support and cannot replace the norm-divisor formula. |

## Sources, findings and access limits

The following public versions were obtained; their SHA-256 hashes match the packet access records. Only the relevant result and proof interfaces are claimed as checked; complete [KK3], the unstaged early all-prime CM proof and the newly recorded alternative nonsplit image input remain unresolved.

| Source version read | Principal checked interfaces |
| --- | --- |
| [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | Kato’s published Astérisque 295 (2004), pp.117–290; units, scheme K₂, moment/cohomology, reciprocity, Iwasawa and ordinary targets at their listed locators. |
| [Karl Rubin](https://swc-math.github.io/notes/files/99RubinES.pdf) | 1999 AWS public author draft: II.1–3, III.5 and IX.6.1; no published AMS-book collation. |
| [Kentaro Nakamura](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf) | Published Invent. Math. 234 (2023), pp.171–290: Lemma 2.10, §3.1–3.2, §5.1 and Appendix A interfaces; universal deformation §4 is outside scope. |
| [Ashay A. Burungale and Ye Tian](https://arxiv.org/pdf/2506.03465v2) | arXiv:2506.03465v2, 11 October 2025, 7 pages: §2 rational input and §3.1 specialization. No publisher-text collation. |
| [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) | Author-hosted scan of the published Glasgow Math. J. 27 (1985), pp.185–194: §3 pp.190–192, read as images, for the exact quaternion-valued image statement. |

The source findings were rechecked independently, including the finite cocycle calculation and the integral pairing obstruction. The table records this review’s dispositions; the full reasons and bounded correction-search records appear in the packet and synchronized reader.

| Finding | Locator | Result |
| --- | --- | --- |
| `KatoEulerSystems/E1` | Published Astérisque 295 (2004), 1.9 p.124 and repeated after 3.10 p.141 | Confirmed missing square: B₂(a/N)/2; at 2/5 the correct value is −11/300. |
| `KatoEulerSystems/E2` | 1999 AWS public author draft, III.5.1 p.48 | Confirmed odd-prime restriction for the formal logarithm lattice; retain the actual log lattice at two. |
| `KatoEulerSystems/E3` | 1999 AWS public author draft, III.5.8(ii) and proof p.50 | Confirmed dyadic H¹ counterexample in the AWS draft; finite cohomology replaces vanishing at two. |
| `KatoEulerSystems/E4` | Published Invent. Math. 234 (2023), §3.1.3 p.207 | Confirmed reversed individual theta divisor; both inversions cancel in the equal-auxiliary symbol. |
| `KatoEulerSystems/E5` | Appendix A, proof of Theorem A.1, p. 267 | Confirmed d² in the second conductor-n smoothing factor. |
| `KatoEulerSystems/E6` | Appendix A, before Lemma A.3 and in its statement, p. 268 | Confirmed Γ₁ curve Y₁(N_f) for the two-dimensional dual quotient. |
| `KatoEulerSystems/E7` | Published Invent. Math. 234 (2023), §3.1.2 pp.205–206, equation (7) and preceding symmetric-power pairing; repeated in §3.1.5 pp.215–216 and Remark 3.3 p.218 | Confirmed integral symmetric self-duality fails at p=2,k=4; retain literal duals or invert the factorial. |
| `KatoEulerSystems/E8` | Published Astérisque 295 (2004), Theorem 12.5(4), p.222; proof 13.14, p.234 | Confirmed contextual rational/integral display slip; weaker printed rational inequality is not asserted false. |
| `KatoEulerSystems/E9` | Published Astérisque 295 (2004), Theorem 17.4(3), p.273; compared with 17.6 p.274 and proof 17.13 pp.279–280 | Confirmed good-period lattice is in V(f*), identified with T*(1−k). |
| `KatoEulerSystems/E10` | Published Invent. Math. 234 (2023), §5.1 p.254, proof of Theorem 5.2 and paragraph before Conjecture 5.3; proof of Theorem A.1 pp.266–267 | Confirmed 12.5(4), Conjecture 5.1 and Appendix A’s 12.5(1) reference corrections. |
| `KatoEulerSystems/E11` | Published Astérisque 295 (2004), proof 13.14 p.234; compare Theorem 12.4(2)–(3) p.221 | Added and confirmed: integral freeness in 13.14 uses 12.4(3), corroborated by Skinner’s published p.188. |
| `KatoEulerSystems/E12` | Published Astérisque 295 (2004), 12.8.2 p.223 and its use after 13.4 p.226; compare Ribet §3 pp.190–192 | Added and confirmed proof gap: quaternion openness alone does not imply the every-place unipotent assertion; no counterexample to the all-prime cohomological result is claimed. |

For E3, enumeration of GL₂(Z/4) gives 96 matrices acting on F₂². A cochain has 192 binary coordinates; the equations f(gh)=f(g)+g f(h) have rank 189, so Z¹ has dimension three. Coboundaries have dimension two, hence H¹ has dimension one. Inflation to GL₂(Z₂), followed by the multiplication-by-two exact sequence for the invariant-free divisible module, gives the nonzero class. This calculation was reproduced in this run.

For E7, in basis x²,xy,y² of ordinary Sym²(Z₂²), diagonal equivariance forces an antidiagonal pairing. Upper-unipotent invariance forces a=c=−2b, so its determinant is −4b³ and cannot be a unit. This verifies the integral obstruction while preserving the rational comparison.

E11 is separately corroborated by [Skinner’s published article](https://msp.org/pjm/2016/283-1/pjm-v283-n1-p10-p.pdf), p.188, after Theorem 2.5.2. It is not labelled a formal Kato erratum. E12 is bounded to the cited deduction and its split/division distinction. Correction searches found no applicable alternative every-place argument, but do not establish exhaustive novelty.

## Per-node dispositions

Every node has a corresponding entry in the packet’s current review object. Verified means checked as a proposed target with its recorded supplier conditions and gaps; corrected identifies changes made during this independent review.

| Node / proposed declaration | Verdict | Evidence and limit |
| --- | --- | --- |
| `KatoEulerSystems:L0/theta-function-c-normalised` / `cTheta` | verified | Kato 1.3/1.10: Cartier divisor, pushforward, norm uniqueness and normalization checked; all seven APIs and three discriminating tests are retained. |
| `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation` / `siegelUnit` | verified | Kato 1.4/1.7: auxiliary independence is rational and the congruent auxiliary prime is inverted; torsion-section and level hypotheses retained. |
| `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution` / `siegelGaloisDistribution` | verified | Kato 1.6/1.8: actual GL₂ index action includes determinant on roots; distribution is an isogeny norm on nonzero torsion. |
| `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula` / `siegelDegeneracyProduct` | verified | Kato 2.12 pp.131–132: first degeneracy relation rescales β and leaves α fixed; geometric maps remain imported. |
| `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N` / `beilinsonElement` | corrected | Specified ch_(2,2)=−c_(2,2) in the ordered cup test and restricted smoothing invertibility to nontrivial auxiliaries, naming finite-order denominators. |
| `KatoEulerSystems:L1/K2-norm-projection-formula-and-level-norm-relation` / `k2NormProjection` | verified | Kato 2.3/2.11: actual K₂ transfer and projection identity are conclusions of the proposed type, with level and prime-support hypotheses retained. |
| `KatoEulerSystems:L1/euler-factor-norm-relation-at-auxiliary-primes` / `k2AuxiliaryEulerFactor` | verified | Kato 2.4/2.12: the auxiliary-prime Euler factor retains the geometric transfer and its quadratic coefficient ℓ. |
| `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system` / `chernMoment` | verified | Kato 8.4: the literal integral moment monomial has target twist k−r; open/log coefficient comparison remains an exact owner request. |
| `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map` / `chernHeckeDiamond` | corrected | Separated central diamond scalar n^(k−2−2r) from Hecke scalar n^(r−1), and retained the determinant factor at the top moment. |
| `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology` / `cyclotomicLimitIntegral` | verified | Kato 8.5: inverse-corestriction duality is with direct-restriction residue H¹ and Q/Z-valued duals; suggested integral image/injectivity conclusions are present. |
| `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations` / `padicZeta` | verified | Kato 8.7/8.11: corestriction, ℓ^(−r), k−1−2r and all three prime-support cases agree with the source and tests. |
| `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice` / `katoEulerAdapter` | corrected | Corrected the public Rubin draft Euler-factor-change locator to IX.6.1 pp.141–143; ES.2 owns the carrier and convention adapter. |
| `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index` / `integralZetaFiniteIndex` | verified | Kato 12.6/13.10–13.12: the proposed type concludes actual integral inclusion and finite quotient; full tame-algebra support theorem remains a gap. |
| `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system` / `modularFiltration` | verified | Kato 9.3: F^i steps, not associated graded pieces, are identified; the zero boundary is i≥k and the open comparison is requested. |
| `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements` / `generalizedExplicitReciprocity` | verified | Kato 9.5: exp*(loc z) has all three exact p factors and conclusion in the proposed type; [KK3] proof closure remains a gap. |
| `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values` / `zetaCriticalInterpolation` | verified | Kato 12.5/13.9: representation twist precedes specialization, localization and exp*; the semilinear sign and period convention are retained. |
| `KatoEulerSystems:L3/beilinson-regulator-and-the-archimedean-zeta-value` / `beilinsonArchimedeanRegulator` | verified | Kato 2.6–2.7/6.6(2): the signature concludes Z(0)=0 and the derivative-regulator formula with 2πi, rather than just naming an operator. |
| `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra` / `modularEulerSystemBound` | corrected | Made the rational image verification conditional on the checked split branch and the exact alternative nonsplit supplier gap; direct ES.8 routing is retained. |
| `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero` / `zetaSubmoduleNonvanishing` | verified | Kato 13.5–13.7: analytic nonvanishing and the geometric class imply height-zero zeta nonvanishing without deriving the earlier module structure from the canonical map. |
| `KatoEulerSystems:L4/cohomological-divisibility-one-direction` / `cohomologicalDivisibility` | corrected | Added integral freeness prerequisite 12.4(3), corrected the 13.14 reference and distinguished the remaining nonsplit rational and CM length-comparison gaps. |
| `KatoEulerSystems:L4/ordinary-selmer-divisibility` / `ordinarySelmerDivisibility` | verified | Kato 17.4: one ordinary upper divisibility is retained with the dual-form good lattice, refined periods, p-power error and separate integral hypotheses. |
| `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment` / `nonCmLargeImage` | corrected | Restricted the unipotent deduction to an imported open SL₂ premise verified at split local quaternion places; R19.3 request and E12 retain the nonsplit proof gap. |
| `KatoEulerSystems:L0/analytic-product-cusp-divisor-and-integrality` / `siegelAnalyticProduct` | verified | Kato 1.3(3)/1.9: branch, two infinite products, B₂/2 cusp exponent and algebraic-unit smoothing all occur in the suggested conclusion. |
| `KatoEulerSystems:L1/chern-symbol-normalization-and-denominators` / `chernSymbolNormalization` | verified | The imported higher-Chern sign is c_(2,2)=−Kummer cup, while ch_(2,2) is positive; finite-coefficient and rational-projector denominators are distinguished. |
| `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes` / `fullLevelZeta` | verified | Nakamura 3.1.3–3.1.4: literal dual integral coefficients and full Hecke action are retained; completed Borel–Moore evaluation remains an exact R31.2 request. |
| `KatoEulerSystems:L2/hecke-dual-twist-dictionary` / `heckeDualTwistDictionary` | verified | Nakamura Lemma 3.1/Appendix A: literal integral dual, rational self-duality, central ℓ^(k−2) and Γ₁ Poincaré quotient conventions agree. |
| `KatoEulerSystems:L2/rational-kato-zeta-morphism` / `katoZetaMap` | verified | Kato 12.5/13.9–13.12: the unique rational map is constructed only after geometric classes and module structure; generator realization, sign and spans are explicit. |
| `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values` / `archimedeanCriticalValues` | verified | Kato 4.2.4/4.6/6.6: ordered piecewise Eisenstein products and the ±1 period quotient match their displays and exact normalization requests. |
| `KatoEulerSystems:L3/parabolic-full-level-characterisation` / `parabolicFullLevelCharacterisation` | corrected | Added the exact R07 L3 parabolic global inverse-limit torsion-freeness/injectivity request; uniqueness is conditional on it and is never claimed on the open curve. |
| `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism` / `twistedKatoZeta` | verified | Nakamura Appendix A.1: source twist 1−k and target twist k yield output twist one; positive conjugation and dual-form transport are explicit. |
| `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class` / `katoScalarRegulator` | verified | Kato 16.4–16.6: normalized refinement η, scalar pairing, Euler factors and growth domain retained; general de Rham and dyadic extensions remain gaps. |
| `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison` / `noncriticalAnalyticArithmeticComparison` | verified | Kato 16.2: noncritical slope and complete period/Mellin dictionary retained; equality is conditional on that imported normalization. |
| `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain` / `criticalBadReductionComparison` | verified | The critical family comparison retains decent-point, common-neighborhood and nonvanishing specialization hypotheses; arbitrary critical/bad-reduction equality is not asserted. |
| `KatoEulerSystems:L4/analytic-twist-nonvanishing` / `analyticTwistNonvanishing` | verified | Kato 13.5–13.6/16.6: Rohrlich and Euler products supply nonvanishing; LSeries itself supplies only the total Dirichlet sum. |
| `KatoEulerSystems:L4/rational-iwasawa-module-structure` / `rationalIwasawaStructure` | corrected | Retained every-prime source theorem, while recording both the early CM gap and the alternative nonsplit non-CM proof gap; all five module-structure conclusions are explicit. |
| `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period` / `ellipticLocalLattice` | verified | Rubin III.5.1–5.3: actual dyadic logarithm annihilator, odd-prime index/p lattice, positive fixed r_E and twisted period conclusion are present. |
| `KatoEulerSystems:L4/elliptic-cyclotomic-mordell-weil-finiteness` / `ellipticCyclotomicFiniteGeneration` | corrected | Requested the exact elliptic Serre open-image and finite-torsion consequences from R19.3; the suggested signature still proves uniform finite-layer descent and finite generation. |
| `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility` / `ellipticOrdinaryMultiplicativeDivisibility` | corrected | Added expressible positivity of the fixed r_E to the suggested signature; Coleman image, finite torsion Selmer, fractional p^t bound and split augmentation remain explicit. |
| `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule` / `ellipticNoFiniteSubmodule` | verified | Rubin III.5.17: typed local torsion, norm-freeness and weak-Leopoldt inputs lead to absence of finite submodules; the conclusion is not assumed as a criterion. |
| `KatoEulerSystems:L4/elliptic-rank-zero-p-part-upper-bound` / `ellipticRankZeroPPartUpperBound` | corrected | Requested elliptic almost-all-prime image and finite-torsion consequences explicitly; odd good-prime local factors, finite Sha and upper inequality remain distinct from BSD equality. |

## API, tests and reader consistency

All eleven constructions retain APIs derived from their consumers, with constructors, characterizations, extensionality, scalar/functorial relations and coefficient compatibility where applicable. All forty-one tests were checked for their stated purpose; identity and nonzero specializations discriminate constant maps, while geometric hypotheses remain explicitly omitted in the prototypes. Every API name and construction-test name occurs in the suggested file. No bookkeeping object becomes a planet.

The reader was synchronized in the changed node blocks and in the exact requests, gaps, source findings and current verdict. A comparison of every node statement, hypothesis, proof step, acceptance item, API/test statement, prerequisite and source match found no omitted packet text. Every request and gap text also appears in the reader. This comparison checks agreement; it is additional to the independent mathematical checks.

## Validation and its limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/KatoEulerSystems.json`: zero errors and zero warnings, with all five stages planned.
- The repository’s `source_issues.check_issues` and `check_errata.versions_checked` validators: no errors for the twelve findings and five registered source versions.
- All node IDs and prior APIs/tests/planets retained; all forty review entries accounted for; dependency and coverage checks passed.
- Reader/packet comparison: zero mismatches. The only proposed Lean edits are the explicit Chern-character convention, supplier-limit comments, current review explanation and positive r_E hypothesis.
- `lean-check research/blueprint/suggested/KatoEulerSystems.lean`: exit zero, zero errors and 135 warnings, all `declaration uses sorry` warnings. Memory available before the check was 111 GB. No language server, library build, update or cache download was started.
- `git diff --check`: passed. Only the three reviewed deliverables, this report and this job’s durable handoff are submitted.

The shared build’s Mathlib HEAD is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, newer than the packet’s recorded `f790474821cf4256814db967cb154e7af3d0c369`. The suggested file imports only Mathlib. Successful elaboration is therefore reported at the exact Mathlib pin, not as a two-library pinned build or as a proof of the arithmetic targets. Final comments were cleaned up without changing any elaborated signature.

Final suggested-file SHA-256: `c894922a7c8becb9ae32714d095cb3681ab72b311ea488527c4cc1240d3dfc13`.

## Questions and routing for the orchestrator

1. Route the new R19.3 request for the precise cyclotomic/split image theorem and alternative nonsplit rational input. If the supplier has an existing all-place proof, attach its exact theorem and coefficient-place hypotheses; Zariski closure is insufficient for this unipotent step.
2. Route the R07 L3 parabolic inverse-limit injectivity/torsion-freeness request, including the all-weight/full-level extension cited by Nakamura Lemma 3.4. Generic local exp* does not discharge it.
3. Stage the early all-prime CM elliptic-unit supplier independently of the canonical Kato map, retaining the p=2,Q(i) contained-cyclotomic case and the localized length comparison in 15.13–15.17.
4. Apply the inherited atlas routing corrections in upstreamNotes for RT-AREA-iwasawa-1/36. This job leaves the atlas and other owners’ files to the maintainer.

No answer is required to accept this pass: these are precise follow-up dependencies already recorded as gaps/requests, not unrecorded contradictions. Full source proof closure, dyadic regulator domains, finite-support algebra, critical-family compatibility, period normalization and ordinary control remain among the fourteen open gaps. The job is a completed independent review, not a checkpoint.
