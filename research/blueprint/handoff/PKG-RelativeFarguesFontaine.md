# PKG-RelativeFarguesFontaine handoff

Worker: Codex, session `codex-i965fD`; issue #9192. Winning claim confirmation: issue comment 6154243183. This run took one package job. The three package files are complete; no packet, assembled reader, decomposition or other roadmap was edited. The next programme step is the independent package review, not implementation or another claim by this worker.

## Inputs, coverage and ownership

Used the accepted RF0 packet (73 nodes, review `independent-review-REV-RelativeFarguesFontaine--RF0~2`, 2026-10-10) and RF4 packet (23 nodes, review `independent-review-REV-RelativeFarguesFontaine--RF4~2`, 2026-10-08), the assembled reader and its suggested file, the accepted library audit, and the RS-20 ownership split. The assembled reader predates some accepted corrections; the latest packets take precedence.

The README has 95 distinct numbered target sections. The RF0 forward pointer to punctured-Witt algebraicity is absorbed into its sole RF4 theorem, now §6.16; this explains 96 input nodes versus 95 sections. All 204 input API names and all 122 input named Checks occur in the package. Additional scalar, topology and negative-control Checks are retained. Every definition section has at least three Checks. Internal target links are unique and resolve; every explicit internal prerequisite points to an earlier section. Classical points and their four following comparisons move from the coefficient layer to §§4.1–4.5, after the Cartier theorem they actually need. This does not drop their APIs, tests or source statements.

Read both current upstream AdicSpaces and AlgebraicVectorBundles READMEs and suggested files completely. The current upstream roadmap revision was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti revision was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the nine roadmaps newer than the atlas snapshot, the Completed roadmaps, and the current library by mathematical objects and operations, then read the relevant bodies. No builds ran in either current checkout.

The following existing work is excluded, with retained variants explicitly scoped:

| Existing owner | Existing material excluded | Retained new content |
|---|---|---|
| `TauCeti/RingTheory/Huber/WittVector.lean` | `isHuberRing_adicTopology_span_p_teichmuller`, `isTateRing_adicTopology_span_p_teichmuller_iff` | General local coefficient fields, integral completed chart pairs and their sheaf comparisons |
| `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean` | `spaY`, `frobeniusHomeomorph`, the p-typical analytic locus and Frobenius topology | Relative all-E ringed spaces and completed period interfaces |
| The current `Window.lean` in that directory | Radius-bound predicates, rational wandering windows and their covering | All-E radius/norm comparisons, relative Huber pairs and sheaves |
| The current `Quotient.lean` in that directory | `spaX`, `quotientMap_eq_iff`, open quotient map, window embeddings, compactness, T₀ | Relative analytic quotient, diamond presentation and sheaf comparisons |
| TauCetiRoadmap.AdicSpaces, Layers 3–6 | Generic rational presheaf, sheaf/gluing machinery and absolute ℚ_p curve | Period-specific relative extensions and comparison to the absolute anchor |
| TauCetiRoadmap.AlgebraicVectorBundles and current VectorBundle modules | Scheme finite locally free bundles, rank, affine finite-projective comparison, tensor, dual and pullback | Analytic/formal divisor patching and its curve-specific comparisons |
| VectorBundlesAndIsocrystals, VB1–VB4 | Arbitrary-rank isocrystal functor, global cohomology/generation/GAGA, Div¹ properness/smoothness, integral Frobenius foundation | Rank-one sign, covered Proj charts, modification and lattice applications |
| BunGAndNewtonStrata, BG0; GeometricSatakeAndFusion, GS0 | Torsor tensor dictionaries; loop quotients/Grassmannians | Transfer of linear patching to modifications, faithful-representation recognition and ordinary descent |

The generic proof helpers stay inside their period theorem: coefficient-choice comparisons, diamond product/quotient topology and the norm bound are not imported from their own target. P-typical primitive quotient arguments use PerfectoidSpaces' independent distinguished-element criterion, rather than the later geometric ramified-theta result. `FoundationsAndLibraryIntegration` and `UPSTREAM:` references were replaced by actual library declarations or named ownership contracts.

The old BG0 reverse modification dependency is absent from the current BG0 packet and is resolved. The remaining BG0 issue is the precise breadth of its dictionary, not that former cycle. RelativeFarguesFontaine is outside the 94-roadmap Caraiani–Newton tier list. Its portable linear patching can be placed at AInfCohomology's foundation; AI.2 must not acquire a blanket dependency on the full relative curve. This is an ownership/routing note for the maintainer, not a tier-file edit.

## Explicit proof and supplier boundaries

The accepted inputs deliberately retain nine RF0 and six RF4 obligations. The package does not claim that these are implemented, or that compilation proves their geometric results. Exact supplier contracts and the relevant targets preserve them:

- R0 must handle continuous integral coefficient maps which are not adic for the weak coefficient topology, completed coefficient tensors, finite quotients and topological module splitting. The Stein step needs a convergent Banach correction, not algebraic Mittag–Leffler alone.
- P1 must supply the BMS integral criterion with a regular u, u^p dividing p, completeness and the stated Frobenius bijection. The period calculation verifies the root relations and still owes the topology/regularity comparison.
- The all-E annular estimates need coefficient transport in mixed characteristic and a separate equal-characteristic calculation. P-typical KL statements are labelled as such; replacing p with π is not a proof.
- The inverse integral geometric degree criterion, §3.6, is conditional on independent local factorization and v-local descent of ordered primitive legs. The forward product/length theorem is independent. Fargues Proposition 2.18's Picard/Banach–Colmez proof cannot be imported as an early prerequisite.
- Ordinary norm-controlled matrix correction is required for line bundles and every finite Cartier thickening. Almost vanishing and function descent alone do not supply effective ordinary bundle descent.
- LocalFieldsRamification Part II must supply the formal O_E-module, scalar action, logarithm, simple torsion zeros, marked LT tower/tilt and reciprocity. The whole-ratio coefficient-root tower is different. Nonperfect Cohen lifts need the full cotangent-complex contract in DD.0 and are not canonical perfect strict lifts.
- The affinoid PreTilt/theta/Cartier comparison and selected ramified de Rham factor must be proved before invoking the p-typical R06.1 theorem. Rational/finite-étale completion base change needs strict finite-quotient comparisons; no arbitrary tensor/limit exchange is asserted.
- VB2 owns U=X and the global Proj/GAGA/twist/affine-complement results; early §5.6 only maps the section-covered U. VB3 owns late Div¹ properness and smoothness. VB4's existing `integral-frobenius-local-systems` node supplies SW 12.3.4; SW 12.3.5 and 12.4.1, including the normalized φ⁻¹ tail and morphisms, are the requested extension at the same independent foundation.
- R3's arbitrary analytic-complement/formal patching requires a precisely defined puncture and algebraic models for compatible data and morphisms. §§6.8, 6.9 and 7.2(iii) are explicitly conditional on that stronger contract. Fixed-reference bounded modification gluing does not supply it. Restrict the arbitrary-input scope if necessary bounds/algebraizability cannot be proved.
- BG0 must supply the flat-linear scheme dictionary, smooth integral adic dictionary and field tensor-generator/restriction theorem. Deligne–Milne's field theorem does not imply an integral version. D2/D3 must provide ordinary vector-bundle descent, not just functions.
- The completed pointed-étale stalk comparison is now a named theorem obligation in §3.8. It specifies closed R_T, common regular t, R=colim R_T, localization, completed geometric fibre, and preservation of smooth sections, including collisions. In §7.6, I=R in Gabber–Ramero is different from the Cartier ideal. Regularity, henselianity and that comparison must be established before approximation.
- Missing geometric carriers remain README targets and are named in the Lean closing index. No omitted data body, artificial carrier or already-formalized claim substitutes for them.

## Corrections to stale inputs and source conventions

Only the package was corrected; the input files remain unchanged as the issue requires.

1. The LT punctured perfected disc first presents Spd(F)×Spd(E_LT∞). Quotient by O_Eˣ to obtain Y_F, then take the separate Frobenius quotient for X_F. The older assembled reader omits the coefficient-unit quotient.
2. The root chart roots the whole π/[ϖ] ratio. The relation π_m=v_m s_m and its special-fibre/nonunit witness exclude the reciprocal and independent-root readings. The November 2024 FS II.1.1 formula has the sharp reversed; the February 2021 author copy has the intended direction.
3. FF 2017 Lemme 1.2.3 must apply F_E^(f−1) before the coefficient comparison in the Verschiebung formula. The 2018 corrected author copy, p. 7, supports this. FF 2017 Proposition 1.4.9's leading product factor is π^(n₀+m₀); the corrected copy, p.16, repairs it.
4. FS II.1.10's Gauss-radius hypothesis is made explicit as 0<ρ<1. Membership in its printed open disc already excludes ρ=1; this is not logged as a source misprint.
5. KL 5.2.8/5.2.10 use z=x−y and y=x−z. KL 5.2.12 separates the eigenweight n from iterate m. The integral/bounded/plus/intersection rings and their strictness hypotheses remain distinct.
6. KL 3.6.3/3.6.4's primitive quotient has unit constant coefficient and does not supply the π=0 leg. KL 3.6.11 has the incomplete argument corrected by KL II3.3.13–3.3.14, pp.61–62.
7. KL 5.5.2 uses z₀=z and R̃^(int,s) in its concluding display. KL 5.5.3 constructs a module over the period ring, not over its finite-étale category. KL 5.5.5 uses x₀ and the spectral norm. In KL 8.2.20 the finite-étale map is Z_ij→Y and Y_ij→Z_ij is open.
8. KL 8.8.20(b) is a conjecture. A repeated Cartier leg has a nonreduced finite quotient and is not thereby perfectoid. The early package asserts no relative noetherianity or unsourced classification.
9. KL's normalized φ^a slope for L_X is 1/a, with a=2 giving 1/2. The rank-one geometric twist still has degree 1; the FS isocrystal operator π⁻¹σ has slope−1 in its different normalization. Positivity, not a forced equality to1, proves the KL ampleness step.
10. The Fontaine B_e/φ=1 specializations are restricted to a=1. For general a the graded piece is the actual φ^a eigenvalue p^n piece. The input B_e^{φ=p} check is false: φ fixes B_e, so this eigenspace is zero. For O(1) use the lattice t⁻¹B_dR⁺ and B_e+t⁻¹B_dR⁺=B_dR to compute H¹=0.
11. The formal completion ring and its associated affine scheme Spec are distinguished. Completion is of the ambient ring along the Cartier ideal, not of the divisor quotient along zero. Infinite flat-module pullback is tensor with the completed ring, not completion of the module.
12. SW 17.1.8 is a Lemma. SW 19.5.3's internal reference to17.1.1 is corrected to it. The argument yields ordinary bundles after convergent correction.
13. Guo–Reinecke's publisher/NSF and arXiv v3 editions have separate reference anchors and pagination. Deligne–Milne's 2018 edition has the tensor-generator footnote 11, not the older edition's footnote 10.

## Source audit receipt

Read sources directly, in their specified editions; no cleared-source file or passage was copied into scratch or the repository. Public author PDFs used for edition comparisons were temporary scratch downloads and are removed after submission. The following sample is reproducible: concatenate the 73 RF0 and 23 RF4 node lists in input order, then `random.Random(9192).sample(nodes,15)`. Sections below use the final numbering.

| Sample target | Locators read | Result |
|---|---|---|
| §6.5 non-noetherian patching | SW Lemma 5.2.9 and following remark, p.38; Stacks15.92.16/tag0BP2 and 15.92.19; KL 1.3.6, pp.16–17 | General glueable-module equivalence and finite-projective detection distinguished from SW's regular-module specialization; KL's separatedness is not imported into the general Stacks statement |
| §7.5 group base change/legs | FS VI.1 before DefinitionVI.1.5, p.192; DefinitionVI.1.6 and remark, p.193 | Intrinsic ideal completion, scalar maps, disjoint products and collision compatibility agree |
| §0.20 base gluing | FS PropositionII.1.3, p.49 | Open inverse-image comparison and gluing, rather than a structural map to S |
| §4.4 classical base change | FS PropositionII.1.9 and proof, pp.51–52 | Whole fibre versus presence of a classical point, and rank-one scope retained |
| §1.6 controlled splitting | KL 5.2.6–5.2.10 and Remark 5.2.13, pp.117–121 | Correct signs, complete-element approximation, ambient intersection and strictness |
| §1.10 interval pair | KL 5.3.4, p.122, and Definition 5.3.10, p.124 | Actual completed plus ring and valuation projection; no additive Teichmüller map |
| §1.17 local generation | KL Lemma 5.1.7, p.116 | Generation only after a rational neighbourhood of the specified seminorm |
| §6.10 multiple legs | FS DefinitionVI.1.6 and following remark, p.193; SW 12.4.6  proof, pp.106–107; FF 2017 Proposition 5.3.1, p.209 | Locally finite support and colliding-ideal cofinality, with separate numbered bounds |
| §3.9 divisor addition | FS DefinitionVI.1.1/PropositionVI.1.2, pp.190–191; Fargues §2.4 before Proposition 2.18, p.11 | Product ideals and CRT only for disjoint supports |
| §6.15 integral lattices | SW 12.3.4/12.3.5, p.104; 12.4.1, p.105; 12.4.6, pp.106–107; 14.1.1, pp.115–116; BMS Remark 4.29, p.43 | T is retained; no-leg and normalized-tail reconstruction have the independent VB4 owner |
| §4.7 Div¹ | FS DefinitionII.1.19, p.56 | F_q and algebraically closed coefficient-base presentations kept distinct |
| §1.15 Stein exhaustion | FS II.2 opening, p.57 | Countable compact annuli and dense restrictions; Banach correction made explicit |
| §4.13 completion base change | FS VI.1 completion definitions, p.192 | Maps and descent are separated from additional strict completed-tensor isomorphisms |
| §4.2 disc tilting | FS PropositionII.1.8 and preceding construction, p.51 | Marked equation π−[a], zero leg and topological scope |
| §1.5 growth/invariants | KL 5.2.1–5.2.4, pp.116–117; 5.2.11, pp.119–120 | Positive norm for log, actual growth ring, disconnected fixed constants and plus criterion |

Also read the previously problematic Gabber–Ramero arXiv v3 Proposition 5.4.21 and Claim5.4.22, pp.121–122. The smooth affine approximation uses regular t and a henselian (R,t) with I=R; its geometric-stalk identification is an additional required theorem. Read Deligne–Milne 2018 Propositions2.20(b),2.21(b), pp.25–26 and footnote 11; their tensor-generator criterion is over a field. Checked the false B_e eigenvector control and the KL slope conventions against Definition 4.1.6, p.104, Convention 4.1.13, pp.105–106, and Lemma 8.8.19, p.186. Re-read Kedlaya A_inf Definition 3.5/Proposition 3.6/Theorem 3.8, pp.7–9: primed ring isomorphisms are not topological, and A₂ is only proved uniform. Other source locators inherit the accepted inputs; this audit does not claim a new independent verification of every cited page.

Edition fingerprints (SHA-256):

- FS November 2024, 356 pages: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
- FF April 2017, 399 pages: `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`. PDF page is printed page+10; Proposition 5.3.1, printed209, is PDF219.
- FF corrected November 2018, 404 pages: `8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79`.
- Fargues October 2017: `35c7268fd6ce086f1267a00c18e02900c87ed5da65781d3b8695644d6e8fef73`.
- Kedlaya A_inf v5: `ee95ce2f5a96529f77661852046c29aa641803e6df5c5c771bb3484e9a2d3530`.

## Adversarial mathematics pass

Walked all 95 target statements, their identities/APIs/Checks, and the standing conventions. The grouped coverage below covers every target section; cases outside the standing hypotheses were used as negative controls, not as instances of the geometric theorem. This is the author's pass, not an independent review.

| Statements checked | Instances and computed witness | Outcome or correction |
|---|---|---|
| §§0.1–0.6, ghosts, Dwork, operations and V | n=0 gives x₀, n=1 gives x₀^q+πx₁; zero algebra; π-torsion algebra; p=2 has [1]+[1]=2 rather than0; π′=uπ scales V byu | No ghost injectivity or VF=π on arbitrary torsion/non-residue inputs; V-completion distinct from π-completion |
| §§0.7–0.10, strict lift and coefficients | R=0; R=F_q recovers O_E; imperfect F₂[T] fails square surjectivity; unramified residue degree 2 uses the second old ghost and F²; equal characteristic gives constants in R[[π]] | Perfection and identified maximal-unramified tensor base retained; no nonperfect uniqueness |
| §§0.11–0.14, twisted and LT lifts/topology | Q=X^q passes; X²+1 fails modulo 2; unit π passes the scalar predicate but is not a uniformizer; Q=(1+X)²−1 sends [1]_Q to−1, whose square is1 | Twisted Teichmüller is not multiplicative; formal-group addition/scalars and weak topology kept separate |
| §§0.15–0.20, integral charts and gluing | π=0 allowed; |π_m|=|v_m| gives |s_m|=1; at π₀=0 with v₀ inverted, s₀=0 and is not a unit; empty base; open base refinement | Whole-ratio root relations, non-adic coefficient contract and retained integral end explicit |
| §§0.21–0.22, analytic union/sheafiness | p=0 and [ϖ]=0 are different ends; union D(p)∪D([ϖ]) contains both; the first chart has Tate unitp, second [ϖ]; primed chart topology differs | Existing underlying locus excluded; completed pairs/sheaves/overlap are new; no stable-uniform claim for A₂ |
| §§1.1–1.4, domains, radius, norms and rings | Generic π=0 excluded; |π|=1/2,|[ϖ]|=1/4 gives radius 2 and cubing gives6; log denominator at 1 vanishes; s=r valid; Teich norm α(x)^r; β(p−[ϖ])=0 but λμ=p⁻¹ | Positive/nonzero domain, higher-rank rational interpretation and plus/infinity distinctions explicit |
| §§1.5–1.8, growth, splitting and sheaves | x=0 excluded from log; F_p×F_p has two fixed components; n=0 splitting; z=x−y; strict overlap intersection; empty-open ring 0; actual12/9/3 variants | No scalar-only fixed field, naive infinite coefficient expansion or universal acyclicity |
| §§1.9–1.14, interval descent and finite étale | Singleton/endpoints; split two-copy finite-étale map; normalized primitive z₀ unit and z−[z₀] a p times unit; special legπ excluded from this normalized quotient | Actual plus ring and root scalar extension; Frobenius descent at fixed radius; corrected KL II criterion |
| §§1.15–1.17, exhaustion/choices/generation | Affinoid versus nonaffinoid base; dense nonsurjective restrictions; ϖ→ϖ² doubles radius; finite generating set only near β | Banach inverse-limit correction and local scope retained |
| §§2.1–2.5, quotient, topology and LT | q=1 forbidden by prime-power setup and cannot give a free radius action; endpoints1,q identified; π=0 excluded; split base gives two curves; two distinct LT/φ quotients | Ringed relative quotient and diamond comparisons; no adic structural base projection |
| §§3.1–3.3, primitive equations and ordinary descent | ξ=π at a characteristic-p leg; multiplication regular on the normalized common ball; nontrivial descent line may lack a global generator | Product regularity/norm and ordinary matrix correction required; almost statements insufficient |
| §§3.4–3.6, symmetric divisors/product/degree | d=0 gives final sheaf/empty divisor/equation 1/ring 0; (a,a) has degree 2 and a swap stabilizer only in the action stack; ξ² has length2 | Orbit sheaf distinct from quotient stack; inverse integral factorization remains a conditional separate proof |
| §§3.7–3.9, thickenings/completion/addition | ξⁿ for n≥1; ξ anduξ have same ideals; ξ²-adic andξ-adic completions same ring with different indexed filtration; disjoint CRT versus nonreduced A/ξ² | Ambient completion, finite-thickening descent and extra completed-stalk comparison retained |
| §§4.1–4.5, classical/Gauss points | a=0 support(X); small nonzero a support(X−a); positive-radius Gauss support 0; ρ=0 classical andρ=1 outside open disc | Classical marking and rank-one fibre scope; explicit radius bounds |
| §§4.6–4.10, untilts/de Rham | π invertible for generic leg; mixed ramified coefficient embedding selects one completion factor; equal characteristic uses intrinsic Cartier completion; multileg not a DVR | Actual PreTilt/localized-theta comparison required; no unrestricted scalar tensor identity |
| §§4.11–4.13, filtration/DVR/base change | m=0 gives O_D; ξ→uξ scales gr^m byu^m; B⁺ graded nonnegative while punctured B graded Laurent; one geometric leg versus disjoint product | Conormal tensor powers intrinsic; continuous finite-quotient/completed comparisons only |
| §§5.1–5.3, twist/eigenweight/boundary | n=0 multiplier1; n=1 π⁻¹; n=−1 π; zero section; φ=id,π≠1,x=1 fails weight 1; p=2 signs; crystalline end retained | Isocrystal slope−n and geometric degree+n; nonnegative KL eigenweights distinguished from iterates and negative twists |
| §§5.4–5.6, LT section/Proj | Nonzero LT torsion parameter gives a simple zero; degree-two-only graded generators forbid assuming a degree-one cover; fractions a/g^k have degree 0 only if deg a=k deg g | Marked logarithm contract; map only on covered U until VB2 supplies coverage |
| §§6.1–6.3, exact squares | Identity square gives diagonal; ℤ[1/2],ℤ[1/3] transition3 gives generator(1, 1/3); (1, 1) fails; doubled k[x,1/x] square misses x⁻¹ | Difference sign pinned; all exactness places, universal finite-projective surjectivity and maximal-ideal hypotheses retained |
| §§6.4–6.5, glueing pairs/modules | f=0 gives whole torsion set; f=1 gives{0}, completion0 and ordinary R-modules; class1 inℤ/4 killed by 2² but not2; ℤ→Z/2 withf=0 fails | No noetherian/flat-completion shortcut; arbitrary-module finite-projective detection kept with actual glueing-pair hypotheses |
| §§6.6–6.10, modifications and collisions | Zero module singleton; unit ξ gives empty divisor; regular nonunit ξA bound 1 fails bound 0; 2D₁ turns bound 2 into bound 1, not into bound 1 atD₁ | Two-sided bounds and direction of β; arbitrary-complement contract; collisions retain intermediate chain data |
| §§6.11–6.14, B-pairs/cohomology | a=2 slope 1/2 positive; a=1 has φ(1/t)=p⁻¹/t; B_e^{φ=p}=0; O(1) lattice t⁻¹B⁺ gives H¹=0; flat infinite modules use tensor | Normalization and false test corrected; finite projective triples, field PID scope, formal Spec distinction |
| §§6.15–6.16, integral T/algebraicity | T=0 trivial; multiplication 1/p fails preserving T=ℤ_p; tΞ₀⊂Ξ⊂Ξ₀ has C-subspace quotient; arbitrary perfect Tate base versus valued field | Integral T and recovery retained; freeness/extension confined to field case; no all-E claim from p-typical algebraicity |
| §§7.1–7.3, torsors/faithful recognition | G=1 and GL₀ give trivial data; G_m lattice ξ^k yields O(−k); trivial representation cannot detect a nontrivial G_m modification; V⊕V∨ bounds add | Tensor/dual sign fixed; both directions meromorphic; no field-to-integral tensor-generator inference |
| §§7.4–7.7, functoriality/descent/final modification | Identity group map/base change; disjoint versus repeated legs; nonreduced completed stalk; tautological lattice returns P; SL₂ lattice ξB⁺⊕B⁺ has determinant ξB⁺ | Closed immersion only for field recognition; reductive approximation scope; faithful linear lattice alone is insufficient |

## Lean and validation

`Suggested.lean` has 329 lines, 14 real-bodied definitions/structures and 31 proof placeholders. It imports Mathlib, uses the single namespace `TauCetiRoadmap.RelativeFarguesFontaine`, and has each layer in README order. The geometric definitions are indexed in its closing comment. Every README definition name occurs either as a declaration or in that index. There are no data definitions, abbreviations or instances with sorry bodies, no constructions hidden behind carriers, and no theory-development lemma chain.

Elaborated using `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Final exit status 0; 31 diagnostics, all exactly the expected declaration-uses-sorry warnings. Available memory was 104 GiB before the final run; one compile ran, and it finished. No language server, Lake build/update/cache operation or background compile was started.

Ten signature comparisons against the README:

| Lean declaration | Prose comparison |
|---|---|
| `ramifiedGhost` | Arbitrary commutative coefficient algebra; finite polynomial formula has no perfectness/flatness hypothesis |
| `ramifiedWittPolynomials` | Actual multivariable polynomial; not a purported Witt-ring carrier |
| `ramifiedGhost_natural` | Uses an O-algebra map; torsion inputs allowed |
| `WittTwistAdmissible` | Every coefficient of Q−X^q divisible by π; scalar predicate wider than the geometric uniformizer setup |
| `twistedGhost` | Iterated Q evaluation, with first ghost Q(x₀)+πx₁; ordinary specialization has the same scope |
| `periodRadiusValue_frobenius` | Positive π-value less than 1 and positive Teich value; scalar identity permits all natural q, geometric action requires q≥2 |
| `twist_invariance_iff` | Field unit π prevents division by 0; integral exponent and actual ring endomorphism, sign π⁻ⁿ |
| `ExactSquare` | Commuting scalar towers and injective/middle/surjective difference sequence; no flatness imposed |
| `beauvilleLaszlo_finiteProjective_iff` | Arbitrary module under the real glueing-pair predicate; both finite and projective at each corner |
| `beauvilleLaszlo_effective` | Actual common localization L, compatible scalar towers, finite-projective pieces and explicit pure-tensor transition compatibility |

The additional local bound predicate has actual localization/submodule carriers, finite-projective conditions and both pole bounds; its regular-nonunit and zero-module examples agree with §6.6.

Validation commands/results:

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF0.json research/blueprint/packets/RelativeFarguesFontaine--RF4.json`: both input packets have 0 errors and 0 warnings; they are unchanged.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- `git diff --cached --check`: passed.

Resume at independent review of the package, particularly the explicitly conditional supplier interfaces above. There is no unfinished package-writing task or checkpoint claim. Source-audit scope, current-library exclusions and mathematical boundaries are all recorded here so no scratch file is needed by the next worker.
