# Independent review: PrismaticCohomologyPartII

Issue: #10237. Reviewer: Codex, session `codex-85Z6Vg`. Date: 2026-10-17.
Verdict: **accepted with the corrections in this submission**.

This reviews the split package from #10228: Layers 3–5, containing 86 numbered
subsections (27, 32 and 27 respectively). The inherited fix verdict was not an
independent review; `review.json` now records this review. The reviewed author
was Codex session `codex-68yXMm`, a different worker.

## Scope, shape and prerequisite closure

The package is a roadmap, not a claim of a formalization. Its README retains the
targets, hypotheses, APIs, Checks, source locators and worked examples. Heavy
carriers stay there; the Lean file contains two light, real-bodied definitions
and statements/examples over existing carriers. Its closing comment identifies
the families absent from Lean. The upstream models read were AdicSpaces and
LocalFieldsRamification, together with the supplied exemplar and upstream guide.

The file named `packets/PrismaticCohomologyPartII.json` describes an older
Dieudonné roadmap with PD.0–PD.7 stages. It is not the plan for this split.
Comparison therefore used the parent PrismaticCohomology packet, the original
`PrismaticCohomology--PR.0.json` and the preceding fix handoff. Original PR.3,
PR.5 and PR.6 supply the Nygaard, absolute and q-crystalline material now in
Layers 3, 4 and 5. No Dieudonné target was silently substituted, and no packet
was edited.

Part I supplies Layers 0–2. Parts III–IV and PadicHodgeTheory occur as
consumers, not prerequisites. The reference from §3.24 to §5.26 is an
application of the earlier criterion: its q-model instance is proved in Layer
5. Similarly, §3.26 supplies only the prismatic recognition and continuity
inputs; the trace comparison is in Part III. The unused AI.7.2–AI.7.3 supplier
row, inherited from the unsplit package, was deleted. EnhancedDerivedSheaves
E0/E5:abstract and AlgebraicVectorBundles Layers 0A–0B now have explicit
contracts; the E2 row now includes its Layer 4 use.

Every linked internal prerequisite was checked. The internal target graph is
acyclic and has no edge to a later layer. Within-layer construction order is
given by its explicit links. No `FoundationsAndLibraryIntegration` or
`UPSTREAM:` prerequisite is left. Complete formal QCoh (§4.0), complete
framing (§5.0), q-derivatives on envelopes (§5.15), multiplicative comparison
(§5.18), and arbitrary coordinate naturality (§5.22) remain explicit local
targets rather than unstated supplier theorems. In particular ordinary module
descent is not being used as enhanced formal-stack descent.

The roughly 250 KB README remains substantial, but this part has three coherent
layers and a compact representative Lean file. No further split or compression
is needed for this review. All 86 section anchors and all 134 named Check
identifiers survive. No target was shortened by deleting hypotheses or tests.

## Library and ownership audit

The pinned baseline was Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The current read-only comparison
used TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, current
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and its Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Searches used mathematical
objects as well as declaration names: Frobenius divisibility, filtered
truncation, invertible module maps, Witt coordinates, formal completion,
descent, commuting operators and skew products. All current roadmap and
Completed Lean files were included, including the nine roadmaps newer than the
atlas snapshot and the four named completed roadmaps.

`data/library-coverage.json` was read, including its related delta/Witt and
enhanced-algebra audit entries. It has no dedicated entry certifying this
split package, so it was not treated as proof of absence. The local declaration
statements were checked directly. The relevant Mathlib interfaces include
Witt vectors and their operations, `Module.Invertible`, ideal cotangents and
quotient transitions, cyclotomic identities, scalar extension, comonadic
faithfully flat module descent, and pseudofunctor descent data/stack predicates.
The nonunit-p restriction of `WittVector.fontaineTheta` is retained. Neither
ordinary `DerivedCategory` nor the existing ordinary DG-algebra carrier
supplies the missing enhanced/skew prismatic constructions.

| Candidate overlap | Disposition |
| --- | --- |
| `Prismatic.Decalage.eInfinity` in §3.0 | Deleted as a new target. AInfCohomology §§AI.1.3–AI.1.4 supply lax monoidal décalage, its Bockstein comparison and the ideal-power Beilinson description. The existing computations are retained as checks on the supplied interface. |
| `QCrys.qInteger_mul_sub_one` | Deleted as a new theorem and README API target. Mathlib `Algebra.Ring.GeomSum:geom_sum_mul` is exactly the polynomial-sum identity, with no cancellation hypothesis. Its use remains a proved Lean example and `#check`. |
| Ordinary Cartier/effective Cartier divisors | Deferred in Scope to Tau Ceti `AlgebraicGeometry.EffectiveCartierDivisor.Basic:IsEffectiveCartier` and its flat pullback theorem, and `AlgebraicGeometry.CartierDivisor.Basic:CartierDivisor`. §4.2 now explicitly concerns arbitrary line-module maps, including noninjective maps, and comparison of their injective locus with the existing predicate. No ordinary divisor theory is newly planned. |
| Ordinary quasi-coherent sheaves and affine finite-projective descent | Imported from current AlgebraicVectorBundles Layers 0A–0B and the module-descent APIs. §4.0 retains the distinct pointwise stable/monoidal limit, formal-complete and coherent-comodule interfaces. |
| Part I prism/site/derived-prismatic foundations | Imported by section. §4.17 adds absolute-family/relative-site comparison interfaces, not a second animated-prismatic construction; §4.6 adds compatibility of existing coproducts with stack charts. |
| General Beilinson connective-cover multiplicativity | Kept in §3.0 with an explicit distinction: arbitrary filtered objects, beyond AInfCohomology's ideal-power décalage input. The underlying filtered category, tensor and t-structure are suppliers. |

These are the complete removals/deferrals found in this pass. No new ownership
was assigned to Parts III–IV or PadicHodgeTheory.

## Sources and corrections

There were no author-flagged unverified locators. For reproducibility, the
sample was `random.Random(10237).sample(section_ids, 15)`, where section IDs
are in README order. The versions are those in the README bibliography;
page numbers below are printed pages. Public sources and the cleared local
Bhatt–Scholze/BMS copies were read directly. No source file or source passage
is included in this submission.

| Sampled target | Numbered source checked | Result |
| --- | --- | --- |
| 3.0 | BMS2 Definition 5.3, Theorem 5.4, p.29; Proposition 5.8, p.32; Corollary 5.10, p.33 | Corrected the old pp.31–32 placement of the monoidal argument. Restricted the retained target to the general filtered cover after the duplication audit. |
| 3.3 | BS22 Proposition 12.8 and its proof, pp.90–91 | Expanded the locator to include the base-change/descent argument on p.91. |
| 3.18 | BS22 Corollary 15.5, p.104; Theorem 1.8(6), p.5; BMS1 Lemma 6.9, p.51 | The README already corrects the printed direction of V. Corrected the introductory theorem's locator from p.4 to p.5. |
| 3.19 | BL22 Construction 5.2.1 and Propositions 5.2.2–5.2.3, pp.119–120; Corollaries 5.2.8–5.2.9 and 5.2.15, pp.122–123 | Corrected the degree-zero assertion to the identity on the associated graded Rhat, not a map R→R between filtered zeroth terms. Retained the corrected cohomological shift. |
| 3.24 | BMS2 Proposition 8.7, p.57, Proposition 9.10, p.72, Remark 9.11, p.73 | Retained q=[epsilon], d=xi, d'=phi(xi); the printed q=[epsilon]−1 is not the q-parameter. BMS1 Definition 9.5 agrees. |
| 3.26 | BS22 Lemma 13.2 and Theorem 13.1 with proofs, pp.94–96; Proposition 15.7, p.105 | Expanded the proof locators; trace statements remain contextual consumers, not inputs. |
| 4.9 | BL22 Definition 3.3.1 and Examples 3.3.3–3.3.4, p.43; Corollary 3.3.11, p.44 | The pointwise/formal and totalization descriptions agree. |
| 4.10 | BL22 Proposition 3.3.5 and Warning 3.3.6, p.43; Remark 3.3.7, Example 3.3.8 and Lemma 3.3.10, p.44; BS23-FCRYS Proposition 2.7, p.6 | Bounded-prism and perfect-crystal qualifications agree; no arbitrary unbounded formal-ring identification is inferred. |
| 4.14 | BL22 Theorem 3.5.8, p.50; Propositions 3.5.10–3.5.11, Example 3.5.12, Corollaries 3.5.13–3.5.14, Proposition 3.5.15 and Corollary 3.5.16, pp.51–53 | Retained the precise essential image. Added explicit allowed and excluded p=2 operators, tensor weights and derived-fibre checks. |
| 4.19 | BL22 Propositions 4.4.8 and 4.4.12, pp.91–92; Example 4.4.13, p.92; Remark 4.4.21, p.94 | Perfectness is required for the absolute/relative isomorphism, not for the general comparison map. |
| 4.26 | BL22 Notation 3.8.1, p.68; Proposition 3.8.6, p.70; Corollary 3.8.8, p.72; Proposition 3.8.12 and Warning 3.8.13, p.73 | The all-prime chart/torsor assertions are distinguished from the odd-prime quotient theorem. Added a Lean p=3 unit-factor witness. |
| 5.3 | BS22 Remarks 16.3–16.4, p.107 | q=1 specialization and the reduction adjunction agree, with complete p-regular carriers retained. |
| 5.13 | BS22 Theorem 16.18 and its proof, p.113 | The twisted R^(1), direction of the site map and smooth hypotheses agree. |
| 5.15 | BS22 Construction 16.20 and Lemma 16.21, pp.114–115; envelope construction in Lemma 16.10, pp.110–111 | The finite-free thickening is an explicit additional construction, not a claimed verbatim source theorem. Checked its relation and Frobenius at p=2,3; added the cubic Check and Lean example. |
| 5.26 | BMS2 Remark 9.11, p.73; BS22 Theorem 17.2, p.117 | The Frobenius pullback and the distinct xi/xi-tilde divisibilities are retained. |

Additional source checks covered the formal-QCoh foundation: SAG Definition
6.2.2.1 and Remarks 6.2.2.5–6.2.2.7, pp.490–492, Propositions 6.2.3.1 and
6.2.3.4, pp.492–493, Proposition 6.3.4.1 and Corollary 6.3.4.3, pp.505–507;
HA Propositions 4.6.1.11, p.620, and 7.2.4.4, p.1263; BL22 pp.42–44 and
91–92. In §4.0, “Notation 3.3.2” became “Remark 3.3.2”, Warning 3.3.6 was
moved to p.43, and Theorem 3.5.8 to p.50. The spectral references are used for
the stated enhanced pointwise construction and flat/derived-square adapters,
not to justify ordinary nonflat base change.

## Adversarial pass

The following table covers all 86 numbered target blocks, their APIs and their
associated layer examples. “Retain” means that the stated hypotheses and
construction pass the listed computations; it does not assert a Lean proof of
the heavy target. Zero rings and zero complexes are allowed by the conventions;
nonexamples invoking a nonzero element explicitly require a nonzero ring.
Fractions below denote the named integral envelope/PD elements or inverted
line modules, not division by an unproved unit.

| Statement/API block | Instances and computed obstruction | Result/change |
| --- | --- | --- |
| 3.0 Beilinson cover | Step unit is fixed; a graded T[−i] is connective, T[−i−1] is excluded; constant T has zero graded pieces but is not killed by the cover. The eta model of [T→dT] is acyclic. | Added three cover-specific Checks; removed duplicate décalage target. |
| 3.1 QRSP Nygaard ideals | i=0 gives B; for phi=id on Z_p, Fil^i=p^i; for perfect phi, the generator is phi^−1(d), not d. Zero ring gives zero ideals. | Retain Frobenius-preimage definition, with no completeness claim. |
| 3.2 q-divided-power key case | n=0 retains exponents i<p; n=1 retains i<2p; q=1 yields factorial denominators, with the root coefficients retained. | Retain max(n−floor(i),0) and X→Y^p normalization. |
| 3.3 Good filtrations | S=R gives (e^i); two root coordinates add their floors; relatively perfect base change preserves the discrete tensor model. | Retain relative regularity; expand locator. |
| 3.4 Derived Nygaard | Base R has gr^0=phi_*R, not A; a one-variable smooth chart has the degree-one forms in higher graded steps. | Retain reduction, twist and semilinear action. |
| 3.5 QRSP graded pieces | Perfectoid base gives R in degree zero; the key case has the i<p(n+1) span. | Retain conjugate filtration and divided-phi quotient; no blanket separatedness inference. |
| 3.6 Transversality and I_r | q-prism gives I_r=([p^r]_q); nonzero crystalline prism fails transversality; an Eisenstein quotient is p-regular. | Retain. |
| 3.7 Transversal approximations | q→1 approximates the crystalline prism; perfect prisms with characteristic-p quotient still need approximation; two q-charts use a coproduct. | Retain existence/descent rather than asserting the input is transversal. |
| 3.8 Transversal twist | Weight one reduces to I/I²; q-generators satisfy the p transition; Frobenius has target I^−1⊗A{1}. | Retain pole direction. |
| 3.9 General twists | Weight 0 is A; negative weights are duals; over Z_p Frobenius on weight n scales by p^−n in its allowed target. | Retain orientation independence and integer weights. |
| 3.10 Divided Frobenius | phi_0=phi; on Z_p, phi_1(p)=1 but phi_1(p²)=p. Thus phi_1 is not an unweighted ring map. | Retain weight-adjusted multiplication. |
| 3.11 q/crystalline twists | q-prism scales by [p]_q^−1, crystalline prism by p^−1; distinct chart generators differ by a unit. | Retain noncanonical trivializations. |
| 3.12 Large algebras | Empty root set gives A/I; ordinary polynomial coordinate has dX not p-divisible. | Retain positive and negative cases. |
| 3.13 Relative large Nygaard | R=A/I gives Delta^(1)=A and Fil^i=I^i; gr^0=R. | Retain relative identity map, rather than untwisted Frobenius preimage. |
| 3.14 Relative derived Nygaard | Crystalline and perfect-base specializations agree after phi pullback; base ring filtration is I^i. | Retain phi_A^*Delta as the carrier. |
| 3.15 Relative graded pieces | Degree zero is R; a smooth line contributes Omega^1 in degree 1 for n≥1; large inputs are discrete. | Retain conjugate truncation and twists. |
| 3.16 L-eta factorization | Base ring gives identity A→A; crystalline model recovers p-decalage; I-torsion is removed in the cohomology formula. | Retain smoothness and torsion quotient. |
| 3.17 General de Rham comparison | R=A/I gives A/I; crystalline bases with nonreduced quotient remain within the bounded-prism theorem. | Retain all bounded prisms, not only the earlier restricted comparison. |
| 3.18 Image of Frobenius | i=0 gives inverse maps; crystalline i gives p^i; P¹ has weight −1 and the expected single-I divisibility in H². | Retain corrected V direction; repair p.5 locator. |
| 3.19 Nygaard/Hodge map | Base ring gives I⊗I^(n−1)→I^n→0 for n≥1 and I→A→A/I for n=0; animated/noncomplete inputs require Rhat on gr^0. | Corrected gr^0 identity; retained [−n] and derived completion. |
| 3.20 Nygaard completion | Z_p is complete; the root-quotient example is not; quotient projections are onto. phi-hat maps Bhat→B, while c phi-hat is an endomorphism of Bhat. | Corrected codomains in the named Frobenius Check. |
| 3.21 Completeness criteria | Smooth dimension 0 is I-adic; dimension 1 stabilizes from step 1; the QRSP exponential example has nonzero lim¹. | Retain the separate separation and lim¹ criteria. |
| 3.22 Completed colimit | Relative dimension 0 cancels I^−m⊗I^m; transport by phi^−1 cancels e^−m⊗e^m; smooth dimension d stabilizes from d. | Made the transported perfectoid example explicit and removed ambiguous “d=0”. |
| 3.23 Incomplete QRSP example | Partial exponential sums are Nygaard-Cauchy but their coefficients do not tend to zero p-adically; low-floor coefficients satisfy the completion condition. | Retain genuine nonsurjectivity example. |
| 3.24 Coordinate criterion | p-crystalline case gives p^max(i−n,0); q-model uses xi in the filtration and xi-tilde after phi. | Retain Cartier/injectivity hypotheses and defer the q-instance to Layer 5. |
| 3.25 Delta continuity | delta(p^i)=p^(i−1)−p^(pi−1); delta(e²) can be nonzero mod e, so a one-step Nygaard drop is false. | Retain mixed-topology continuity, including zero ring. |
| 3.26 Prismatic recognition | i=1 continuity bound is vacuous; recognition checks reduction modulo (p,d), not an unconstrained Frobenius map. | Retain separate prismatic input; expand proof locators. |
| 4.0 QCoh/formal foundation | Empty prestack has the zero category; affine gives D(R); B(Z/2) over F₂ has H¹=F₂; Q is not dualizable over Z. Z→F_p self-intersection has an H^−1 Tor term. | Strengthened the empty-case negative control; retained derived/flat base-change restrictions and corrected locators. |
| 4.1 Absolute site | Perfect-base object is final in the opposite site; characteristic-p structure forces I=(p); a noncommuting structure map is not an arrow. | Retain bounded objects and site direction. |
| 4.2 Generalized divisors | Zero map is noninjective for nonzero R; a unit gives the empty divisor; multiplication by p loses injectivity over F_p; automorphisms satisfy uf=f. | Explicit isomorphism arrows; identify injective locus with existing effective divisors. |
| 4.3 Cartier–Witt divisors | V(1) has coordinates (0,1,…); 1 fails nilpotence, a Teichmüller vector fails distinguishedness; p has second coordinate 1−p^(p−1). | Retain both conditions, including p=2. |
| 4.4 WCart stack | Zero ring gives a contractible groupoid; dual numbers give nontrivial automorphisms; coefficient maps preserve distinguishedness. | Retain stack/groupoid, not a set-valued formal scheme. |
| 4.5 Quotient presentation | Trivialized line gives a distinguished vector; changing basis multiplies by a Witt unit; double fibre product retains that unit. | Retain actual quotient groupoid and Čech powers. |
| 4.6 Chart coproduct adapter | Identity chart gives the same point; two charts use the already supplied coproduct and its two maps. | Retain only stack-chart compatibility, no second coproduct construction. |
| 4.7 Prism points | Crystalline point is multiplication by p; oriented I gives a principal object; forgetting Witt data gives the original pulled-back line map. | Retain nilpotent-adic test-ring restriction. |
| 4.8 Chart fibre products/flatness | Crystalline chart is nontransversal and not flat; universal oriented chart is transversal; zero chart is not faithfully flat. | Retain B≠0 in faithful flatness. |
| 4.9 WCart QCoh | Unit pulls back to A; I^0=O; I is detected as nontrivial by its weight-one Sen action. | Retain derived completed pullback and restricted ordinary base change. |
| 4.10 Crystals | Unit crystal is A on each prism; integer twists give invertibles; restriction to a transversal atlas uses its full nerve. | Retain monoidal limits and perfect-crystal comparison. |
| 4.11 G_m-sharp | Z_p points give 1+pZ_p, also at p=2; over Q the comparison is an iso; over F₄ at p=2 it is not G_m. | Retain dyadic negative control and flat Frobenius kernels. |
| 4.12 HT divisor | In characteristic p, p=V(1); over Z/p² its zeroth coordinate p is nonzero; uV(1)=V(Fu). | Retain HT versus de Rham distinction and automorphism group. |
| 4.13 Sen construction | Unit has Theta=0; I|HT has Theta=1; F([epsilon])=0 for square-zero epsilon. | Retain weight sign and nontriviality witness. |
| 4.14 Sen classification | Weight 1 satisfies Theta^p−Theta=0; dyadic matrix has Theta²−Theta=id; weights 2 and −3 tensor to −1; fib(0) has degrees 0,1. | Added discriminating Checks and proved matrix/weight Lean witnesses. |
| 4.15 Stack Frobenius | F(V(1))=p; F kills the square-zero automorphism; HT is contracted, not preserved over Z/p². | Retain direction, nonfaithfulness and pullback twist. |
| 4.16 Contraction square | Theta=0 gives fibre M⊕M[−1]; unit specialization retains the degree-one term. | Retain full faithfulness only, with no essential-surjectivity claim. |
| 4.17 Relative/animated adapter | Base ring recovers the relative complex; bounded torsion and cotangent amplitude govern site comparison; arbitrary animated input does not get a discrete initial prism. | Retain separate hypotheses for each comparison. |
| 4.18 Absolute sheaf | H_Delta(Z)=O; zero ring gives zero; Delta(F_p)=Z_p but its sheaf is not O on a transversal chart. | Retain sheaf/global-section distinction. |
| 4.19 Absolute versus relative | Perfect base gives an iso; general bounded base still has Bbar⊗^L R in its pullback; QRSP gives the initial prism. | Retain perfectness boundary and nontransversal flat-base-change adapter. |
| 4.20 Absolute descent | Z/p^k derived tower recovers p-complete input; comparison to formal completion uses bounded torsion; filtered colimits are not asserted for absolute global sections. | Retain exact continuity/descent ranges. |
| 4.21 Absolute site comparison | QRSP terminal object gives I^m{n}; a p-quasisyntomic affine has the site comparison; arbitrary bounded formal input has only the comparison map. | Retain p-quasisyntomic isomorphism hypothesis. |
| 4.22 HT/diffracted complex | Z gives diffracted Z_p in degree 0 but HT global sections also in degree 1; twist n changes the fibre operator to Theta+n; gr_j has weight −j and shift [−j]. | Retain fibre rather than ordinary-kernel formula. |
| 4.23 Characteristic-p crystalline | Perfect F_p-algebra normalization uses W(phi^−1); quasisyntomic schemes have an iso; arbitrary schemes are not promoted to an iso. | Retain twist and Frobenius normalization. |
| 4.24 Absolute de Rham | R=Z gives p-complete de Rham Z_p; derived F_p reduction is used for nonflat R; the contraction retains dRhat[−1]. | Retain p-completion rather than Hodge completion. |
| 4.25 Absolute Nygaard | Fil^0=Delta; F_p gives gr^m=F_p; Z gives gr^0=Z_p and gr^1=0, unlike its p-adic filtration. | Retain the pullback definition, integer twists and periodic classes. |
| 4.26 Cyclotomic chart | p=2 gives 1+q; p=3 gives 1+q+q^−1=q^−1[3]_q; changing torsor trivialization is nonunique. | Added Lean unit-factor identity; no odd-p restriction on this chart. |
| 4.27 Cyclotomic Sen calculation | m=0 gives R→R; m=1 has rank two on both sides, including p=2 after torsor trivialization. | Retain the chosen trivialization and Fil_−1=0. |
| 4.28 Derived F_p descent | m<0 gives zero; m=0 reduces to derived p-complete module descent; Tor terms remain in the Čech nerve. | Retain derived reduction, not a discrete faithfully flat cover. |
| 4.29 Absolute graded/completeness | m=0,1 give augmentation; at p=2 the safe iso range is m<2; the root-quotient QRSP example fails completeness. | Retain isogeny for m≥p and regularity conditions for completeness. |
| 4.30 Perfect/QRSP/crystalline Nygaard | Weight n uses exponent m−n; F_p gives p-adic ideals; regular F_p algebra gives de Rham–Witt Nygaard. | Retain comparison-only ownership and each input class. |
| 4.31 Absolute Frobenius | F_p Frobenius is an iso; for Z_p its cofibre is Z_p[−1]; m=n=1 targets ideal degree 0 and m=2,n=1 targets degree 1. | Retain m−n and the existing divided-Frobenius value 6→3 at p=2. |
| 5.0 Framing foundation/q-integers | [0]_q=0, [1]_0=1, [n]_1=n, [2]_q=1+q, [3]_2=7; empty coordinate set has degree-zero envelope. | Replace duplicate geometric-sum theorem by Mathlib; keep two real-bodied notation definitions and framing targets. |
| 5.1 Gamma operation | q=1 gives p gamma(x)=x^p; gamma(p)=p^(p−1) on Z_p; p is not in the Frobenius preimage for the q-prism. | Retain regular [p]_q requirement for unique quotient, never divide by q−1. |
| 5.2 q-PD pairs | (Z_p,(p)) and (Z_p,0) work at q=1; q-prism has ideal (q−1), excluding p. | Retain complete p-regular/Tor conditions and property-not-choice status. |
| 5.3 Delta-PD reduction | q=1 recovers p-complete p-regular PD data; zero ideal works; reduction has the stated adjunction direction. | Retain. |
| 5.4 Homological properties | Identity base change is identity; q−1 reduction detects complete objects, whereas a localization outside the complete category need not. | Retain derived completeness and bounded-below totalization range. |
| 5.5 Extremal ideals | q=1 gives smallest ideal 0; q-prism excludes p from the largest ideal; gamma preserves the Frobenius preimage. | Retain completeness of the ideals, not merely algebraic generation. |
| 5.6 A_inf q-PD pair | xi specializes under residue Witt map to p; phi(xi)=[p]_q; mu=(q^(1/p)−1)xi. | Retain distinction between theta and theta-tilde kernels. |
| 5.7 Envelopes | Empty sequence gives D; one variable adjoins X^p/[p]_q; that element is absent from completed polynomial P; zero ring is harmless. | Retain complete P and relative complete regularity. |
| 5.8 Envelope comparisons | q=1 gives the p-completed PD envelope; empty sequence and identity base change agree; the prismatic ideal uses phi(x_i). | Retain completed, derived base change. |
| 5.9 q-crystalline site | Base object gives D; arbitrary thickening evaluation is not an iso; identities give identity variance. | Retain opposite-site direction and indiscrete topology. |
| 5.10 Čech–Alexander | Base presentation D gives D; envelope-free faithfully flat Čech totalization would give D even for a nontrivial smooth line. | Retain envelopes and presentation independence. |
| 5.11 Crystalline specialization | q=1 is identity; smooth polynomial lift reduces to completed de Rham of its PD envelope. | Retain completed reduction over the reduced PD base. |
| 5.12 Thickening invariance | J=I gives identity; A_inf ideals (mu)⊂(xi) compare a smooth lift with its quotient. | Retain smooth lifting hypothesis and unchanged underlying delta algebra. |
| 5.13 Prismatic comparison | R=D/I gives D on both sides; q-prism twists the base to Z_p[zeta_p]; q=1 gives crystalline comparison. | Retain R^(1) and site-map direction. |
| 5.14 Framed data | Constants have derivative 0; X^(n+1) has derivative [n+1]_qX^n; shifting X to X+1 changes gamma(X) by q−1. | Retain coordinate injections and regularity of tX before quotient arguments. |
| 5.15 Envelope derivatives | epsilon²=tX epsilon gives (X+epsilon)²=X²+(2+t)X epsilon and cubic coefficient 3+3t+t²; z=X^p/[p]_q has derivative X^(p−1). | Added cubic witness; retained construction when X is not regular and zero/new-direction checks. |
| 5.16 q-de Rham | n=0 derivative is 0; q=1 is ordinary derivative; no coordinates leaves the envelope; two commuting derivatives cancel in d¹d⁰. | Retain polynomial/toric distinction, skew product and cochain sign. |
| 5.17 Recognition criterion | Identity satisfies eta compatibility; unit map A→Delta of a nontrivial smooth R fails the required de Rham hypothesis. | Retain a map tied to both specified structure maps, not an arbitrary endomorphism claim. |
| 5.18 Multiplicative q-Poincaré | dX X=qX dX makes d(X²)=(1+q)X dX; central dX gives wrong 2X. Merging two coordinates fails strict skew relations. | Retain coface/coordinate-injection multiplicativity and separate square-zero relation at p=2. |
| 5.19 q-de Rham comparison | Smooth line, torus and empty-coordinate cases agree with site cohomology; q=1 is PD de Rham. | Retain E₁/product comparison through §5.18 and Frobenius. |
| 5.20 Change of framing | X versus X+1 changes derivative of X² by q−1; equal framings give identity; three framings give the refinement cocycle. | Retain derived canonical maps rather than equality of displayed complexes. |
| 5.21 Smooth Z_p q-model | Mod [p]_q, coefficients vanish for p-divisible exponents and are units otherwise; degree-one generator is T^(p−1)dT. | Retain Frobenius-twisted Hodge–Tate ring and single-prime scope. |
| 5.22 All-coordinate map | Point has identity map; torus sends x to its compatible Teichmüller roots; two equal values keep distinct labels/root towers. Parallel label injections need not equalize. | Retain homotopy colimit, no filteredness assertion, and coherent labelled spans. |
| 5.23 AΩ comparison | Point gives A_inf; torus H¹ is an algebraic cokernel on complete coefficients, with nonseparated classes; dropping phi changes the theta fibre's H⁰. | Retain E₁-to-E∞ upgrade through discrete QRSP rings and descent. |
| 5.24 Theta specializations | theta-tilde phi=theta on Teichmüller elements; torus HT H⁰ is R while de Rham H⁰ is O_C; unclosed differential image matters in H¹. | Retain separate fibres and full cokernels, not completed sums of coefficient quotients. |
| 5.25 Uniqueness | Base algebra has only identity over itself; a perfectoid automorphism shows that isolated A-algebra maps without eta/naturality need not be identity. | Retain natural-family and monoidal structure-map hypotheses. |
| 5.26 Coordinate Nygaard | i=1 gives xi in degree 0 and no xi in degree 1; residue Witt base change gives p^max(i−n,0); mod mu alone does not make xi a unit times p. | Retain xi/xi-tilde distinction and the Cartier hypotheses. |

The derivative thickening was checked as an actual finite-free algebra:
`epsilon²=t X epsilon` has basis 1, epsilon. At p=2 and 3 its displayed
Frobenius preserves this relation and gives the required epsilon coefficient
of the coordinate p-th power. Thus construction of the derivative does not
cancel X in an envelope where X might be a zero divisor. The two-direction
tensor thickening retains the mixed coefficient, giving commuting derivatives.
At q=1 it is the square-zero derivative thickening and recovers PD derivations.

## Lean and validation

The file has one opening module docstring, the required namespace, layer
comments, docstrings, no sorry-bodied data, no auxiliary theory development and
no placeholders. No heavy mathematical carrier is manufactured by `sorry`.
The only sorry is the q-integer evaluation theorem. The existing proved
cochain-sign and dyadic-thickening tests are retained; the geometric-sum test
now uses the existing Mathlib theorem.

Ten representative signatures were compared directly with their README
contracts (additional examples were also inspected):

| Lean statement | README match |
| --- | --- |
| `qInteger` | §5.0, finite polynomial sum over any commutative ring, including zero ring. |
| `pAnalog` | §5.0, specialization n=p; the notation is defined for all natural p, while prism statements assume primality. |
| `qInteger_one` | §5.0, q=1 and all n, including n=0. |
| Dyadic `pAnalog` example | §§5.0–5.1, 1+q over the same general ring. |
| Empty-sum example | §5.0, n=0 including q=0. |
| `geom_sum_mul` example | §5.0, no nonzero/cancellation hypothesis on q−1. |
| Dyadic Sen matrix example | §4.14, matrix over F₂ whose Theta²−Theta is identity. |
| Cyclotomic unit example | §4.26, q is a unit, so 1+q+q^−1 differs from [3]_q by q^−1. |
| Two-operator cochain example | Conventions/§5.16, arbitrary module with an explicit commuting-operator hypothesis. |
| Cubic derivative-thickening example | §5.15, arbitrary commutative ring with the defining quadratic relation; no coordinate regularity assumption. |

Validation performed:

- `lean-check` on the absolute path of this package's Suggested.lean: exit 0,
  one `declaration uses sorry` warning, no other warnings or errors. The matrix,
  unit-factor, cochain-sign and both thickening witnesses are proved examples.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.0.json`:
  0 errors, 0 warnings (290 nodes). This is a read-only check of the original
  plan, not a claim that the obsolete PartII packet plans this split.
- `python3 research/blueprint/intake.py check-files` on the five issue
  deliverables: 5 files, 0 problems.
- Internal anchor/dependency and preservation inventory: 86/86 section
  anchors, 134/134 named Checks retained; no cycle or later-layer prerequisite.
- `git diff --check` passed. Deliverable-path inspection found changes only
  in the package README, Suggested.lean, review.json and this report.

## Handoff

The review is complete; no unresolved mathematical defect or checkpoint work
is carried forward. The maintainer can use the corrected split package for
the draft upstream PR. The only input bookkeeping caveat is the older
Dieudonné packet sharing the PartII filename; this report identifies the
correct plan above. All needed findings are here; there is no scratch-file
dependency. Metadata's existing `math.AG` classification is unchanged.
