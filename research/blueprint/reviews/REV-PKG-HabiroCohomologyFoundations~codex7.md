# Independent package re-review: q-Hodge filtrations and Habiro cohomology

Job `REV-PKG-HabiroCohomologyFoundations~codex7`, issue #11466. Reviewer: Codex, session `codex-iFM9sJ`, 2026-10-20. **Verdict: accepted**, with the small corrections below. This is a completed independent review, not a checkpoint. I did not write the package or the fixes and reviews being checked.

The reviewed atlas baseline is `4a4ac1f59a95bdd39fb06ea1123d9f9677a023e1`. The governing family order is the maintainer's revised order in this issue: HabiroCyclotomicCompletions → q-series/QW → Part I → HabiroRings → RefinedTraceMethods → Part II. QW.n is an authorized named supplier whose design is commissioned. Its lack of a completed standalone package is therefore not a defect in this review.

The issue's older Lawrence–Venkatesh title and missing `~codex.md` report path are stale template text. I reviewed the package named in the deliverables, the accepted Part I packet and its constituent plans, and the available `~codex6` report. The later PACKAGE_REVIEW shape rule takes precedence over the old 200 KB note: the complete hypotheses, targets, locators and Checks are retained. No mathematical target was cut to meet that obsolete size note.

## Disposition of the preceding review

- **Old R1:** withdrawn by the revised order. HC.4 → QW.2 → QW.3/QW.4 → Part I now has the required direction. The absence of a direct HC import in Part I does not erase this transitive input; the scope acknowledges it.
- **Old R2:** the issue assigns HabiroRings' donor-side deduplication to FIX-PKG-HabiroRings~adv4. I checked Part I's own ownership and export contracts. This verdict does not certify that the separate HR fix has landed or that the entire family is ready for simultaneous upstream submission.
- **The preceding étale correction:** retained and independently checked. The completed filtration is h-adic on qΩ=R[[h]], while the actual pair is its derived pullback to qdR. The positive-step Q(i)/Q witness remains nonstatic. The marked E∞ Habiro comparison and the complete divisor/Frobenius diagram remain general.

No unresolved Part I planning defect was found under the revised instructions. Prospective proof obligations already identified by the roadmap remain prospective mathematics, as detailed below; acceptance does not assert their formalization.

## Corrections in this submission

1. Section 3.7 constructs differential ghost maps but had no local named API or Check block. Added three API entries for the maps, their Verschiebung formula and localization, and three discriminating tests. At m=1 the map is the identity. At A=R=Z, m=2, the integral image under evaluation at 1 and −1 consists of pairs with equal parity; (1,0) appears only after inverting 2. On dx over Z[x], the surviving V₂ ghost is 4dx, detecting the degree-i exponent i+1 rather than i. Corrected the QW Paragraph 3.15 locator to pp.41–42, which includes the displayed Verschiebung formula.
2. The Layer 5 introduction still described scheme cohomology only over Z. It now agrees with §5.13's perfectly covered Λ-base and its base-sensitive examples.
3. The first §5.13 Check now distinguishes its own static étale coefficient ring from the subsequent ordinary GSWZ-ring identification owned by HabiroRings. It points to the existing export and downstream-boundary paragraphs. This removes an ambiguity in an example without adding an HR prerequisite.

Suggested.lean and metadata.toml are unchanged. All 151 numbered subsections remain. No existing target, API entry, Check block, theorem signature or coefficient range was removed or weakened.

## Supplier direction and common owners

Among the Habiro-family roadmaps, the direct suppliers are precisely the following QW stages. The complete subsection-by-subsection supplier inventory appears below, including the non-family imports.

| Supplier | Imported contract | Direct subsection consumers |
| --- | --- | --- |
| QW.1 | Λ-bases, Adams operations, perfect coverage and its polynomial/Laurent stability | 0.3, 1.1, 1.19, 2.4, 3.1, 3.31, 4.8, 5.15 |
| QW.2 | Relative degree-zero q-Witt construction and cyclotomic ghost inputs | 0.2; also the opening exact QW.2–QW.4 contract |
| QW.3/QW.4 | Relative rings, degree-zero F/V and ghosts, étale maps and completed Frobenius lifting | 0.3, 3.1, 3.3–3.5, 3.7, 3.9–3.10, 3.14, 4.21 |
| HC through QW | The cyclotomic prerequisites of those suppliers | No direct numbered Part I supplier sentence imports HC; the transitive path is acknowledged in Scope. |

The QW.5 and QW.6:framings names occurring in the introductory ownership discussion designate the positive-degree and framed interfaces constructed here, not exports borrowed from an unconstructed higher stage. Generic enhanced categories, derived de Rham, prismatic/q-crystalline, A_inf, crystalline and comparison interfaces remain explicitly named suppliers. HS.3 supplies only the analytic objects used to formulate an open problem. The restriction to HC/QW above concerns the Habiro family, not these other prerequisite areas.

I checked all numbered supplier sentences and every occurrence of HabiroRings/HR, RefinedTraceMethods/RT and Part II. None supplies Part I's derived construction. The occurrences describe later consumers, ordinary-model recognition, or the separate spectral range in §5.26. The notation HC in Mod_{HC} denotes the Eilenberg–Mac Lane ring of C, not HabiroCyclotomicCompletions.

| Part I owner | Contract checked | How the construction avoids a later-family supplier |
| --- | --- | --- |
| 0.1 | S-local orthogonality; the RHom reflector; principal/factorial derived towers; completed tensor; reduction conservativity and degree detection | Constructed from the enhanced derived module category and QH Appendix B. Ordinary completeness alone is not substituted for this interface. |
| 0.2 | Complete finite closed cyclotomic descent, mapping spaces, all intersection terms, prime-chain comparisons and semilinear naturality | Built on 0.1 and the specified q-Witt ghost input, with every chain comparison retained. No rational CRT substitute. |
| 0.3 | Marked formally étale complete lifts of qW_m; staticity; ghost/Frobenius gluing; divisor transitions and the factorial limit E | Uses 0.1–0.2 and QW's degree-zero/étale input. A global Frobenius on R is unnecessary. |
| 3.31 | Framed coefficient scaling and the raw Habiro Koszul complex | Uses the complete cyclotomic diagram and unique étale lifting. Rootwise Taylor theory is not imported; the later comparison with cohomological H is a separate target. |
| 4.21/4.28 | Natural marked H(R,F)≃E(R/A), all partial objects, q-Witt reductions, canonical h-completion, divisor/Frobenius coherence | Exports the cohomological comparison to HR. The ordinary HR model is not used to define E or prove the target here. |

In particular, §§4.21 and 4.28 distinguish F^j=qdR×^h_{R[[h]]}h^max(j,0)R[[h]] from its filtration completion. For R=Q(i) over Q and j>0, the former has H⁰=h^jQ[[h]] and H¹=(R/Q)[[h]]/h^j. The static Habiro coefficient object still has H/(q^m−1)≃qW_m and H^∧_h≃R[[h]]. No spherical lift, inversion of 6, finite-projectivity restriction on the étale input, or Λ-structure on R was inserted.

## Trace boundary and generality

The old trace constructions do not occur as Part I targets. I checked the corresponding Part II and RT ownership paragraphs. Spherical inputs and trace pairs are in II §§1.1–1.3; higher-power spectral lifts and trace/canonical pairs are in II §§2.1–2.3; framed trace comparison is in II §3.3; number-field fixed-point and Taylor comparisons are in II §§4.1–4.2. Their suppliers include RT §§6.1, 6.9–6.14 and 8.8 and the prismatic/A_inf comparison contracts. Part I's current Layer 6 instead states the open analytic comparison. Its §8.15 constructs algebraic/prismatic Nygaard independently of trace. References to TC's algebraic divided-power formulas in §5.26 do not import the trace theorem.

The generality audit retained the following distinctions:

- HQ.1–HQ.2 permit a torsion-free Λ-base; the later perfectly covered hypothesis is stated rather than silently imposed everywhere. The smooth algebra need not itself have Adams operations.
- Polynomial animation qdR and the smooth filtration-complete qΩ are separate, even on smooth rational algebras. Rational and p-completed rational conditions on a pair are separate data with coherence.
- Smooth canonical pairs use exactly the small-prime/dimension domain. Scheme descent in §5.13 is over any perfectly covered base satisfying that relative condition. Tensor/operadic claims keep their arity bounds and do not assert closure of that domain under every tensor product.
- Quasi-lci and relative semiperfectness use the full cotangent Tor-amplitude, not the naive cotangent module. Ordinary preimage filtrations are used only after staticity; injective reduction alone is not surjective reduction.
- Higher-power algebraic quotients permit every prime, including p=2, with α≥2. The exponent-one obstruction remains. Spectral lifting conditions in Part II do not narrow this algebraic theorem. For Z/m the powerful condition retains every valuation ≥2 and includes m=1 with its special rational corner.
- Finite-projective extension of a general chosen pair retains the relative Frobenius, Nygaard and filtered décalage exchange hypotheses. The weaker flat-base-change theorem is confined to its actual naive-filtration domain.
- The coefficient-complete and monoidal constructions retain enhanced diagrams, mapping spaces and higher coherence. Degreewise quotients, ordinary fixed vectors, or an arbitrary family of cohomology groups do not replace these constructions.
- Analytic comparison, smooth proper perfectness, normalized quasi-regular uniqueness, the raw framed comparison and canonical θ/Witt equalities retain their stated proof or comparison obligations. None is silently promoted to a proved theorem or dropped to manufacture acceptance.

## Source verification

Sources were read as mathematical evidence, with no source prose added to the repository. The primary versions used were QH arXiv:2510.04782v2, QW arXiv:2410.23078v5, TC arXiv:2410.23115v4, BS arXiv:1905.08229v4, BMS1 arXiv:1602.03148v3, Scholze arXiv:1606.01796v1, and Lurie's DAG VIII. Printed page numbers, not text-extraction chunk numbers, were used.

For a reproducible random sample I applied Python Random(11466).sample to the ordered 151 numbered source-bearing subsection headings and took 15. Each row below was checked in the source and supports the current target with its stated hypotheses or explicit proof obligation.

| Sampled subsection | Source locators verified | Result |
| --- | --- | --- |
| 1.9 | QH Lemma A.8, §A.1, p.73 | Koszul twisting has the required cross-commutations. |
| 2.1 | QH Convention 1.22(a),(c),(d), §1, pp.10–12 | Filtered enhanced categories, shifts and completion agree. |
| 3.8 | QW Lemma 3.32, §3, p.51 | Étale extension of the degree-zero algebra gives the unique differential. |
| 3.11 | QW Proposition 4.1, Proposition 4.2 and Paragraph 4.3, §4, p.54; Theorem 4.27, p.66 | Smooth and perfectly covered hypotheses, degreewise completion and p-complete comparison retained. |
| 3.19 | QH Corollary 3.31, §3, p.40 | Smooth animated form comparison has exactly one cohomological shift. |
| 3.27 | QH Lemma 3.27, §3, p.35 | Nygaard graded fiber sequence has the stated range and indices. |
| 4.5 | QH Proposition 3.7, §3, p.23 | Completed monoidal pair construction and q-Hodge functor agree. |
| 4.7 | QH Lemma 3.10, §3, p.24 | Graded calculation gives the conjugate/q-Witt filtration directions. |
| 4.16 | QH Proposition 3.43, §3, p.45 | The comparison is after the specified cyclotomic completion. |
| 4.21 | QH Corollary 3.13, §3, p.27; Lemmas 2.7, 2.9 and Remark 2.10, §2, pp.15–17; Remark 3.6, pp.22–23; Proposition 3.47, p.48; Paragraph A.14, p.76 | Static H and its natural étale identification are compatible with the nonstatic uncompleted pair. |
| 4.28 | QH Theorem 3.8 and Remark 3.9, §3, pp.23–24; Remark 3.6, pp.22–23; Theorem 3.11, p.25; Propositions 3.42, 3.45 and 3.47, pp.45,47–48 | Export keeps all comparisons; full coherent divisor naturality is an implementation target beyond individual source arrows. |
| 5.2 | QH Construction 4.1 and Proposition 4.3, §4.1, pp.53–54 | Smoothness, perfect coverage and inverted small primes agree. |
| 5.5 | QH Proposition 4.5, §4.1, p.55 | The local description is p-complete with its stated dimension bound. |
| 8.2 | BS Notation 16.1/Definition 16.2, §16, p.106; Notation 17.1, §17, p.117; Scholze Lemma 4.1, §4, p.8; QH Lemma A.6, pp.71–72 and Example 4.24, p.64 | The q-PD and prism ideals differ; the cyclotomic congruence and prime-two case are retained. |
| 8.18 | BMS1 Theorem 14.1(ii), §14, pp.118–119; BS Theorem 18.1, Proposition 18.2 and Lemma 18.3, §18, pp.122–123 | Canonical θ/de Rham equality needs the specified normalization and enhanced comparison, not an arbitrary equivalence. |

Additional checks addressed the previously flagged or delicate assertions: QH Definition B.1, Lemmas B.2–B.3, Corollary B.4 and Remark B.5 (§B, pp.77–79) for complete modules; Proposition 2.5 and Corollary 2.6 (§2, p.15) for finite complete descent; Proposition 3.41 (p.45) and Proposition 3.45/Remark 3.46 (p.47) for coherent and monoidal descent; Paragraphs A.13–A.14 (p.76) for the derived commutative lift; §§4.1–4.2 (pp.53–66) for truncation, partial multiplicativity and the naive filtration; and Corollary 4.34 (§4.3, p.68) for the quasi-regular tensor assertion.

The corrected adjunction in §5.1 agrees with the actual extension-by-zero formula, tested on Z(j); the source's label for that adjoint does not override its formula or counit. Likewise §3.2 correctly uses dF=nFd rather than the printed V in QW Lemma 3.7. The ghost formula and the added tests were checked in QW Paragraph 3.15, pp.41–42, and its integral/rational boundary in Corollary 3.34, p.52. TC Paragraph 3.15 and Lemmas 3.16–3.17 (§3.2, pp.38–40) supply the algebraic lift/divisibility calculation for α≥2, including the sharp p=α=2 case, without a trace or spherical argument.

For the infinite lattice application, DAG VIII Proposition 2.7.6 and Definition 2.7.8 (§2.7, p.71) and Proposition 2.7.14 (p.72) supply prestack limit and flat-sheafification invariance. The group is not assumed finite and the atlas is not incorrectly asserted to be quasi-compact fpqc. QH Paragraphs 1.16–1.17 (pp.8–9) and Paragraph 1.21 (p.10) leave the perfectness, analytic and uniqueness proof obligations visible rather than providing missing proofs by citation.

## Adversarial pass through every layer

The ranges in this table partition all 151 numbered targets. I checked statements, prerequisites and the definition Checks, using the indicated concrete or degenerate inputs. These are review calculations, not claims that the enhanced targets already elaborate.

| Targets | Controls and implications |
| --- | --- |
| 0.1 | The zero module, completed unit and B/h separate reflector from identity; a noncomplete rational-function module has zero cyclotomic reductions, so detection requires completeness. Derived towers retain Tor. |
| 0.2 | At m=2 the rational branches split but the characteristic-two branches meet. At m=6 both divisor paths must agree. At m=12,p=2 the prime-to-p divisors are 1 and 3; prime-chain repetitions cannot create extra independent factors. |
| 0.3 | Unit/product étale algebras, a rational extension and a non-étale dual-number algebra distinguish formal étale lifting from arbitrary deformation. Frobenius is completed and coefficient-twisted, not a chosen endomorphism of every R. |
| 1.1–1.4 | The base, polynomial line and p=2 separate q-PD from prism quotients, smooth from animated input, and local from rational completion. |
| 1.5–1.8 | n=0,1,2,3 give denominators 1,1,64,2^14·3^26; the bounds are uniform over primes before forming the product. No denominator is inverted integrally. |
| 1.9–1.11 | A zero operator and a noncommuting twist show why the cross-commutations matter; the coordinate-free equivalence is compared with the specified framed map. |
| 1.12–1.16 | The base and rational line distinguish the global rational corner from p-completion. Identity/two frame changes test cocycles and the final h-completion in base change. |
| 1.17–1.21 | Identity affine cover, disjoint union and triple intersection test enhanced Čech realization and naturality; equalizers of cohomology groups lose required data. |
| 1.22–1.23 | D_q(x²)=(1+q)x distinguishes twisted Leibniz. Rank zero, q=1, negative exponent and weights (2,−1) on (−1,3) give the multipliers 1,1,q^−1,q^−5; q must be a unit on the torus. |
| 1.24–1.28 | Trivial action and Laurent rank one check the scalar-twist direction and semilinear cocycle. Derived fixed points differ from fixed vectors; underlying perfectness differs from equivariant compactness. |
| 2.1–2.3 | The unit filtration detects the shifted quotient F^{i−1}→F^i. At m=2,q=2 one needs βt=3; βt=2 fails. m=0 is an algebraic Lean boundary, not a cyclotomic reduction. |
| 2.4–2.6 | Q[x±1] and Q(i) prevent treating uncompleted animated de Rham as its smooth completion. Polynomial animation remains the actual construction. |
| 2.7–2.11 | Form degrees zero/one detect the combined h/Hodge weights. Completing Q at p yields zero, whereas Z_p[1/p] survives; the two rational conditions cannot be identified. Lη keeps its parameter and completion domain. |
| 3.1–3.3 | m=1,p and degree-one forms test FV laws, non-chain Frobenius and nonmultiplicative V. Ordinary restriction would force Φ_p(1)=0 over Z and is excluded. |
| 3.4–3.7 | The initial object is not an arbitrary FV family. The new m=1 and m=2 ghosts test integral parity, localization and the factor 4 on V₂(dx), with the coefficient twist retained. |
| 3.8–3.10 | Identity/product étale maps and mixed prime-power m test unique differential extension, the prime-to-p factors and Adams twists. |
| 3.11–3.14 | A smooth line at m=p distinguishes degreewise completion, rational splitting and the p-complete comparison. The no-functor theorem retains the nonrational base and common-functor requirement. |
| 3.15–3.19 | m=1, two divisor paths and form degrees zero/one test arithmetic gluing, derived reduction and the single form shift. |
| 3.20–3.23 | Nygaard steps zero/one and p=2 test the Frobenius pullback and divided map. Trace supplies none of these algebraic filtrations. |
| 3.24–3.29 | The zero step, exponent endpoints and p-inverted corner test fiber/cofiber directions and the rational combined filtration; no integral formula is obtained by merely forgetting inversion. |
| 3.30–3.31 | Rank-zero framing and q^−1 scaling test coherent descent and inverses. A coefficient equivalence alone does not establish the raw Koszul comparison; the full comparison remains a named target after H is constructed. |
| 4.1–4.3 | The base pair and exponent-one free δ quotient test all four pair clauses and obstruct an unrestricted section. p-rational data is not omitted. |
| 4.4–4.7 | The zero filtration, unit and line test colimit-before-completion and the conjugate/q-Witt graded shifts. |
| 4.8–4.11 | Empty and one-coordinate frames test hD_q rather than D_q; exponent zero/one and a lower cyclotomic point test recursion and completion. |
| 4.12–4.16 | Paths 1|2|6 and 1|3|6 test the full divisor diagram. Using q^p−1 in place of Φ_p changes the modification, eventually giving zero in the indicated completion. |
| 4.17–4.20 | Unit/zero objects and one cyclotomic reduction test complete tensor, the factorial limit and the q-Witt filtration. Rational ghost products cannot replace complete coefficient objects. |
| 4.21–4.24 | Q(i)/Q has a nonstatic positive filtration step but static H. The non-étale line is excluded from that identification. Its Bockstein belongs to derived reduction, not an ordinary cohomology quotient. |
| 4.25–4.28 | Identity and finite-projective extension test all naturality/limit exchanges. Arbitrary flat extension is insufficient for a chosen pair. The full étale export and specified twists survive. |
| 5.1–5.7 | Bounds zero/one and Z(j) distinguish right truncation from quotient truncation and the oplax adjoint. Empty framing over Q(i) tests the completed/uncompleted pair distinction. |
| 5.8–5.12 | Relative dimensions zero/one/two distinguish no inversion from inversion of 2. Z[x]⊗Z[x] has dimension two, so the one-dimensional domain cannot be asserted to be tensor closed. The explicit admissibility bounds remain. |
| 5.13–5.14 | Affine line, étale number-field ring and the coefficient t over Z[t] test affine recovery and relative differentials. The ordinary GSWZ recognition is downstream. Smooth proper perfectness remains a target with its own proof obligation. |
| 5.15–5.18 | Identity quotient and cotangent amplitude endpoints distinguish full quasi-lci data and the static preimage. Injective reduction alone does not establish a q-deformation. |
| 5.19–5.21 | x versus x² distinguishes the exponent-one obstruction from the all-prime higher-power theorem; p=2 is included. Flat base change stays within the naive-filtration hypotheses. |
| 5.22–5.25 | Identity/tensor algebras test the quasi-regular section and normalized uniqueness. Static étale ring comparison supplies no K₃-indexed module comparison. |
| 5.26 | m=1,4,12,36 tests the powerful condition, all-prime algebraic range and the special unit case. Unbounded PD torsion prevents replacing the local rationalized complex by Q_p. The global Q[[h]] corner is retained. |
| 6.1–6.3 | Number-field affine and higher-dimensional inputs test domain and coefficient change of the open comparison. The sequence 1/(n+1)! distinguishes rationalization of a product from a product of rationalizations. Solid extension and continuity remain additional obligations. |
| 7.1–7.2 | Constants, q=0,1,2 and characteristic two test coefficientwise Jackson calculus; hD_q at q=1 vanishes while D_1 is the ordinary derivative. |
| 8.1–8.3 | Identity/zero square, p=2 and absent perfectoid data distinguish records from constructions and keep the coefficient maps/ideals explicit. |
| 8.4–8.8 | Base and framed line test relative Frobenius linearization, ξ versus φ(ξ), and the distinct Lη parameters. |
| 8.9–8.12 | Incompatible pair data, m=1,p and derived h-reduction test filtration gluing, the ordinary comparison map's domain and torsion correction. |
| 8.13–8.17 | Composed specified maps test commutation rather than existence of unrelated equivalences. At p=2,3 the prime decomposition has u=1,X respectively, both with u(1)=1. |
| 8.18–8.19 | Canonical θ and Witt maps on Teichmüller generators test normalization and coefficient twists. The comparison obligation is equality of those maps over the full intended functorial domain. |

There are now 54 definition Check blocks, all with at least three bullets (range 3–8). The five light native definitions each have two proved Lean examples, with two additional cyclotomic boundary controls. The new ghost tests belong in the README because their differential q-Witt carriers are not at the pins.

## Libraries, duplication and native signatures

I read the snapshot HodgeStructures and UniversalCovers READMEs and UPSTREAM_GUIDE for density and presentation. I read the reviewed HQ.1–HQ.8 library-coverage audit and screened the current upstream README/Suggested files and Completed tree at TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This included all nine newer roadmap areas and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts named by WORKERS.

Searches used the underlying objects as well as names: complete module orthogonality and inverse limits; cyclotomic intersections and étale lifting; geometric-sum derivations; filtered/Rees and q-PD structures; FV systems and relative Frobenius; coherent lattice actions and quotient QCoh. I read the close existing interfaces instead of inferring absence from a failed name search. Current TauCeti's `RingTheory/ReesAlgebra/Grading.lean` is the ordinary ideal Rees grading; `Algebra/Homology/DG/Algebra/AdamsCompletion.lean` completes an already bigraded DGA along a nonnegative Adams grading. Neither supplies the enhanced derived localization reflector, filtered q-Hodge pairs or coherent Habiro descent. Ordinary completion, Hodge-structure filtrations and Witt vectors likewise do not supply these targets.

The existing `TauCeti.torusCharacter` and its add/neg/zsmul laws in `LinearAlgebra/Basis/DiagonalTorus/Basic.lean` were read and are already deferred in Scope. The retained application adds algebra automorphisms of the Laurent carrier and coherent semilinear module descent, not a second theory of characters. AlgebraicVectorBundles L0B/L2B already owns the ordinary sheaf/vector-bundle dictionary and is likewise deferred. No additional duplicate with current TauCeti or its roadmaps was found; no target was removed on that ground. HR donor deduplication remains the separately assigned family integration job.

At the pinned Mathlib commit I read the actual statements for `Polynomial.sum` and its constant/monomial rules, `AddMonoidAlgebra.lift` and `lift_single`, geometric sums, prime cyclotomic formulas and evaluation, `Algebra.Etale`, `Algebra.Smooth`, and the Kähler universal derivation. Ordinary adic completion is not treated as the missing enhanced interface. The following twelve declaration comparisons exceed the required ten.

| Declaration | README/signature comparison |
| --- | --- |
| qDiff | Arbitrary commutative A; coefficientwise sum, no division and no spurious constant derivative. §§1.2/7.2. |
| jackson_calculus | Divided difference, correctly ordered twisted product rule and q=1 derivative over the same domain. §1.2. |
| uniformDenominator | Prime product through n and exponent 2Σ_{j<n}p^j; empty product gives 1. §1.8. |
| uniformDenominator_pos | Positivity of the scalar; no claim to construct the envelope comparison. §1.8. |
| torusScaleHom | Real algebra map on B[Z^d], q a unit, integer exponents. §1.23. |
| torusScaleHom_action | Weight zero and weight addition give identity and composition in the declared order. §1.23. |
| torusScale_exists_unique | Unique coefficient-linear algebra automorphism with the monomial formula; no encoded quotient stack. §1.23. |
| coefficientRelation | βt−(q^m−1), variable order q,β,t and weights 0,1,−1. §2.2. |
| coefficientRelation_eval | Algebraic identity for all natural m; cyclotomic interpretation only m≥1. §2.2. |
| qHodgeDiff | h times Jackson, over any commutative A. §§4.8/7.2. |
| qHodge_polynomial | Monomial formula includes exponent zero, and specialization at q=1 is zero. §§4.8/7.2. |
| cyclotomic_prime_decomposition | Integral polynomial decomposition with Fact p.Prime and u(1)=1, including p=2. §8.2. |

Suggested.lean has 226 lines: five real-bodied definitions, seven theorem targets and twelve proved examples. Its only import is Mathlib. The module comment explicitly identifies the enhanced definitions left as README targets and explains the native choices. There is no admitted data definition, artificial carrier, True/Prop placeholder, admitted example, auxiliary theory development or weakened substitute for a headline theorem.

## Validation and remaining work

`lean-check` exited 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. It reported exactly seven declaration-uses-sorry warnings, at lines 46, 74, 105, 116, 155, 186 and 207, with no errors or other warnings. No Lean build or dependency update was run. The unchanged native file need not be re-elaborated for the prose additions.

Final packet, changed-file intake, metadata/JSON, target-conservation and whitespace results are recorded in the handoff. The current package is accepted for the upstream draft stage under the revised order. QW's commissioned supplier design and HR's assigned donor-side retarget are external integration work, not omitted Part I constructions. The roadmap's explicit mathematical proof obligations remain work for implementation; no requested target has been hidden or declared formalized.

## Complete direct supplier inventory

Each row below records the actual supplier sentence for one numbered subsection. Internal HQ.k references name this package's layer contracts; HQ.4 is built before the HQ.3 construction that uses it. The opening exact contracts state the generic hypotheses and coherent maps, rather than making a list of names substitute for them.

| Consumer | Direct suppliers |
| --- | --- |
| 0.1 | DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0 and E5:presentability. |
| 0.2 | §0.1, DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0 and E5:presentability, QWittVectors QW.2. |
| 0.3 | §§0.1–0.2, QWittVectors QW.1/QW.3/QW.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.1 and EnhancedDerivedSheaves E0. |
| 1.1 | PrismaticCohomology PR.6, QWittVectors QW.1, Mathlib geom_sum_mul, Mathlib Polynomial.eval_geom_sum, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_pow_eq_geom_sum, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.prod_cyclotomic_eq_geom_sum. |
| 1.2 | HQ.1, AInfCohomology AI.1, Mathlib Algebra.Etale, Mathlib KaehlerDifferential. |
| 1.3 | HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.3, DerivedDeRhamCohomology DD.4, CrystallineCohomology CR.2. |
| 1.4 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4, DerivedDeRhamCohomology DD.1. |
| 1.5 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0. |
| 1.6 | HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.0. |
| 1.7 | HQ.1, CrystallineCohomology CR.0, PrismaticCohomology PR.6. |
| 1.8 | HQ.1, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.1. |
| 1.9 | AInfCohomology AI.1. |
| 1.10 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0. |
| 1.11 | HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.2. |
| 1.12 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.4, EnhancedDerivedSheaves E5. |
| 1.13 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.14 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.15 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.16 | HQ.1. |
| 1.17 | CrystallineCohomology CR.0, CrystallineCohomology CR.2, EnhancedDerivedSheaves E5. |
| 1.18 | HQ.1, EnhancedDerivedSheaves E5, PrismaticCohomology PR.6, CrystallineCohomology CR.2. |
| 1.19 | HQ.1, QWittVectors QW.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 1.20 | HQ.1, EnhancedDerivedSheaves E0. |
| 1.21 | HQ.1, EnhancedDerivedSheaves E2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 1.22 | HQ.1, Mathlib Module.Projective. |
| 1.23 | Mathlib AddMonoidAlgebra, Mathlib AlgEquiv, HQ.1. |
| 1.24 | HQ.1, Mathlib LinearEquiv. |
| 1.25 | HQ.1. |
| 1.26 | the lattice action of §1.23, EnhancedDerivedSheaves E5:presentability and EnhancedDerivedSheaves E0/E1 coherent module-category limits. |
| 1.27 | the coherent action limit of §1.26, EnhancedDerivedSheaves E0/E1 affine modules and prestack right Kan extension, and EnhancedDerivedSheaves E5:presentability. |
| 1.28 | the quotient comparison of §1.27, EnhancedDerivedSheaves E0/E1, and AlgebraicVectorBundles L0B's affine finite-projective dictionary, with the specified lattice equivariance added here. |
| 2.1 | EnhancedDerivedSheaves E1, DerivedDeRhamCohomology DD.1. |
| 2.2 | HQ.2. |
| 2.3 | HQ.2. |
| 2.4 | HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, QWittVectors QW.1. |
| 2.5 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.2. |
| 2.6 | HQ.2, HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.2. |
| 2.7 | DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.2. |
| 2.8 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.1. |
| 2.9 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 2.10 | HQ.2, HQ.1. |
| 2.11 | AInfCohomology AI.1, PrismaticCohomology PR.3, PrismaticCohomology PR.6, HQ.2, HQ.1. |
| 3.1 | QWittVectors QW.3/QW.4, QWittVectors QW.1. |
| 3.2 | HQ.4. |
| 3.3 | QWittVectors QW.3/QW.4, HQ.4, CrystallineCohomology CR.4. |
| 3.4 | HQ.4, QWittVectors QW.3/QW.4, DerivedDeRhamCohomology DD.2. |
| 3.5 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.6 | HQ.4, CrystallineCohomology CR.4. |
| 3.7 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.8 | Mathlib Algebra.Etale, DerivedDeRhamCohomology DD.2. |
| 3.9 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.10 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.11 | HQ.4, HQ.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4. |
| 3.12 | HQ.4, DerivedDeRhamCohomology DD.4. |
| 3.13 | HQ.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4. |
| 3.14 | HQ.4, QWittVectors QW.3/QW.4, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.0. |
| 3.15 | HQ.1, HQ.2, §0.2, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 3.16 | HQ.4, §0.2, §0.1. |
| 3.17 | HQ.4. |
| 3.18 | HQ.4, EnhancedDerivedSheaves E5:animation, EnhancedDerivedSheaves E5, DerivedDeRhamCohomology DD.2. |
| 3.19 | HQ.4, DerivedDeRhamCohomology DD.2. |
| 3.20 | HQ.4, EnhancedDerivedSheaves E5:animation. |
| 3.21 | HQ.4. |
| 3.22 | HQ.4, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 3.23 | HQ.4. |
| 3.24 | HQ.4. |
| 3.25 | HQ.4, DerivedDeRhamCohomology DD.2. |
| 3.26 | HQ.4, DerivedDeRhamCohomology DD.2, PrismaticCohomology PR.2. |
| 3.27 | HQ.4, HQ.2, PrismaticCohomology PR.3, PrismaticCohomology PR.2. |
| 3.28 | HQ.4, PrismaticCohomology PR.3, PerfectoidQuotients Q3. |
| 3.29 | HQ.4, HQ.2, HQ.1, PrismaticCohomology PR.3. |
| 3.30 | HQ.4, EnhancedDerivedSheaves E5. |
| 3.31 | §§0.2–0.3, QWittVectors QW.1, HQ.1 and AInfCohomology AI.1. |
| 4.1 | HQ.2, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.1. |
| 4.2 | HQ.3, EnhancedDerivedSheaves E5:animation. |
| 4.3 | HQ.3, HQ.2, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2. |
| 4.4 | HQ.3, HQ.2, DerivedDeRhamCohomology DD.2. |
| 4.5 | HQ.3, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 4.6 | HQ.3, HQ.2. |
| 4.7 | HQ.2. |
| 4.8 | HQ.3, HQ.4, HQ.1 and QWittVectors QW.1. The completed framed construction uses no rootwise Taylor comparison; its separate uncompleted comparison is the target of §3.31. |
| 4.9 | HQ.3, HQ.4, HQ.2. |
| 4.10 | HQ.3, HQ.4. |
| 4.11 | HQ.3, HQ.4. |
| 4.12 | HQ.3, HQ.4. |
| 4.13 | HQ.3, HQ.4, HQ.2. |
| 4.14 | HQ.3. |
| 4.15 | HQ.4, HQ.3, PrismaticCohomology PR.3. |
| 4.16 | HQ.3. |
| 4.17 | HQ.3, §0.1. |
| 4.18 | HQ.3, HQ.4, DerivedDeRhamCohomology DD.2, §0.1. |
| 4.19 | HQ.3, §0.1. |
| 4.20 | HQ.3, HQ.4, HQ.2. |
| 4.21 | §§0.1–0.3, HQ.2, HQ.3, HQ.4, QWittVectors QW.3/QW.4 and EnhancedDerivedSheaves E5. |
| 4.22 | HQ.2, HQ.3, AInfCohomology AI.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1. |
| 4.23 | HQ.3, HQ.4, HQ.1, EnhancedDerivedSheaves E5. |
| 4.24 | HQ.3, HQ.4. |
| 4.25 | Mathlib Module.Finite, Mathlib Module.Projective, HQ.3, HQ.2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, Mathlib CategoryTheory.preservesColimitIso. |
| 4.26 | HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 4.27 | HQ.3, HQ.4, §0.1, DerivedDeRhamCohomology DD.1, Mathlib CategoryTheory.Limits.limit.post, Mathlib CategoryTheory.Limits.limMap, Mathlib CategoryTheory.Limits.limMap_π, Mathlib CategoryTheory.Limits.limit.post_π, Mathlib CategoryTheory.Limits.isIso_limMap, Mathlib CategoryTheory.preservesLimitIso. |
| 4.28 | Layer 0, HQ.2, HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 5.1 | HQ.2, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E5:abstract. |
| 5.2 | HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2, Mathlib Algebra.Smooth. |
| 5.3 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.4 | HQ.5, HQ.3, HQ.2. |
| 5.5 | HQ.5, HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:presentability, HQ.2. |
| 5.6 | EnhancedDerivedSheaves E0, Mathlib Algebra.Smooth. |
| 5.7 | HQ.5, HQ.3. |
| 5.8 | HQ.5, HQ.3, Mathlib Algebra.Smooth. |
| 5.9 | HQ.5, EnhancedDerivedSheaves E5:abstract, Mathlib Algebra.Smooth. |
| 5.10 | HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.11 | HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.12 | HQ.5, EnhancedDerivedSheaves E5:abstract. |
| 5.13 | HQ.5, HQ.3, HQ.4, §0.1. |
| 5.14 | HQ.5, §0.1, HQ.4. |
| 5.15 | HQ.2, QWittVectors QW.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.0, Mathlib RingTheory.Sequence.IsRegular, Mathlib Algebra.Etale. |
| 5.16 | HQ.5, HQ.2, HQ.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.3, PrismaticCohomology PR.3, PrismaticCohomology PR.6. |
| 5.17 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.18 | HQ.5, HQ.2. |
| 5.19 | HQ.5, HQ.2, PrismaticCohomology PR.0. |
| 5.20 | HQ.5, PrismaticCohomology PR.0. |
| 5.21 | HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.22 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.23 | HQ.5, DerivedDeRhamCohomology DD.0, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.24 | HQ.5, HQ.3. |
| 5.25 | HQ.5, HQ.3 and §§0.3, 4.21 and 4.28. |
| 5.26 | HQ.5, HQ.3, HQ.2, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4. |
| 6.1 | HQ.5, AnalyticHabiroStack HS.3. |
| 6.2 | HQ.6, HQ.3, HQ.5, HQ.4. |
| 6.3 | HQ.6, §0.1 and AnalyticHabiroStack HS.3, only to formulate the open analytic comparison. |
| 7.1 | HQ.1, HQ.3, HQ.5, HQ.2. |
| 7.2 | HQ.1, HQ.3, HQ.4, Mathlib geom_sum_mul, Mathlib Polynomial.comp, Mathlib Polynomial.derivative_X_pow, Mathlib Polynomial.cyclotomic_prime. |
| 8.1 | HQ.1, HQ.2, HQ.3. |
| 8.2 | HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib geom_sum_mul, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib PreTilt, Mathlib WittVector.teichmuller, Mathlib WittVector.fontaineTheta, Mathlib WittVector.fontaineTheta_teichmuller. |
| 8.3 | HQ.8, HQ.3, HQ.6. |
| 8.4 | HQ.8, HQ.1, PrismaticCohomology PR.6. |
| 8.5 | HQ.8, HQ.1, PrismaticCohomology PR.6. |
| 8.6 | HQ.8, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.1, PrismaticCohomology PR.6, AInfCohomology AI.3. |
| 8.7 | HQ.8, HQ.2, HQ.3, AInfCohomology AI.1. |
| 8.8 | HQ.8, HQ.2, HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 8.9 | HQ.8, HQ.2, HQ.4, AInfCohomology AI.1. |
| 8.10 | HQ.8, HQ.4, HQ.2, PrismaticCohomology PR.3. |
| 8.11 | HQ.8, HQ.3, HQ.4, CrystallineCohomology CR.4, Mathlib Polynomial.prod_cyclotomic_eq_X_pow_sub_one. |
| 8.12 | HQ.8, HQ.1, HQ.2, HQ.3, DerivedDeRhamCohomology DD.2. |
| 8.13 | HQ.8. |
| 8.14 | HQ.8, HQ.5, HQ.6, CohomologyComparisons CP.1, CohomologyComparisons CP.6. |
| 8.15 | HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 8.16 | HQ.8. |
| 8.17 | HQ.8, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib WittVector.fontaineTheta_teichmuller. |
| 8.18 | HQ.8, HQ.1, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6. |
| 8.19 | HQ.8, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CrystallineCohomology CR.2, CrystallineCohomology CR.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6. |
