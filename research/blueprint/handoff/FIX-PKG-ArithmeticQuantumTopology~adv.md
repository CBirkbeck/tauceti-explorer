# FIX-PKG-ArithmeticQuantumTopology~adv

Codex · codex-Yp031T · 2026-10-21 · Refs #11535

## Result and scope

The authorized package fixes are complete. The package verdict remains **needs_changes** for
two precisely identified external actions: the full quadratic finite étale extension of
HabiroNumberFields, and the maintainer's admissible upstream publication order. This is a
completed fix report, not an independent review or a certification of the suppliers. No claim
is made that any planned mathematical theorem has been formalised.

Only this handoff and the package's README, Suggested.lean and review.json change. The issue's
requested `REV-PKG-ArithmeticQuantumTopology~adv.md` does not exist in the checkout. The
available report is `research/blueprint/reviews/REV-PKG-ArithmeticQuantumTopology.md`, dated
2026-10-14; its R1–R3 findings agree with the original review.json. That report and its handoff
were read in full. They are preserved as the historical independent review.

While this fix was in progress, independent revision-2 review #11537 merged as `986259d3f`.
The branch was rebased onto it. Its Hoste-component correction, ambient/intrinsic topology
distinction, flat-tetrahedron correction and proved shape-2 example, and BDH/GZ locator fixes
are all preserved. Its transitive q-series finding corrected this fix's earlier incomplete
classification of QSeries as only downstream. The final package separates QM.0–QM.1
foundations from QM.5 topological applications. The revision-2 review report was read as
evidence, not as instructions, and its remaining owner actions agree with the final residue.

## Finding dispositions

| Finding | Change and evidence | Residue |
| --- | --- | --- |
| R1: ideal-boundary geometry, finite-volume ideal regions and the Milnor proof were missing from Polylogarithms P.2. | The accepted 2026-10-20 Polylogarithms package now supplies these in §2.4: the metric model, PSL₂ action, ideal boundary, horoball tails, compact exhaustion and the orthoscheme/Lobachevsky proof. AQ §§5.1–5.3 and 5.11 already name that precise interface. Its shape convention is retained. Milnor's public chapter was checked directly; the full bibliographic locator is added. | Resolved at roadmap level. This does not say the geometric theorem is implemented or that the supplier is already upstream. |
| R2: HabiroNumberFields did not supply effective global descent over the full quadratic coefficient algebra. | Its accepted package now has number-field descent (§3.10) and scalar equivalence (§3.16). The remaining finite-product extension is specified in Exact supplier contracts, with five named exports, a componentwise proof route, correct Habiro-ring tensor base change and four controls. AQ §§6.8 and 7.17 now explicitly depend on that extension. | HabiroNumberFields must adopt the full-algebra contract below; HabiroNahmSeries must cite it. A selected field factor cannot substitute for the whole algebra. Neither supplier file is an authorized deliverable of this issue. |
| R3: six suppliers had no checked packages or admissible upstream order; Q-series had an outstanding review. | All six now have accepted atlas package reviews. Two are open upstream: HabiroCyclotomicCompletions #1314 and PolylogarithmFunctions #1320; both contracts were read at their heads. AQ consumes them. The other four were not found upstream by name/current-main inspection. QSeries QM.0–QM.1 precedes HNF/HNahm, while QM.5 consumes AQ Layers 3–4; both directions were checked in the actual suppliers and QSeries nodes. | The maintainer must resolve this whole-roadmap packaging cycle and publish the remaining suppliers in an admissible order or bundle. The Caraiani–Newton order file does not assign this family. This worker has not invented a tier or approved a bundle. |
| Upstream duplication found during the required current-roadmap audit. | Import merged PivotalSpherical #57 and QuantumGroups #891, and open QuantumEnvelopingAlgebras #1125. Replace the duplicate general ribbon category with the continuous-module realization and trace comparison. Replace generic Serre/PBW and generic module construction with formal/integral comparison targets. The duplicate Lean ribbon structure and its generic tensor-trace theorem are deleted. | The continuous completed module category, h-adic Cartan extension, Habiro integral forms and their comparisons remain AQ targets; their carriers do not exist at the pins. |
| Generic coefficient-field error in §1.12. | The generic algebra maps to U_h[h⁻¹], not U_h. The scalar (v−1)⁻¹ maps to 2h⁻¹−1/2+O(h), which is outside the formal power-series ring. Formal PBW is distinguished from the generic Laurent-torus basis. | Fixed locally; integral generators still have a separate landing/comparison target. |
| Trace and colour comparison domains. | §1.1 restricts categorical trace to module endomorphisms; weighted traces of arbitrary algebra elements remain linear functionals. §§2.1 and 4.12 base change the supplied highest-weight lattices. Complex nonroot fibres are taken before formal base change; no evaluation of arbitrary formal series at nonzero h is used. | Fixed locally. The ε=−1 generic simples are not silently added to the type-1 colour family. |
| Unqualified factorial-series uniqueness. | The exact HC contract now says uniqueness only for normalized digits deg a_n≤n. §2.13 adds the zero expansion (1−q,−1,0,…). The central coefficients are determined before scalar specialization. | Fixed locally; arbitrary convergent scalar coefficients are not claimed unique. |

## Exact external action for R2

Owner: **HabiroNumberFields Layer 3**, with **HabiroNahmSeries §6.4** as immediate consumer and
**ArithmeticQuantumTopology §§6.8, 7.17** downstream. No packet outside this job was edited.
This is the maintainer note for routing the missing mathematics to its existing owner.

The overall export remains `indexedLine_quadraticEtaleComparison`, as named in revision 2;
the five exports below specify its component construction, descent and functoriality.
For R=𝒪_K[1/Δ], 6|Δ and δ a unit, use the entire algebra B=R[T]/(δT²−1). After enlarging
the same localization for every component's discriminant and exceptional factors, establish:

1. `finiteEtaleIndexedLine_productComparison`: coefficient algebras, completions, Frobenius
   equalizers and indexed families over B agree with the products over all connected factors.
2. `finiteEtaleIndexedLine_mem_iff`: the family membership conditions, including the linear
   first jet, Kummer roots and Frobenius equations, hold exactly when they hold in every factor.
   Prove this before importing module addition from the field theorem.
3. `finiteEtaleIndexedLine_projective_rankOne`: reconstruct the finitely presented projective
   rank-one module from the field components by the orthogonal idempotents.
4. `finiteEtaleIndexedLine_scalarEquiv`: H_B⊗_(H_R)M_(R,ξ)≃M_(B,ξ), with the actual local and
   rational chart base changes. There is no general B⊗_R formula for this Habiro module.
5. `finiteEtaleIndexedLine_detectIso`: component chart families detect isomorphisms, with unit,
   tensor and inverse coherence and compatibility with identity, towers and T↦−T.

The README gives a proof route from finite étale normality, the finite product decomposition,
and the existing number-field contracts. For a square δ, neither projection B≃R×R is faithful:
(1−aT)/2 has images (0,1). For δ=2 over ℤ[1/6], the connected factor is
ℤ[1/6][√2]. Characteristic two gives a nonreduced quadratic algebra and is excluded. For ξ=0
the line comparison is the ring comparison; projective rank one at a nonzero index does not
produce a preferred generator. These prevent field-only, chosen-root and trivial-line shortcuts.

## Upstream evidence and publication dependencies

Inspected on 2026-10-21. A merged or open roadmap supplies a **plan**, not a proved library API.
The read-only current roadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`,
and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Remote PR heads were also
read because the local roadmap checkout predates some merges.

| Supplier | Inspected evidence | AQ use |
| --- | --- | --- |
| PivotalSpherical | [Merged #57](https://github.com/TauCetiProject/TauCetiRoadmap/pull/57), head `8e5905d888141b32794abc38829f00fc81d97176`, merge `c84f711be9c5c10b3b88104b000519df920f6acf`; README and Suggested read. | Layers 0–2 pivotal traces and tensor law; Layer 10 balanced/ribbon and the induced pivotal structure. |
| QuantumGroups | [Merged #891](https://github.com/TauCetiProject/TauCetiRoadmap/pull/891), head `f75dc998f27ec3f11d2788291dda4da0f88a9d28`, merge `46515d5ee5b360ff0f329a0ff6e5b8d61e9f9899`; Q8 read. | Q8 items 1–5, complex nonroot sl₂ with parameter v here, the ε=+1 family and K⁻¹ pivot. |
| QuantumEnvelopingAlgebras | [Open #1125](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1125), head `83d9fb57c3910b463798ffa6730657edf29970bf`; QEA0–QEA4 read. | Root datum, generic Hopf/PBW, full-cocharacter integral form and highest-weight lattices. Its cocharacter lattice is not [HL]'s root lattice; the selected smaller integral comparison remains new. |
| HabiroCyclotomicCompletions | Accepted `REV-PKG-HabiroCyclotomicCompletions~codex2`; [open draft #1314](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1314), head `bf8812fbc41f0e74dca5b0ed5ae5a87c936707b4`. | Factorial convergence/normalized digits, evaluation and rigidity. |
| PolylogarithmFunctions | Accepted `REV-PKG-PolylogarithmFunctions~codex1`; [open draft #1320](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1320), head `6e452e5b0066b40aa0002f81b226fca2d5b6a964`. | Dilogarithm branch and Bloch–Wigner analytic identities. |
| HabiroNumberFields | Accepted `REV-PKG-HabiroNumberFields~codex2`, 2026-10-20; full relevant Layer 3 read; no own upstream PR found. | Number-field descent and pullback; R2 records the missing full-algebra extension. |
| HabiroNahmSeries | Accepted `REV-PKG-HabiroNahmSeries~adv`, 2026-10-19; relevant normalization, comparison and full-algebra clauses read; no own upstream PR found. | Gaussian/Nahm, full-coefficient transfer and gluing, conditional on R2's actual supplier. |
| K3BlochGroups | Accepted `REV-PKG-K3BlochGroups~codex3`, 2026-10-20; relevant conventions and lift contracts read; no own upstream PR found. | Exact published/older Bloch conventions, K₃ classes and lift fibres. |
| Polylogarithms | Accepted `REV-PKG-Polylogarithms~codex2`, 2026-10-20; §2.4 read; no own upstream PR found. | The ideal geometric model and volume theorem needed by R1. |

The prerequisite graph, rather than an authorized tier assignment, is:

```text
QSeriesPartitionsAndMockModularForms QM.0–QM.1 -> HabiroNumberFields + HabiroNahmSeries
PivotalSpherical + QuantumGroups + QuantumEnvelopingAlgebras -> AQ Layers 1–4
HabiroCyclotomicCompletions -> AQ Layers 2–4
PolylogarithmFunctions -> Polylogarithms -> AQ Layer 5
HabiroCyclotomicCompletions + K3BlochGroups + HabiroNumberFields(full B)
  -> HabiroNahmSeries -> AQ §6.8
AQ Layers 3–4 -> QSeriesPartitionsAndMockModularForms QM.5
```

For R3 the maintainer must separate QM.0–QM.1 foundations from the QM.5 Lawrence–Zagier
applications, move those foundational exports to a preceding owner, or assign a bundle covering
the actual dependency closure. Publishing the four remaining direct suppliers alone cannot
resolve the whole-roadmap cycle. HabiroNumberFields's bilateral summation, Pochhammer defect
and eta inputs and HabiroNahmSeries's q-binomial/q-Lucas, Euler, Rogers–Ramanujan/Andrews–Gordon
and eta inputs were checked against QM.0–QM.1. The QSeries nodes
`lawrence-zagier-radial-limit`, `lawrence-zagier-ohtsuki-expansion` and
`poincare-sphere-unified-invariant-radial-limit` explicitly consume AQ Layers 3–4. This is a
publication obstruction; the foundational mathematical proofs need not be circular.
Then replace conditional R2
language only after the named full-B exports are present. Open QuantumEnvelopingAlgebras #1125
is an additional already-planned upstream dependency, not a reason to duplicate its definitions.

### Duplication audit and retained targets

Searched by mathematical object in current Tau Ceti and the current roadmaps, including the nine
post-snapshot roadmaps and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and
RestrictedProducts. Read the relevant bodies as well as names. GeometricTopology,
PeripheralActions and the exemplar were also used to check shape and ownership. The reviewed
library-coverage file has no AQ row; related Habiro/Polylogarithm rows were inspected.

The existing boundaries for finite-volume predicates, the upper-half-space metric, closed
rigidity predicates, smooth links, Markov data, Jones/Jimbo traces, the indefinite odd lattice
classification and unbounded Borel calculus remain correct. In particular, IntegralLattices
**main §6A**, not just Completed/IntegralLattices, supplies the odd indefinite classification.
No new geometric rigidity or general contour/Borel-calculus target was introduced.

All 106 packet targets remain represented by AQ targets or their now-explicit supplier
interfaces. General ribbon axioms/trace and generic quantum groups/colours moved to the named
existing upstream owners; AQ retains their genuinely additional continuous, formal and integral
realizations. `quantumPBWBasis` becomes `formalQuantumPBWBasis`, with explicit
`genericQuantum_formalComparison` and `semisimpleIntegral_formalComparison`. No original Check,
source hypothesis or running example was removed. The obsolete general Lean ribbon structure
and `ribbonTrace_tensor` are imported instead of redeclared, reducing admissions from 19 to 18.
No outside packet, current roadmap, library or review report was edited.

## Fresh source checks

These locators were read for the changed claims and supplier gaps. The independent review's
older full locator audit is historical evidence; this run does not claim to have re-read every
unchanged proof in its bibliography. No uncleared book copy or verbatim excerpt was used.

| Source | Locator checked | Use |
| --- | --- | --- |
| [Habiro–Lê, arXiv:1503.03549v2](https://arxiv.org/pdf/1503.03549v2) | §§3.1.2–3.1.5, pp. 36–38, especially localization in §3.1.5, p. 37; Definition 3, §2.14, p. 28, and §2.14.1, p. 29. | Generic/formal coefficients and the integral boundary; ambient zero-convergence versus intrinsic basis coordinates. |
| [Habiro, arXiv:math/0509039v2](https://arxiv.org/pdf/math/0509039v2) | Corollary 5.1 and proof, §5, printed pp. 1309–1310 (PDF pp. 25–26). | Checked the preserved correction that L_j, the component being slid over, is unknotted. |
| [Garoufalidis–Scholze–Wheeler–Zagier, arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2) | §1.7, Theorems 3–5, pp. 13–14; §1.8, pp. 15–17. | The full quadratic algebra, arithmetic statement and NZ/Nahm comparison scope; no unconditional knot comparison inferred. |
| [Milnor, Chapter 7 of Thurston's Geometry and topology of three-manifolds](https://library.slmath.org/books/gt3m/PDF/7.pdf) | Lemma 7.1.2, p. 158; Theorem 7.2.1, p. 160; Lemma 7.2.2 and proof, pp. 161–163; figure-eight volume, p. 164. | R1's Lobachevsky/orthoscheme geometric supplier, checked against Polylogarithms §2.4. |
| [Stacks Tag 025P](https://stacks.math.columbia.edu/tag/025P) and [Tag 030C](https://stacks.math.columbia.edu/tag/030C) | Proposition 41.19.7; Lemma 10.37.16. | Étale normality and the finite product of normal domains in the proposed supplier extension. |
| [Habiro, arXiv:math/0605313v1](https://arxiv.org/pdf/math/0605313v1) | Theorem 1.2, p. 4; Theorem 11.2, p. 31. | Knot/central coefficients are not arbitrary scalar factorial digits. |
| [Habiro, arXiv:math/0209324v1](https://arxiv.org/pdf/math/0209324v1) | §1, pp. 2–5; read alongside HC §2.1's monic-division contract. | Scalar completion and factorial series; the explicit zero expansion disproves unrestricted uniqueness directly. |
| [Brouder–Dang–Hélein, arXiv:1409.7662v2](https://arxiv.org/pdf/1409.7662v2) | §3, p. 5, paragraph before Definition 3.1. | Checked the preserved normal-topology locator; Definition 3.1 defines hypocontinuity instead. |
| [Garoufalidis–Zagier, arXiv:2111.06645v3](https://arxiv.org/pdf/2111.06645v3) | §5.4, Conjecture 5.4, p. 42. | Checked the preserved analytic-extension locator and its conjectural status. |

The pinned declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including matrix transvections, Chebyshev S,
cyclotomic/root declarations, monoidal/braided/rigid pairings, Hopf algebras, completions,
complex logarithms, total Bochner integration, contour Cauchy, Schwartz/distribution Fourier,
Markov/framed-braid definitions and the Cartan matrix convention. The last is root-first,
coroot-second; the displayed a_ij=⟨α_j,α_i∨⟩ uses its transpose.

## Adversarial pass

Read all 110 numbered README sections and every Lean declaration with its active variables.
The tables group related statements but cover every numbered section. A retained source theorem
was checked at its stated domain; a degenerate input outside that domain is a negative control,
not a theorem about the raw totalized expression. The fresh source checks are listed above;
unchanged deep geometric/analytic theorems retain their existing source locators and explicit
proof obligations. Conjectural rows stay conjectural.

### README statements and interfaces

| Statement(s) | Instances and checks | Result / change |
| --- | --- | --- |
| Exact supplier contracts: ribbon/generic quantum data | Unit category; arbitrary pivotal structure versus the ribbon-induced one; signed sl₂ modules; full cocharacter versus root lattice. | Import actual suppliers; retain only the specified continuous/formal/integral comparison. |
| Exact supplier contracts: finite étale indexed line | Split δ=a² and idempotent (0,1); δ=2 over ℤ[1/6]; δ=1 in characteristic two; ξ=0. | Full product retained; p=2 excluded; rank one does not mean globally free with a chosen generator. |
| 0.1 linking/framing | Empty link; single zero-framed component; Hopf off-diagonal 1; one framed braid at framings 0 and 1. | Retain distinction between ordinary Markov equivalence and framed admissibility. |
| 0.2 surgery homology | Empty coker=0; [0] gives ℤ; [2] gives ℤ/2; Hopf determinant −1. | Presentation uses meridians and longitude relations, not determinant alone. |
| 0.3 admissibility | Empty matrix; diagonal ±1; diagonal 0; unimodular nonsplit Hopf matrix. | Off-diagonal vanishing and unit diagonal are both needed. |
| 0.4 Kirby/Fenn–Rourke | Distinct-index transvection; Hopf slide gives [[2,1],[1,0]]; +1 blow-down shifts by −ℓ². | Symmetry and i≠j retained; no slide-preserves-admissibility assertion. |
| 0.5 Hoste | Split ±1 deletion; framing 2 excluded; linked blow-down changes other framings. | Retain admissible-to-admissible domain. |
| 0.6 band slides | A single slide from I₂ gives [[2,1],[1,1]]; a second same-direction slide gives [[5,2],[2,1]]. | Opposite signed pair, not arbitrary two slides, is the band-slide operation. |
| 0.7 refined calculus | Empty presentation and split +1 unknot; zero framing excluded; in L_i over L_j the twisting component must be the unknotted L_j. | Preserve revision 2's corrected component and undo the auxiliary moves. |
| 0.8 admissible presentation existence | E₈⊕⟨−1⟩ is indefinite odd; E₈⊕⟨+1⟩ remains definite. | Import main IntegralLattices §6A with the correct stabilization sign. |
| 1.1 continuous ribbon comparison | Trivial module; trivial Hopf algebra and ordinary trace; V₁ twist q^(3/4); arbitrary noncentral x need not act H-linearly. | New comparison replaces duplicate category; categorical trace restricted to endomorphisms. |
| 1.2 completed Hopf/zero convergence | Ground ring; hⁿ→0; constant 1 or h does not tend to zero; finite-free versus arbitrary infinite-rank modules. | Completed tensor codomains and rigid finite-free subcategory retained; §1.1 cycle removed. |
| 1.3 rank-one integral forms | h=0 classical limit; odd K versus even K²; (v−1)⁻¹ has a pole. | Consume QEA1–QEA3/Q8, prove Habiro generators and even form separately. |
| 1.4 ribbon/R matrix | R mod h=1; positive V₁ twist q^(3/4); trace v+v⁻¹. | Inverse-ribbon framing convention retained. |
| 1.5 completed even form | Unit; odd/even parity; completed tensor square rather than algebraic tensor square. | Keep image completion; no injectivity of inverse-limit map assumed. |
| 1.6 bottom tangles | Zero arcs; n trivial arcs close to n unknots; closed component or arbitrary bottom-tangle stacking excluded. | Actual ribbon-tangle category/action retained. |
| 1.7 RT functor | Empty graph gives 1; straight strand identity; crossing and inverse cancel. | Coupon colours, duals and framed isotopy hypotheses retained. |
| 1.8 universal sl₂ invariant | Trivial tangle unit; positive/negative kink r⁻¹/r; Hopf not unit. | Bead order and framing signs retained. |
| 1.9 general universal invariant | Zero tensor factors; trivial ribbon Hopf algebra; specialization to sl₂. | Full topological ribbon-Hopf hypotheses retained; trivial data do not detect knots. |
| 1.10 integrality | Unit bottom knot; algebraically split zero framing; nonzero framing excluded. | No extension to arbitrary framed links. |
| 1.11 core/clasp/twist | Unit twists; dual-basis delta; each intrinsic basis vector has a unit coordinate, so it is outside hX; X coordinates tend to zero, closure coordinates need not. | Preserve revision 2's ambient versus intrinsic topology and the corrected convergence proof. |
| 1.12 formal quantum group | sl₂; orthogonal roots commute; G₂ long-root d_i=3; scalar pole 2h⁻¹−1/2. | Correct localization and generic/formal PBW distinction; reuse QEA root datum. |
| 1.13 integral core | Zero PBW index; rank-one lattice; nonzero factorial weights. | Weighted core remains separate from the full-torus Lusztig integral form. |
| 1.14 tilting quotient | Unit trace 1; sl₂ r=3 retains V₀,V₁ and kills V₂. | Root bounds, open alcove and negligible trace condition retained. |
| 2.1 colours | [0]=0, [1]=1, [2]=v+v⁻¹; v=1 limit n; V₂=X²−1; ε=−1 outside family. | Use supplied lattice, formal Cartan extension and regular Clebsch–Gordan comparison. |
| 2.2 coloured Jones | Unreduced unknot [N], reduced 1; positive V₁ framing q^(3/4)[2]; split product. | Divide before root evaluation. |
| 2.3 Jones comparison | Right trefoil t+t³−t⁴; t=q⁻¹ at q=2 gives 9/16, versus −6 at t=q. | Inverse variable and existing proved control retained. |
| 2.4 cyclotomic colours | n=0 all unit; P₁=X−v−v⁻¹; distinct single/triple brace denominators. | Fraction-field and integral rescaling distinction retained. |
| 2.5 even center | σ₀=1; σ₁=C²−q−2−q⁻¹; i>n action vanishes. | Unique central coefficients, not unique arbitrary scalar digits. |
| 2.6 trace duality | (m,n)=(0,0),(0,1); quantum-binomial factor before rescaling. | Pairing normalization retained. |
| 2.7 cyclotomic expansion | Unknot coefficient a₀=1, others 0; actual knot invariant, not arbitrary completion element. | Integral bottom-knot prerequisites retained. |
| 2.8 colour determination | n=1 first congruence; n=0 excluded; a nonzero ideal is not equality to zero. | Exact ideal and earlier-colour range retained. |
| 2.9 truncation | N=0 gives 0; n=0,N=1 gives 1; equality for unknot needs n<N. | Finite truncation and order of evaluation retained. |
| 2.10 cyclotomic algebra | P₀ unit; P′₁ multiplication has rescaling factors; twist series is not a finite polynomial. | Factorial filtration retained. |
| 2.11 integral traces | Unit/P₀=1; unequal PBW weights trace zero; arbitrary fractional colours excluded. | Integral colour hypotheses retained. |
| 2.12 link divisibility | Unknot; algebraically split zero framing; Hopf excluded. | Linking and framing assumptions retained. |
| 2.13 scalar completion boundary | (1−q,−1,0,…) represents zero; Hopf not algebraically split. | Added explicit failure of unrestricted factorial uniqueness. |
| 2.14 unified Kashaev | Unknot 1; order one keeps a₀; factorial inversion contributes (−1)^n q^(−n(n+1)/2). | Sign and truncation conventions retained. |
| 2.15 Kashaev/function | N=1,…,6 give 1,5,13,27,46+2√5,89; another fifth-root embedding gives 46−2√5; period one. | Canonical root, Galois change and N≥1 domain retained. |
| 3.1 twist element | V₀ pairing 1; opposite twists multiply to 1; surgery sign uses ω^(−ε). | Completion and inverse sign retained. |
| 3.2 twisting | ±1 unknotted surgery component; negative framing inserts positive twist. | Unknottedness/linking domain retained. |
| 3.3 unified invariant | Empty surgery 1; split ±1 unknot normalization; [2] is not an integral homology sphere. | Admissibility and summability retained. |
| 3.4 independence | Empty and +1-unknot presentations; allowed Hoste move; inadmissible presentation excluded. | Refined calculus, not ordinary braid equivalence, supplies descent. |
| 3.5 first divisor | (q+1)(q³−1) vanishes at 1, −1 and primitive cube roots; derivative at 1 is 6. | Exact divisor and existing derivative example retained. |
| 3.6 products/orientation | S³ factor 1; mirror q↦q⁻¹; inversion twice identity. | Orientation action on coefficients retained. |
| 4.1 Kirby colour | Raw r=0,1 empty; r=2 unit; r=3 excludes V₂. | Geometric root-order domain r≥2 retained. |
| 4.2 WRT | Empty surgery 1; separate positive and negative unknot Gauss normalization. | Nonzero denominators and lift retained. |
| 4.3 evaluation | Root one handled separately; exact root order d kills factorial terms n≥d. | Compare with conventional WRT only on its allowed domain. |
| 4.4 Galois/integrality | Value algebraic integral; changing primitive root conjugates the value. | Equivariance, not pointwise Galois invariance. |
| 4.5 determination | Integral Habiro coefficients; qualifying infinite root set; disconnected coefficient completion. | Exact rigidity hypotheses retained. |
| 4.6 odd-prime uniqueness | Integral series and convergent p-adic substitutions; complex convergence unnecessary. | p-adic, not analytic, uniqueness statement retained. |
| 4.7 Ohtsuki | S³ gives 1; constant coefficient 1; linear coefficient divisible by 6. | No unsupported Casson comparison restored. |
| 4.8 other completions | Product projection loses a component; rational coefficients change separation. | Negative boundary retained. |
| 4.9 manifold domain | 2-framed unknot yields H₁=ℤ/2. | No rational-homology-sphere extension asserted. |
| 4.10 parity | v² trivial versus v nontrivial; K² trivial; zero tensor factors; A₂ sign. | Full coefficient parity retained. |
| 4.11 core filtration | Zero tensor factors give scalar Habiro data; odd v excluded; factorial vanishes at low-order roots. | Integral intersection and AL1/AL2 retained. |
| 4.12 general colours | λ=0 rank 1; sl₂ balanced integer; sl₃ first fundamental quantum dimension [3]→3. | Import generic lattice, retain formal Cartan/trace comparison. |
| 4.13 strong Kirby colours | Root-order bound equality excluded; vanishing Gauss lift excluded; root one separate. | Lift-sensitive domain retained. |
| 4.14 specialization | r=3 V₂ negligible; multiplication by 2 on finite-free rank one is not an isomorphism. | No generic-semisimplicity argument over a nonfield. |
| 4.15 WRT comparison | Separate ± Gauss sums; only admissible root lifts. | Exact specialization domain retained. |
| 4.16 general unified theorem | sl₂ specialization; value at one 1; additional root evaluations as extension. | Every simple Lie type retained with stated integral core/root restrictions. |
| 5.1 ideal shapes | z=0,1 excluded; regular z=e^(πi/3); flat z=2 gives companions −1,1/2 and volume zero; zz′z″=−1. | Preserve revision 2's flat/nonflat distinction and proved flat check; R1 has a geometric supplier plan. |
| 5.2 cusps/rigidity | Figure-eight pair; dilation holonomy gives incomplete cusp; reverse orientation; flat shape 2 versus degenerate 1. | Oriented rigidity and regular-refinement domain retained. |
| 5.3 gluing | Product 1 does not select logarithmic 2πi; Im z<0 fails positivity; parabolic translation admitted. | Log branch, completeness and positivity remain separate. |
| 5.4 flattening | p=q=0; regular logs πi/3,πi/3,−2πi/3; one log alone misses sheet data. | Cover/parity conventions retained. |
| 5.5 extended pre-Bloch | Transfer rectangle; invalid lifted sheet relation excluded; omitting transfer changes torsion. | Both relation families retained. |
| 5.6 extended Bloch | Zero class; transfer wedge cancellation; p-shift at z=1/2 has nonzero boundary. | Integral exterior-square convention not silently identified with another Bloch convention. |
| 5.7 lifted five term | Forget sheets; invalid flattening excluded; alternating signed 2–3 relation. | Actual lifted relation hypotheses retained. |
| 5.8 strong flattening | Edge logarithms zero; odd path parity fails; ordered/unordered torsion differs. | Log and parity conditions both retained. |
| 5.9 manifold class | Figure-eight projects to 2[z₆]; cusp lift choices; orientation reversal changes sign. | Independence theorem retained, with its geometric supplier. |
| 5.10 Rogers | z=1/2 gives −π²/12; p+2 changes by −πi log 2; real π² period. | Branch and period normalization retained. |
| 5.11 volume/CS | R=iVol−CS; GZ V=−conj R; orientation reversal; two regular tetrahedra. | Exact convention retained; no further missing Milnor plan at R1. |
| 5.12 number-field class | Figure-eight ℚ(√−3); selected isolated solution; integral convention maps. | Explicit field/shape data required. |
| 5.13 diagram boundary | Figure-eight satisfies geometry/field tests; trefoil fails hyperbolicity. | Four independent obligations retained. |
| 6.1 NZ/Hessian | B=0 excluded; z=1 excluded; half datum Hessian 2; N=0 vacuous. | Linear algebra does not certify a manifold or a nondegenerate saddle. |
| 6.2 formal NZ | Constant coefficient 1; odd Gaussian moment zero; prefactor conventions. | Coefficientwise finiteness and normalization retained. |
| 6.3 formal invariance | Nondegenerate 2–3 move; regular EP path; geometric rather than arbitrary representation. | No rootwise/topological theorem inferred from a formal local identity. |
| 6.4 NZ–Nahm | det B nonzero versus unit; integral parity vector; rational symmetric matrix need not be integral. | Exact integral Nahm domain retained. |
| 6.5 root data | k=1 empty product; k=2 gives 1+x; zero normalization excluded; weighted mean 4/3. | Root/one-loop choices and normalization retained. |
| 6.6 root series | Constant 1; odd √h moments zero; two cubic vertices contribute at h¹. | Filtered expansion retained; topology not promoted from a conjecture. |
| 6.7 arithmetic descent | Kummer subgroup; periodic weights; root rotation compensated by finite-index translation; τ^(2k). | Arithmetic theorem remains separate from knot identification. |
| 6.8 Habiro comparison | Nonintegral Nahm data excluded; bad primes excluded; split B retains both factors; unmatched phase fails. | Explicit full-B supplier contract and unresolved owner action added. |
| 6.9 Faddeev integral | b=0 excluded analytically; b=2,1/2 heights π/4; b=1 height π/2; strip boundary excluded. | Integrability/continuation separate from totalized raw Lean definition. |
| 6.10 equations/unitarity | b=1; b=e^(πi/3); b=i,2i excluded; pole identities meromorphic. | Full allowed real/unit-circle domain retained. |
| 6.11 Schrödinger pair | Gaussian commutator sign; slow-decay function outside position domain; chirp conjugates to p+q. | Existing unbounded spectral calculus consumed; common core retained. |
| 6.12 operator pentagon | Standard representation; closure of p+q; real and unit-circle parameters. | Domain/closure hypotheses retained. |
| 6.13 selected integrals | Pole-boundary contour excluded; b=1 means ℏ=1/4; 5₂ phase e^(−iπ/3). | n=2,3 contours and convergence retained. |
| 6.14 selected volume | Positive b→0; selected nondegenerate saddle; exponential decay −Vol. | No conversion into general Kashaev growth; uniform tails remain proof obligations. |
| 6.15 positive shapes | a=b=c=1/6; boundary edge not fully balanced; zero charge excluded; punctured S³ homology test. | Positivity, gauge and admissibility remain distinct. |
| 6.16 distributions | δ² forbidden; empty wavefront does not imply tempered product; e^(x²) local only; divergent fibre integral excluded. | Existing local/tempered distinction and contraction seminorm conditions retained. |
| 6.17 charged kernel | Regular charges; a=0 fails positivity; delta support hyperplane. | Fourier phase and orientation-adjoint conventions retained. |
| 6.18 charged pentagon | Five charge equations; nontrivial scalar phase; positive contraction domain. | Level compensation and admissibility retained. |
| 6.19 leveled invariant | ℏ=1 unit-circle parameter; 4ℏ shift gives −1; 8ℏ shift gives 1; empty boundary scalar. | ℏ≠0 and partial composition retained. |
| 6.20 AK invariance | Required H₂ vanishing after composition; positive vertex-preserving moves; orientation adjoint. | No invariance for arbitrary inadmissible complexes. |
| 7.1 BD theorem | Ten named knots; 7₂ excluded; positive/negative q conjugation; bounded denominators. | Analytic all-order error/domain retained. |
| 7.2 arithmetic expansion | Figure-eight one-loop 3^(−1/4) versus normalized GSW coefficient 1; 5₂ root branch. | Field/normalization and R2 qualifications retained. |
| 7.3 formal/analytic boundary | Arbitrary formal series has no remainder estimate; leading AK asymptotic differs from BD all orders. | No analytic conclusion from formal membership. |
| 7.4 representation family | Trivial weight 3/2, other weights 0; cardinalities 3 and 4; nonisolated saddle excluded. | Selected data, not every arbitrary representation. |
| 7.5 QMC | c=0 excluded from the displayed finite-pole form; S at integers; bounded denominators. | Exact conjectural domain retained. |
| 7.6 volume conjecture | S sends N to −1/N; mirror/root conjugation; AK decay is a different evaluation. | General knot statement remains conjectural. |
| 7.7 denominator/tweak | λ_T=0; λ_S(1)=1; S at 0 pole; γ and −γ agree. | Signed reduced denominator and both composition pole exclusions retained. |
| 7.8 generalized QMC | Trivial representation recovers scalar case; nontrivial weight zero; cX+d eventually positive. | Conjectural normalization retained. |
| 7.9 series lift | h=0 reduction; exact infinitesimal Möbius coordinate; rational asymptotics do not permit differentiation. | Coefficientwise conjecture retained. |
| 7.10 quadratic relations | Figure-eight cancellation uses i²=−1; trivial representation excluded. | General/5₂ statements remain conjectural. |
| 7.11 coefficient growth | Distinct actions; figure-eight phase; finitely many coefficients do not establish large-n error. | Source discrepancy and conjectural boundary retained. |
| 7.12 matrix QMC | Scalar weight signs; square selected matrix; invertibility not automatic. | Unresolved convention comparison retained as conjectural. |
| 7.13 matrix cocycle | J=j̃=I; singular J excluded; noncommuting factors; J(0)=A,J(1)=I yields A. | Ordered product, intermediate invertibility and proved control retained. |
| 7.14 analytic extension | c=0 no finite pole; c≠0 pole −d/c; opposite cut domains. | Analytic extension remains conjectural. |
| 7.15 descendants | q=1 gives 1 for N>0; q=−1 gives 5 or −3; primitive cube root gives 13; half-row coefficient −1/2. | Integral H_m versus scalar-extended half-row distinction retained. |
| 7.16 AK comparison | Selected 4₁/5₂ theorems versus general conjecture; explicit phases/limit domains. | No universal formal/analytic comparison asserted. |
| 7.17 Habiro interfaces | H₀ integral; half-row not integral; rootwise formal series alone insufficient. | Full-B supplier extension explicitly required. |
| 7.18 example ledger | Fifth-root 46±2√5; determinants 5 and 7; τ=ξ⁻¹ with discriminant divided by ξ². | Root/field conventions retained; empty cell is not zero. |

### Every admitted Lean signature and its active hypotheses

| Signature | Cases / hypothesis check | Result |
| --- | --- | --- |
| `isUnit_det_of_isAdmissible` | m=0 determinant 1; rank-one ±1; [0] fails admissibility. | Correct matrix-only generality. |
| `handleSlide_apply_self` | Symmetric Hopf matrix gives new diagonal 2; i=j is excluded. | Symmetry and distinct-index hypotheses present. |
| `linkingCokernel_handleSlide` | Distinct-index transvection has determinant 1; arbitrary nonsymmetric A allowed. | Cokernel isomorphism does not require symmetry. |
| `admissibility_not_descends` | Same ordinary one-strand Markov braid at framing 0 and 1. | Existing proved control fixes the forgotten-framing distinction. |
| `qdim_color` | n=0,1,2; Chebyshev recursion. | [n+1] matches the n+1-dimensional colour. |
| `qdim_cycloColor` | n=0 gives 1 and is excluded; n≥1 has vanishing first factor. | `0<n` present. |
| `colorTruncation_unknot` | N=0 cannot satisfy n<N; n=0,N=1 gives 1. | Truncation hypothesis present. |
| `casimirSigma_eval_color` | i=0 never satisfies n<i; i=1,n=0 has a zero brace factor. | Strict inequality correct. |
| `figureEightKashaev_values` | N=1 through 6; another fifth-root embedding changes sign of √5 term. | The theorem uses the canonical exponential root. |
| `extendedDehn_transferElement` | p=q=p′=q′=0; mixed rectangle; πi∧πi=0 over ℤ. | Bilinear transfer cancellation, no geometric assertion. |
| `NZDatum.hessian_isSymm` | N=0; B=0 excluded; half datum Hessian 2. | Symplectic ABᵀ identity and nonzero det B present. |
| `NZDatum.nahm_isSymm` | Unit det B over ℤ versus merely nonzero determinant. | Integral inverse has the required stronger hypothesis. |
| `faddeevPhi_inv` | b=0 and arbitrary z are allowed only as raw total integral expressions; b↔b⁻¹ swaps denominator factors and contour height. | Algebraic identity valid without asserting analytic continuation. |
| `levelPhase_add_eight_mul` | ℓ=0; 8ℏ shift has exponential 2πi; 4ℏ gives −1. | ℏ≠0 present. |
| `denominatorCocycle_mul` | T, S at 1; S at 0 excluded; both intermediate/final poles. | Both nonzero denominators present. |
| `denominatorCocycle_neg` | T and S; numerator/linear denominator both change sign. | Valid also for the raw totalized pole value 0. |
| `knotMatrixCocycle_mul` | Empty matrix index; identity matrices; noncommuting matrices; singular intermediate J excluded. | Finite decidable index, intermediate Möbius domain, unit determinant and ordered jt law present. |
| `figureEightDescendantTrunc_recurrence` | Any commutative ring; unit q=1; N=0 residual −1 is divisible by 1; N=1 residual q^(m−1)(q−1)²; characteristic two. | Congruence, not equality for arbitrary q; no field or root assumption hidden. |

All remaining light definitions and proved examples were read with their variable blocks.
Empty products/sums, the raw N=0 Kashaev sum, totalized division at shape or Möbius poles,
the rank-one half datum and zero third charge were checked against their README domains.
The continuous module category, generic/formal quantum comparison and full-B modules have no
carrier at the pins, so they stay in the README and closing Lean comment. No sorry'd carrier,
fake replacement type, auxiliary development or extra example family was introduced. The
2026-10-12 shape rule's one or two representative examples per kept light definition takes
precedence over the issue's older blanket mirroring wording.

## Validation and next step

- `lean-check` on the final rebased package Suggested.lean, including the retained proved flat
  check: **exit 0; exactly 18 warnings, all declaration uses sorry; no errors or other warnings**.
  No library build or language server was run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, 106 nodes, 206 API items, 159 packet tests, 36 planets. The eight
  existing gaps, 19 requests and zero closed stages are preserved; the packet is not a deliverable.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: **passes**.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  **4 files, 0 problems**.
- `git diff --check`: **passes**.

Resume with the HabiroNumberFields owner action and the maintainer's publication decision above,
then independently review this fix. No second issue was claimed. No instruction embedded in an
untrusted comment, upstream PR file or fetched paper was executed; no suspicious instruction
was encountered. No private source file, source excerpt or local filesystem path is submitted.
