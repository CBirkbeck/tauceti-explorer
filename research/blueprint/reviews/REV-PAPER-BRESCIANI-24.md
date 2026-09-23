# Independent review: Bresciani 2024

Verdict: **revise**. Reviewer: Codex, session `codex-7e92bd`, 2026-09-23; issue [#1234](https://github.com/CBirkbeck/tauceti-explorer/issues/1234). This is a finished independent review, not an accepted complete extraction. The input was written by other sessions (Codex c83e7a/a71f92/hjdg0j and Claude Code cc-442dc5).

All 179 inherited items, 14 inherited routes and seven inherited source findings were checked. The corrected extraction has **180 items: 13 library, 9 planned, 158 missing**, with each missing item assigned to exactly one of 16 routes. Thirteen routes are accepted within their stated scope; routes 6, 11 and 12 are rejected. Twenty source findings are confirmed at the versions and reach recorded below; four already have a correction in a later publication. No Lean implementation or compilation is claimed.

The full published paper, pp.129–150, and the complete input JSON/report were read. The six main-paper finding passages were compared with arXivv3. Supplier reading is limited to the pages in the provenance table; it is not a claim to have audited every cited paper from beginning to end. The two full upstream calibration documents read were JacobianChallenge and GlobalNumberFields. All credited stages and relevant reviewed library-audit entries were read, including the new DWP.0/DWP.1 ownership match.

The main defect is not a counterexample to Theorem A. The printed statement that every section of an affine parabolic curve is cuspidal is false. The proposed repair over number fields passes this review relative to its named suppliers, but the nonsplit quadratic-boundary branch over fields of positive transcendence degree remains unresolved. Items /96 and /112 already carried a proviso; the old executable route brief still promised the unrestricted endpoint. That contradiction is now removed.

## Mathematical checks

For E2, take X=P1_Q minus V(T²−2). The point 0 gives a geometric section but there is no Q-rational boundary point, so the section is not cuspidal. A rational completion and a split boundary are different conditions. Schmidt's theorem addresses splitting of the completion. It does not establish the sentence about all sections being cuspidal. For /179, an ordinary section of a nonsplit proper conic is not a birational witness; the latter would force splitting.

The number-field replacement /169–/179 does not use /81, /96, Proposition22 or TheoremA. Local power separation follows from the valuation and all finite residue-unit quotients, without Mattuck. After a quadratic splitting extension, equality of point sections on the punctured line is detected by every finite Kummer class and thus by power separation. For each relevant closed point c, Chebotarev supplies a place where k(c) has a degree-one completion and the quadratic boundary stays nonsplit: in a common Galois closure choose g∈H\N, where H fixes k(c) and N fixes the quadratic field. Complete splitting in the normal closure is unnecessary.

For /174 choose a birationally liftable section on a hyperbolic open with the entire closed divisor of c removed. A cuspidal lift would already make the original section geometric, so Stix's density-one theorem applies to this noncuspidal hyperbolic lift. At the selected place, local point-section injectivity makes every specialization have the same center away from c; the loop criterion makes the specializing loop constant. The chosen place and auxiliary lift may depend on c. No transcendental preservation of a birational witness under completion is assumed.

The final /177 step uses **one finite square-class representative**, not an assertion that the completed Kummer element has globally finite support. Vanishing of exponents at closed points whose residue fields do not contain the quadratic field leaves, modulo squares, finitely many factors with no zero at the chosen nonsplit local point x. Thus a representative f is regular and nonzero at x. Finite Kummer evaluation gives v(f(c))≡v(c−x) mod2 for rational c near x. The left side is locally constant; density of k in its completion gives both parities on the right. This proves the proposed contradiction within its number-field hypotheses and supplier contracts. The finite S3 and valuation diagnostics below test the crucial boundaries, not the general theorem.

For the split-completion replacement /140–/146, let N be finitely generated and U a finite-index subgroup. The finite intersection of all index-[N:U] subgroups is characteristic, finite-index and contained in U. If G=N⋊H, this characteristic subgroup C permits the finite quotient (N/C)⋊image(H→Aut(N/C)), which detects N/C. Consequently G induces the full profinite topology on N. Completion embeds Nhat as the closure of N; the quotient universal property and the section give Ghat≃Nhat⋊Hhat. Neither abstract residual finiteness nor exactness of arbitrary nonsplit extensions is needed. The existing finite-index, topological-generation and completion universal-property declarations are imported.

The small logarithm replacement uses the normalized iterates L_n=p^(−n)[p]^[n] on a sufficiently small ball, with coefficient Gauss bounds on the quadratic remainder. The chosen radius makes the error ratio strictly less than one, retaining p=2 and arbitrary ramification. Convergence takes place in the analytic Banach algebra; a limit of pointwise analytic values alone is insufficient. Homomorphism follows by comparing the iterated group law; the identity linear term and smaller Lipschitz remainder give an isometry and contraction inverse. **Generic inverse analyticity is already in Mathlib**, so /163 now imports /180 and retains only the group application/formal-germ comparison. The scalar convenience lemma is not used for dimension>1. Compactness of A(K) and the open torsion-free subgroup give finite index and finite torsion, conditional on the separately identified chart/projectivity suppliers.

The substitution warning is concrete: (X²−X)/2 maps Z2 into Z2, but its Gauss norm is 2. Thus pointwise containment is weaker than the coefficient bound used in composition. Existing Tau Ceti restricted multivariable series completion and Mathlib Gauss norms are now credited in /155. The remaining norm/topology/evaluation comparison belongs to L0.

For Lemma8, the choice-free object is the generalized Albanese torsor P, not its translation group J. Spieß–Szamuely give the geometric open-curve comparison (the Néron–Severi obstruction vanishes for curves); Harari–Szamuely supply the arithmetic extension interpretation. A supplied gerbe object neutralizes this comparison without producing a rational point of P. Generic semiabelian Tate exactness now belongs to C4/A3/A4; the generic weight-vanishing theorem belongs to DWP.0/DWP.1, with good-reduction and torsion-free integral-to-rational comparisons. The unpointed/open-curve extension of JacobianChallenge owns only its specific construction and comparison.

## Coverage and limits

The main-paper coverage includes its section/conjecture definitions, fundamental-gerbe and relative-family setup, specializing loops, Lemmas1–26 (including parts split across rows), Proposition17's Kummer/valuation argument and footnote1, quasi-t-b.l. reduction, and TheoremsA–C. Rows136–179 are extraction-supplied foundations and replacement arguments; they are not falsely attributed as numbered results of the paper. Row180 isolates an existing library supplier. Full API/test and suggested-Lean-file work remains for the corresponding design/blueprint jobs; it is not claimed merely by a `complete` flag on a paper extraction.

The source routes accepted below identify exact existing directions and source obligations. Acceptance does not turn a quoted prerequisite into a completed proof. The source list retains the still-unread Stix book Proposition75/Lemma259, full density and valuative arguments, Picard 1-motive suppliers and the integral all-prime Faltings refinement. The paper protocol allows these prerequisites to receive later extraction jobs. In contrast, the unrestricted main theorem gap cannot be hidden as routine design work. The copied broad Caro–Pasten and Howe–Klevdal briefs likewise exceed the narrow analytic contributions checked here; their candidate IDs are preserved, but those whole executable briefs are rejected.

## Routing decisions

| Route | Decision | Reason |
|---|---|---|
| 1 | accept | SF.1 owns the general gerbes/root stacks/tame valuative direction. Exact suppliers are identified and existing sites/IsStack are imported. Acceptance adds these sources; it does not claim the entire valuative proof is recursively implemented. |
| 2 | accept | IG.0/IG.1 own finite covers, arithmetic exactness and relative specialization; affine-base restrictions and the split-completion import are explicit. |
| 3 | accept | IG.2 is the Hilbert-irreducibility owner. The general Hilbertian finite-cover criteria are source additions with their hypotheses, not claims of existing Lean results. |
| 4 | accept | R02.1 owns the compact-coefficient/inverse-limit comparison. Ordinary profinite completion is now separated from power-quotient completion; finite Kummer injectivity is imported, and /176 is independent of its anabelian consumer. |
| 5 | accept | The geometric projection, etale divisor and spreading-out sources belong to SF.3; import upstream AlgebraicCurves. The same-degree monic choice is explicit. A countable-enumeration shortcut is not part of acceptance. |
| 6 | reject | The unrestricted main endpoint is unresolved in the nonsplit quadratic-boundary branch over positive transcendence degree. The replacement brief now exposes this and the still-unverified Stix book supplier; do not create an executable design promising unrestricted TheoremA. |
| 7 | accept | After moving general weights and semiabelian Tate modules to their shared owners, this extends precisely upstream’s excluded unpointed/open-curve scope. The endpoint and torsor-before-neutralization comparison are supported by the inspected Spieß–Szamuely/Harari–Szamuely/Bresciani sources. |
| 8 | accept | The finite-K/Qp Mattuck endpoint has an explicit small-logarithm/compactness proof and imports its analytic and algebraic suppliers. Its tests retain p=2 and arbitrary ramification; no global logarithm or broad complete-field proof is advertised. |
| 9 | accept | The integral/all-prime refinement belongs to the rational Tate-isogeny owner R28.4 as a new source obligation. The extraction explicitly requires saturation and does not credit the rational theorem as the stronger statement. |
| 10 | accept | The finite-generated-kernel split-completion proof /140–/146 closes by characteristic finite-index subgroups and finite semidirect quotients; existing completion universal property and finite-index theorems are imported. No residual-finiteness or general nonsplit exactness hypothesis is invented. |
| 11 | reject | The small-ball replacement was checked and now imports the existing multivariable analytic inverse, but the brief copies the much broader unreviewed Caro–Pasten formal/integral/full-disc scope. Coalesce a bounded verified contribution with that candidate without authorizing its unresolved proof as a design endpoint. |
| 12 | reject | The two classical-point/compactness leaves have the right existing candidate owner, but its copied whole brief includes resolution, Shilov-density and constant-rank results not independently validated here. Keep the candidate; narrow or separately verify the full executable brief. |
| 13 | accept | L0 owns the remaining fixed-radius analytic Banach/substitution adapter. The existing restricted-series carrier and Gauss norm are now explicit imports, with coefficient bounds distinguished from pointwise containment. |
| 14 | accept | Field projectivity/symmetric ample bundle sources refine A1/A2, importing upstream square/cube theory. The corrected Milne formulas and nonzero tangent criterion are retained; no arbitrary-base projectivity is asserted. |
| 15 | accept | DWP.0/DWP.1 already own disjoint weights and the abelian Weil estimate. Good-reduction specialization and the integral-to-rational bridge are explicit imports; the generic theorem is removed from the curve-specific continuation. |
| 16 | accept | C4 owns semiabelian extensions; import A3/A4 and R02.1 for full Tate exactness. Only the curve-specific comparison remains in the generalized-Albanese continuation. |

## Source findings

The `sourceIssues` entries contain exact version locators, short printed fragments, corrections, bounded correction-search records and independent verdicts. No author was contacted. Three findings in auxiliary preprints and one cocycle typo are already corrected in the compared publications.

### E1 — misprint; affects nothing

Published §2 pp.133,135; arXiv v3 §2.

Correction: Cite [6, Proposition A.23] for arbitrary characteristic-zero field extensions.

The published dependency, Algebraic Geometry 8 (2021), A.18 p.262, only covers algebraic separable extensions; A.23 p.264 covers arbitrary extensions for geometrically connected concentrated fibered categories. Both statements and the proof of A.23 were reread. k(t)/k requires the latter. Matches the separate errata file E1; no independent review verdict is claimed here.

Known correction: new. Independent decision: **confirmed**. Confirmed against published pp.133/135, v3 and the original published A.18/A.23: arbitrary transcendental extension needs A.23, not algebraic-separable A.18.

### E2 — error; affects a stated result

Published §4 p.141, paragraph after Corollary 15, and its uses: proof of Lemma 16 p.142 ('We may assume that X is non-parabolic'), the remark after Definition 18 p.144 ('it is immediate to check that t-b.l. sections are quasi-t-b.l.') and the proof of Theorem A p.146; arXiv v3 §4 the same.

Correction: The sentence holds when the boundary is split (every section of A^1 or G_m lies in each cuspidal packet), and for proper genus-zero curves Schmidt's theorem gives X ≅ P^1 once the section is b.l. It is false for X ≅ P^1_k minus a closed point of degree 2, which has geometric sections but no cuspidal ones. That case of Theorem A needs its own proof, and so does the remark after Definition 18, whose identity-map argument needs X non-parabolic. Over number fields the extraction records a proposed repair (items /169–/177, not in the paper, unreviewed). Over fields of positive transcendence degree no argument is known: Proposition 22 takes quasi-t-b.l. sections as input. Theorem A for non-parabolic curves, and Theorems B and C, which only use hyperbolic curves, are unaffected. Items /96 and /112 state what is proved.

X = P^1_Q minus V(T²−2) is affine and parabolic, 0 ∈ X(Q) gives a geometric section, and the boundary has no Q-point, so X has no cuspidal section. Schmidt's theorem concerns the splitting of the completion, not rationality of the boundary. The reductions in Lemma 16 and in the proof of Theorem A therefore leave unhandled the t-b.l. sections of such X that are not geometric. Reclassified by cc-442dc5 from 'the proof' to 'a stated result', because the missing case of Theorem A has no proof in the paper or elsewhere over fields of positive transcendence degree. This is not a claim that Theorem A fails there.

Known correction: new. Independent decision: **confirmed**. Confirmed at the stated limited reach. P1_Q minus V(T²−2) has the geometric section of 0 but no Q-rational boundary point, so that section is not cuspidal. Schmidt gives splitting of the conic, not rationality of each boundary point. This refutes the blanket intermediate assertion; it is not a counterexample to Theorem A. The noncircular number-field proposal /169–/179 was checked separately; positive transcendence degree remains open here.

### E3 — gap; affects the proof

Published proof of Lemma 26 p.148; arXiv v3 Lemma 26.

Correction: First the images are geometric or cuspidal. After identifying the unique associated rational point x, compute the inverse limit over the cofinal opens omitting x.

If an open contains x, its image can be geometric. After removing x, uniqueness of the associated point and disjointness of geometric and cuspidal packets force cuspidality at x. The same cofinal limit computes the birational section. Matches E3 of the separate errata file.

Known correction: new. Independent decision: **confirmed**. Confirmed: the hypothesis gives geometric OR cuspidal. Use uniqueness/disjointness in Stix Theorem17(1)–(3), then the cofinal opens omitting the associated point. The inverse-limit packet comparison remains a named supplier, not a consequence of packet injectivity alone.

### E4 — gap; affects the proof

Published Lemma 8 proof p.138; arXiv v3 Lemma 8.

Correction: The choice-free comparison is Π_X/k^ab≃Π_P/k for the generalized Albanese torsor P. Use s=γ(*) to obtain a chosen-object equivalence with B_k TJ (and hence Π_J/k), as in /58 and /150–/152.

A geometric Albanese isomorphism supplies the same band, not a choice-free equivalence with the neutral gerbe of J. The image of γ(*) gives the required neutralization of Π_P/k, without a point of P or X. The missing descent/choice argument is now supplied in the report.

Known correction: new. Independent decision: **confirmed**. Confirmed as a missing choice in the proof, not a false existence theorem. The choice-free comparison uses the Albanese torsor P. The image of the distinguished object of B Zhat(1) neutralizes its gerbe; it does not supply a rational point of P.

### E5 — misprint; affects nothing

Published Lemma 9 proof p.140; arXiv v3 Lemma 9.

Correction: Choose qbar monic and a monic lift q of the same degree. In this paragraph p stands for f(p) ∈ U and k(p) for its residue field.

For R=Q[u]_(u), qbar=T and q=uT²+T reduce correctly, but the coprime factors T and uT+1 give R[T]/q≃R×Q(u), which is not finite over R. With a monic same-degree lift, finite freeness and the unit discriminant give the intended finite étale local extension. /66 already uses that correction. Reclassified by cc-442dc5 from 'the proof' to 'nothing': with the evident monic lift of the same degree the construction is exactly as printed.

Known correction: new. Independent decision: **confirmed**. Confirmed: take a monic lift of the SAME degree. The stated nonmonic example has a generic-only component and is not finite. The residue polynomial is that of f(p).

### E6 — misprint; affects nothing

Published §6 opening p.144; arXiv v3 §6, citation [Sti13].

Correction: The citation should be [21, Theorem B] (Stix 2015), not [20] (the 2013 book).

The discussion refers to the density theorem already cited as [21, Theorem B] in the proof of Lemma 16; the arXiv reference key likewise points to the book instead of Sti15. This is a reference correction, not a new theorem.

Known correction: new. Independent decision: **confirmed**. Confirmed in published p.144 and v3: the density theorem is Stix 2015 Theorem B, not the 2013 book.

### E7 — misprint; affects nothing

Dependency Bresciani, Essential dimension and pro-finite group schemes, arXiv:1904.00789v2, Lemma 5.8 proof, last sentence p.20.

Correction: The band is TA, the full Tate module, as in the lemma statement.

The proof identifies the gerbe with the inverse limit of gerbes banded by A[n]; its band is therefore lim_n A[n]=TA. The semiabelian variety A is not that profinite band.

Known correction: new. Independent decision: **confirmed**. Confirmed only for the inspected arXiv1904.00789v2 Lemma5.8 last sentence. The statement and inverse limit identify the band as TA, not A; no claim about the uncollated journal text.

### E8 — error; affects a stated result

Bresciani, arXiv1911.03234v3, Lemma4.4 p.8 (superseded by published Lemma3.6).

Correction: Restrict curves by an injectivity hypothesis; the publication uses Euler characteristic at most zero.

For x²+y²+z²=0 over Q, geometric π1 is trivial, hence the unique ordinary section becomes geometric over Q(i), but the conic has no Q-point (embed into R). The required genus≥2 application is unaffected.

Known correction: Published2025 Lemma3.6 adds χ(X)≤0; https://onlinelibrary.wiley.com/doi/full/10.1002/mana.70049. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E9 — misprint; affects nothing

Bresciani, arXiv1911.03234v3, Lemma4.5 proof p.9; published Lemma4.4.

Correction: Ghat/G = G ⊗ (Zhat/Z).

For G=Z the missing quotient cannot be omitted: Zhat is not divisible, whereas Zhat/Z is divisible. The corrected flatness proof gives the claimed intersection.

Known correction: Published2025 Lemma4.4 prints the quotient correctly; https://onlinelibrary.wiley.com/doi/full/10.1002/mana.70049. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E10 — misprint; affects nothing

Bresciani, arXiv1911.03234v3 p.9 after Lemma4.5; published §4.2 after Lemma4.4.

Correction: Use H¹(k,TA).

The preceding Kummer paragraph has the correct coefficient TA. A-torsors and full Tate-module torsors are different objects. The same slip remains in the publisher HTML.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E11 — misprint; affects nothing

Bresciani, Essential dimension and pro-finite group schemes, arXiv1904.00789v2, Lemma5.8 p.19.

Correction: The action has target A¹.

The following displayed trivialization (ρ,p₂):A×A¹→A¹×A¹ requires this codomain. This is separate from the TA band typo E7.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E12 — misprint; affects nothing

Bresciani, Some implications between Grothendieck’s anabelian conjectures, published p.263, LemmaA.21 proof.

Correction: Both self-references to the constant-group comparison should be Lemma A.20.

A.20 immediately preceding supplies the profinite-group/étale-group-scheme equivalence; A.21 is the statement being proved.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E13 — misprint; affects nothing

Borne–Vistoli, Fundamental gerbes, ANT13(2019), p.540, Proposition3.10 proof.

Correction: The two factorization paragraphs prove (1)⇒(4) and (4)⇒(1).

Condition(3) is the relative-gerbe criterion already handled by (2)⇔(3); the two paragraphs explicitly use the faithful-factorization condition(4).

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E14 — misprint; affects nothing

Bekka, arXiv2305.04803v1 p.10, Proposition6(ii) proof; published Proposition7(ii), p.381.

Correction: Replace with profinite completion.

The object and universal property in that paragraph are Prof(G/N). The published proof uses the corrected term.

Known correction: Corrected in the published Proposition7(ii), DOI10.1017/S0305004123000555, p.381.. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E15 — misprint; affects nothing

Schmidt, arXiv1503.08108v1 p.9, Lemma3.5 proof.

Correction: Use a direct sum of induced trivial modules, one for each Galois orbit of geometric boundary components.

A single induced permutation module requires a transitive action. Already two rational points in P1 give Z² with trivial action, not one transitive orbit. Shapiro applied to the finite direct sum still gives H¹=0; the subsequent argument is unchanged.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E16 — misprint; affects nothing

Milne, Abelian Varieties, author revision2022-01-02, Corollary6.5 p.9.

Correction: The (f+h) pullback must use L^−1.

Pulling back Corollary6.4 gives a negative exponent for all three pair sums. Take g=h=0 and f=id on an elliptic curve with L=O(0): the printed expression has degree2, so is not trivial.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E17 — misprint; affects nothing

Milne, Abelian Varieties, author revision2022-01-02, Theorem7.1 proof p.11, tangent-separation conditions.

Correction: Quantify over nonzero tangent vectors (also in the opening very-ampleness criterion).

The zero vector belongs to every tangent subspace. The intended separation criterion concerns nonzero directions, and the hyperplane argument works for those.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E18 — misprint; affects nothing

Bekka, arXiv2305.04803v1 p.9 and published p.380, start of §2.3.

Correction: The domain and codomain are Prof(G) and Prof(G/N).

This is the morphism induced by the profinite-completion functor; Proposition6(ii), published7(ii), and its diagram use Prof on both sides. The slip persists in the publication.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E19 — misprint; affects nothing

Bekka, arXiv2305.04803v1 p.9, projective-cocycle calculation.

Correction: Use c(n₁h₁,n₂h₂) in both occurrences.

The same line substitutes g₁=n₁h₁ and g₂=n₂h₂. The published p.380 corrects both arguments.

Known correction: Corrected in published p.380, DOI10.1017/S0305004123000555.. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

### E20 — misprint; affects nothing

Bekka, arXiv2305.04803v1 p.9 and published p.380, first conjugation displays.

Correction: End the conjugating word with g₁⁻¹, and order the matrix inverses as π̃(g₂)⁻¹π̃(g₁)⁻¹.

Conjugation by g₁g₂ has inverse word g₂⁻¹g₁⁻¹. The displayed second expansion reverses the two matrix inverses; for noncommuting invertible matrices these differ. These are transcription errors; the corrected conjugation comparison supplies the intended Schur-lemma argument. This does not certify the complete representation-theoretic proof, which the extraction does not use.

Known correction: new. Independent decision: **confirmed**. Independently checked the stated passage and the argument below; confirmation has exactly the version and scope stated.

## Source provenance

PDF pages below are file pages, not necessarily printed page numbers. A failed download does not count as reading.

| Source | Independently inspected scope | SHA-256, where acquired |
|---|---|---|
| [stix-local](https://arxiv.org/pdf/1203.3236v3) | PDF pages 1,2,3,4 | 0a1cfac490f6543e5308a9489c13f1e398091b2db3e4ee127d0e64c6ef7f5146 |
| [schmidt](https://arxiv.org/pdf/1503.08108v1) | PDF pages 1,2,7,8,9 | 50588809107082c3710fd614ba47eaf2b975bedb85d7d2153cab650dd3309ae2 |
| [implications](https://algebraicgeometry.nl/2021-2/2021-2-005.pdf) | PDF pages 14,15,16,32,33,34 | 768ca87a4659e905b2ae938db90a8224569de1776de6bc6aff05897a39372908 |
| [essential](https://arxiv.org/pdf/1904.00789v2) | PDF pages 19,20,27,28 | ebd07168cf1f4788148a76fe5536fbdd35fc4994b38427bb7f23854d117c4427 |
| [finite-type](https://arxiv.org/pdf/1911.03234v3) | PDF pages 7,8,9,10 | afb4928d25f9ab687c24621db5ca1b8f1e36ab5981205f52bce60b45f7ce11e6 |
| [stix-cusps](https://www.math.uni-frankfurt.de/~stix/research/preprints/STIXcuspsec20120802homepage.pdf) | PDF pages 8 | 5bd02d94605289e8a2f74d408f5155c66d24bb4b3331a42d154e217ea998173d |
| [valuative](https://arxiv.org/pdf/2210.03406v1) | PDF pages 3,4 | 344e8988a7be217368f92fc01579e8fdfd2a81947dd5b0afb6ace6ae108eb149 |
| [borne-vistoli](https://msp.org/ant/2019/13-3/ant-v13-n3-p01-s.pdf) | PDF pages 9,10,11,12,13 | 64fca3767f3c6cbd02fbf84f1fb456c7fda30c7bc95ddc8c8c84cd3bd8629111 |
| [spiess](https://arxiv.org/pdf/math/0009017) | PDF pages 8,9,10 | 41844e2c52b48d8b0c90a113bfec455aa29966969cfd4fa48b8672d95a62144b |
| [harari](https://pagine.dm.unipi.it/tamas/bash5.pdf) | PDF pages 2,3,4,5,6,7 | d03480351f96538230d37f23eeab59ee173cae5fa557004628a042398b63f8b2 |
| [bekka](https://arxiv.org/pdf/2305.04803v1) | PDF pages 4,9,10,15 | c6bbcc281e33c4d4e90b3f2b53c1975a1243a8cf7e9fb9686a30088192770b17 |
| [saidi-tyler](https://arxiv.org/pdf/1909.12099v3) | PDF pages 1,2,3,4,5 | 0d6f716ec09b02edf64f8d318f821d76cec618417a367449886e11c952ee654f |
| [stix-book](https://link.springer.com/content/pdf/10.1007/978-3-642-30674-7.pdf) | b'<!DOCTYPE html>\n<html lang="en" class="no-js">\n<head>\n    <meta charse' | — |
| [tamagawa](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1992BA14A2D63FA076DB39A34EC45E83/S0010437X97000614a.pdf/grothendieck_conjecture_for_affine_curves.pdf) | PDF pages 16,17,18,19,20 | dee792d37e9b3200e8e3fdc2ab81fc767f8fad4a1d2929503d09465e533bdcd5 |
| [finite-type-published](https://ricerca.sns.it/bitstream/11384/157066/1/Bresciani%20-%20On%20the%20section%20conjecture%20over%20fields%20of%20finite%20type.pdf) | HTTP Error 403: Forbidden | — |
| [koenigsmann](https://arxiv.org/pdf/math/0305226) | PDF pages 1,2,3,4,5,6,7,8,9,10,11,12 | 446f6ec66f95d60e55a3651ff63f43b3947e8961e454f03a325537f2e710a23a |
| [stix-erratum](https://www.math.uni-frankfurt.de/~stix/research/preprints/STIX-Evidence%20for%20SC-Erratum.pdf) | Author erratum dated2017-12-04 checked for relevance; concerns §15.2/Theorem223, not75/259. No successful acquisition of the book original. | e010aca0fced4a33e499f8bd263b328434957da9fa0cc93d357cfd9c38aab03f |
| [mattuck](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf) | Theorem7 and first proof page (published114) read; following partial excerpt not counted as full-page reading. Replacement /153–/168 checked independently, not the whole Mattuck proof. | 9d950c3d86f8c8cf1949ec34b42eff49a8f73cbebf199ccfbf01bc6dcd745f94 |
| [milne](https://www.jmilne.org/math/xnotes/AVs.pdf) | PDF pages 1,9,10,11,12 | bffdf81c57c77420b5454b31270007989d12f332abea62424be15c424079fc7c |
| [bekka-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/80B40A0068862D70F42175F047D2B0B3/S0305004123000555a.pdf/on_bohr_compactifications_and_profinite_completions_of_group_extensions.pdf) | PDF pages 8,9 | e21059cf7e16a55b91e99bac90db73c19a5cc06177cda63ad684d438d0da87b7 |
| [finite-type-wiley](https://onlinelibrary.wiley.com/doi/pdfdirect/10.1002/mana.70049) | HTTP Error 403: Forbidden | — |
| [published](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | PDF pages 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 | 77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148 |
| [arxiv-v3](https://arxiv.org/pdf/2108.13397v3) | Six finding passages compared; not a whole-version diff. | e23989fbac0cb38646d34a69f8c724611fd1f46a371122197e25f83f18cbb722 |
| [finite-type-published-html](https://onlinelibrary.wiley.com/doi/full/10.1002/mana.70049) | Independently read §§3.1–3.8 and4.1–4.8 in publisher HTML. Findings E8/E9 are corrected there; E10 persists. No published PDF was acquired. | — |

## Pinned declarations

All 16 cited source files were byte-compared with their raw files at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every credited statement was read with its surrounding hypotheses. The 24-declaration ledger includes the scalar inverse as a checked near match; only the multivariable theorem supplies /180.

- [mathlib:AlgebraicGeometry.Scheme.fpqcTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Fpqc.lean#L73)
- [mathlib:AlgebraicGeometry.Scheme.fppfTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Fpqc.lean#L52)
- [mathlib:AlgebraicGeometry.Scheme.fppfTopology_le_fpqcTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Fpqc.lean#L81)
- [mathlib:CategoryTheory.Pseudofunctor.IsStack](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsStack.lean#L43)
- [mathlib:CategoryTheory.Pseudofunctor.isEquivalence_toDescentData](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsStack.lean#L67)
- [mathlib:TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/TopCat/Limits/Konig.lean#L119)
- [mathlib:Subgroup.finiteIndex_iInf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Index.lean#L765)
- [mathlib:ContractingWith.exists_fixedPoint'](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/MetricSpace/Contracting.lean#L145)
- [mathlib:HasStrictFDerivAt.toOpenPartialHomeomorph](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean#L105)
- [mathlib:HasStrictFDerivAt.mem_toOpenPartialHomeomorph_source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean#L131)
- [mathlib:IsGalois.intermediateFieldEquivSubgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Galois/Basic.lean#L340)
- [mathlib:OpenPartialHomeomorph.hasFPowerSeriesAt_symm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Inverse.lean#L652)
- [mathlib:AnalyticAt.analyticAt_localInverse](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/InverseFunctionTheorem/Analytic.lean#L26)
- [tauceti:TauCeti.AlgebraicGeometry.AbelianVariety](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L90)
- [tauceti:TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/Completion.lean#L36)
- [tauceti:TauCeti.ProfiniteCompletion.continuousMonoidHom_ext](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/Completion.lean#L62)
- [tauceti:TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq_of_ne_zero](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/OpenSubgroup.lean#L66)
- [tauceti:TauCeti.isTopologicallyFinitelyGenerated_of_fg](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Generation.lean#L77)
- [tauceti:TauCeti.kummerMap_eq_one_iff](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L262)
- [tauceti:TauCeti.kummerClassMap_injective](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L287)
- [mathlib:MvPowerSeries.gaussNorm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean#L53)
- [mathlib:MvPowerSeries.HasGaussNorm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean#L60)
- [mathlib:MvPowerSeries.gaussNorm_add_le_max](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean#L95)
- [tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean#L100)

The search found only generic topological Galois-category/covering-space constructions, not an arithmetic fundamental gerbe or section theory; IsStack is not a gerbe implementation. Existing abelian-variety isogeny carriers do not prove all nonzero multiplication maps finite or supply generalized Jacobians/Tate modules. MvPowerSeries and Huber restricted-series carriers are credited above; one-dimensional elliptic formal-group evaluation is not a dimension-general logarithm. A keyword miss is not proof of mathematical absence. The reproducible result records the query, pinned candidate-file paths, atlas matches and an item-to-search-group ledger for every originally missing item.

## Changes made in place

The machine-readable before/after ledger records all 43 inherited item-field changes plus the new-item entry (44 total ledger records). Top-level changes include partial/revise status, precise source-reading provenance, source findings, route6 revision and ownership moves. Stable original item IDs and route numbers1–14 are preserved; new routes15–16 own /59 and /57.

- /7: `locator`.
- /8: `note`.
- /8: `planned`.
- /8: `reviewNote`.
- /8: `status`.
- /12: `locator`.
- /13: `locator`.
- /14: `locator`.
- /15: `locator`.
- /18: `name`.
- /18: `note`.
- /19: `library`.
- /20: `library`.
- /57: `note`.
- /57: `ownerCandidate`.
- /57: `reviewNote`.
- /59: `note`.
- /59: `ownerCandidate`.
- /59: `reviewNote`.
- /60: `library`.
- /66: `statement`.
- /67: `note`.
- /109: `note`.
- /112: `note`.
- /122: `library`.
- /136: `library`.
- /137: `library`.
- /138: `library`.
- /139: `library`.
- /154: `uses`.
- /155: `imports`.
- /155: `note`.
- /155: `statement`.
- /155: `tests`.
- /155: `uses`.
- /163: `note`.
- /163: `prerequisites`.
- /163: `proofSteps`.
- /163: `reviewNote`.
- /166: `proofSteps`.
- /166: `reviewNote`.
- /169: `locator`.
- /177: `proofSteps`.
- /180: `newItem`.

## Item checks

All inherited row statements/locators and replacement contracts were read. This ledger distinguishes library matches, named planned scope, and residual missing statements; detailed findings remain in each item and the machine-readable review.

| Item | Input → reviewed | Search groups |
|---|---|---|
| 1 | planned → planned | sections |
| 2 | planned → planned | sections |
| 3 | planned → planned | sections |
| 4 | missing → missing | sections |
| 5 | missing → missing | sections |
| 6 | missing → missing | sections |
| 7 | missing → missing | sections |
| 8 | planned → missing | sections |
| 9 | missing → missing | sections |
| 10 | missing → missing | sections |
| 11 | missing → missing | sections |
| 12 | missing → missing | sections |
| 13 | missing → missing | sections |
| 14 | missing → missing | sections |
| 15 | missing → missing | sections |
| 16 | missing → missing | fundamental, sections |
| 17 | missing → missing | fundamental, sections |
| 18 | missing → missing | cohomology |
| 19 | library → library | credited declaration / named stage |
| 20 | library → library | credited declaration / named stage |
| 21 | missing → missing | gerbes |
| 22 | missing → missing | gerbes |
| 23 | missing → missing | gerbes, fundamental |
| 24 | missing → missing | gerbes, fundamental |
| 25 | missing → missing | gerbes, fundamental |
| 26 | missing → missing | gerbes, fundamental |
| 27 | missing → missing | fundamental |
| 28 | missing → missing | fundamental |
| 29 | missing → missing | fundamental |
| 30 | missing → missing | fundamental |
| 31 | missing → missing | gerbes, fundamental |
| 32 | missing → missing | gerbes, fundamental |
| 33 | missing → missing | gerbes, fundamental |
| 34 | missing → missing | gerbes |
| 35 | missing → missing | gerbes |
| 36 | missing → missing | gerbes |
| 37 | missing → missing | gerbes |
| 38 | missing → missing | gerbes |
| 39 | missing → missing | gerbes |
| 40 | missing → missing | gerbes, sections |
| 41 | missing → missing | gerbes, sections |
| 42 | missing → missing | gerbes, sections |
| 43 | missing → missing | gerbes, sections |
| 44 | missing → missing | gerbes, sections |
| 45 | missing → missing | gerbes, sections |
| 46 | missing → missing | sections |
| 47 | missing → missing | sections |
| 48 | missing → missing | sections, cohomology |
| 49 | missing → missing | sections, cohomology |
| 50 | missing → missing | sections |
| 51 | missing → missing | sections |
| 52 | missing → missing | sections |
| 53 | missing → missing | sections |
| 54 | missing → missing | sections |
| 55 | missing → missing | fundamental, sections |
| 56 | missing → missing | jacobian |
| 57 | missing → missing | jacobian |
| 58 | missing → missing | jacobian |
| 59 | missing → missing | jacobian |
| 60 | library → library | jacobian |
| 61 | planned → planned | jacobian |
| 62 | missing → missing | jacobian, analytic |
| 63 | missing → missing | jacobian, cohomology |
| 64 | missing → missing | geometry |
| 65 | missing → missing | geometry |
| 66 | missing → missing | geometry |
| 67 | missing → missing | geometry |
| 68 | missing → missing | sections |
| 69 | missing → missing | sections |
| 70 | missing → missing | sections |
| 71 | missing → missing | sections |
| 72 | missing → missing | sections |
| 73 | missing → missing | sections |
| 74 | missing → missing | sections |
| 75 | missing → missing | sections |
| 76 | missing → missing | sections |
| 77 | missing → missing | sections |
| 78 | missing → missing | sections |
| 79 | missing → missing | sections |
| 80 | missing → missing | sections |
| 81 | missing → missing | sections |
| 82 | planned → planned | sections, hilbert |
| 83 | missing → missing | gerbes, sections |
| 84 | missing → missing | fundamental, sections |
| 85 | missing → missing | sections |
| 86 | missing → missing | sections |
| 87 | missing → missing | sections |
| 88 | missing → missing | sections |
| 89 | missing → missing | sections |
| 90 | missing → missing | sections, cohomology |
| 91 | missing → missing | sections |
| 92 | missing → missing | sections |
| 93 | missing → missing | sections |
| 94 | missing → missing | sections |
| 95 | missing → missing | sections |
| 96 | missing → missing | sections |
| 97 | missing → missing | sections |
| 98 | missing → missing | sections |
| 99 | missing → missing | sections |
| 100 | missing → missing | sections |
| 101 | missing → missing | sections |
| 102 | missing → missing | sections, geometry |
| 103 | missing → missing | sections |
| 104 | missing → missing | sections |
| 105 | missing → missing | sections |
| 106 | missing → missing | sections |
| 107 | missing → missing | sections |
| 108 | missing → missing | sections |
| 109 | missing → missing | sections |
| 110 | missing → missing | sections, cohomology |
| 111 | missing → missing | sections |
| 112 | missing → missing | sections |
| 113 | missing → missing | sections |
| 114 | missing → missing | sections |
| 115 | missing → missing | sections, cohomology |
| 116 | missing → missing | sections |
| 117 | missing → missing | sections |
| 118 | missing → missing | sections |
| 119 | planned → planned | hilbert |
| 120 | missing → missing | hilbert |
| 121 | missing → missing | gerbes |
| 122 | library → library | credited declaration / named stage |
| 123 | missing → missing | sections, hilbert |
| 124 | missing → missing | sections, hilbert |
| 125 | missing → missing | fundamental, sections |
| 126 | missing → missing | sections |
| 127 | missing → missing | sections |
| 128 | missing → missing | sections |
| 129 | missing → missing | sections |
| 130 | missing → missing | sections |
| 131 | missing → missing | sections |
| 132 | missing → missing | sections |
| 133 | missing → missing | sections |
| 134 | planned → planned | jacobian |
| 135 | missing → missing | jacobian, analytic |
| 136 | library → library | completion |
| 137 | library → library | completion |
| 138 | library → library | completion |
| 139 | library → library | completion |
| 140 | missing → missing | completion |
| 141 | missing → missing | completion |
| 142 | missing → missing | completion |
| 143 | missing → missing | completion |
| 144 | missing → missing | completion |
| 145 | missing → missing | completion |
| 146 | missing → missing | completion |
| 147 | missing → missing | gerbes |
| 148 | missing → missing | gerbes |
| 149 | missing → missing | gerbes |
| 150 | missing → missing | jacobian |
| 151 | missing → missing | gerbes, jacobian |
| 152 | missing → missing | gerbes |
| 153 | library → library | analytic |
| 154 | library → library | analytic |
| 155 | planned → planned | analytic |
| 156 | missing → missing | analytic |
| 157 | missing → missing | analytic |
| 158 | missing → missing | analytic |
| 159 | missing → missing | analytic |
| 160 | missing → missing | analytic |
| 161 | missing → missing | analytic |
| 162 | missing → missing | analytic |
| 163 | missing → missing | analytic |
| 164 | missing → missing | analytic |
| 165 | missing → missing | geometry, analytic |
| 166 | missing → missing | geometry, analytic |
| 167 | missing → missing | jacobian, cohomology |
| 168 | missing → missing | jacobian, cohomology |
| 169 | library → library | cohomology |
| 170 | library → library | credited declaration / named stage |
| 171 | missing → missing | cohomology |
| 172 | missing → missing | sections |
| 173 | planned → planned | sections, hilbert |
| 174 | missing → missing | sections |
| 175 | missing → missing | sections, cohomology |
| 176 | missing → missing | sections, cohomology |
| 177 | missing → missing | sections |
| 178 | missing → missing | sections |
| 179 | missing → missing | sections |
| 180 | new → library | credited declaration / named stage |

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BRESCIANI-24.result.json` passes. The intake file checker and an independent scope/coverage script verify the four deliverables, preserved179 IDs plus180, 158 missing items each routed once, all16 route verdicts, 20 independent source verdicts, the 24-declaration/16-file pin manifest, complete changed-field accounting and absence of private filesystem paths. Finite diagnostics check the coefficient-vs-pointwise distinction, parity obstruction, S3 fixed-coset condition, conjugation inverse order and multiplicative formal-log coefficients. They do not replace the mathematical proof audit. No Lean file is delivered and Lean was not run.
