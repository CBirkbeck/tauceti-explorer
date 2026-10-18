# FIX-PKG-ModularityAndLanglandsExtensions~adv2

Completed by Codex, session `codex-4rTxzb`, for #10409 on 2026-10-18.

The [package README](../packages/ModularityAndLanglandsExtensions/README.md) is compacted; the accepted mathematical scope and the original [Suggested.lean](../packages/ModularityAndLanglandsExtensions/Suggested.lean) targets are retained, with two additional convention examples. No target is claimed formalised. This is the issue's requested repair and boundary audit, not an independent review of this worker's changes.

## Inputs and disposition

The requested `REV-PKG-ModularityAndLanglandsExtensions~adv.md` does not exist in this checkout. Read all three existing package reports (`REV-PKG-ModularityAndLanglandsExtensions.md`, `~2.md`, `~3.md`); the last is the accepted independent review from #10232. The concrete compaction/split-identity instructions in #10409 are the new findings addressed here. No missing report was invented.

| Finding or requirement | Disposition |
| --- | --- |
| Accepted README is too large to port | Reduced 604,135 bytes to 349,769 bytes (42.1%); 341.6 KiB. Shortened proof routes, consolidated common hypotheses in the contracts/conventions, used unambiguous source and supplier keys, removed repeated citation edition metadata, and shared repeated Markdown destinations. Theorems remain prose statements with locators. |
| Preserve targets, hypotheses, APIs, Checks and suppliers | All 157 numbered targets, 263 explicit anchors, 87 reference entries, 217 API bullets containing 236 code-formatted names, 71 Checks lists containing 335 bullets, and 46 C-/From contract headings remain. Every original bold label remains; total bold spans increased from 131 to 162. Other supplier/convention headings, including theta/descent, polarization, induction, and comparison ownership, remain as well. |
| Resolve old AnalyticNumberTheory identity | Named AnalyticNumberTheoryPartI, Layers 0–3. Its exact supplier contracts import the Wiener–Ikehara/PNT input from ArithmeticDirichletSeries, Layers 9–10. Its §§2.11, 2.29–2.29e own the Artin local/meromorphic/induction/archimedean interfaces; §2.32 is a boundary, not general Artin holomorphy. The contract explicitly converts its arithmetic Frobenius to this package's geometric Frobenius by inversion/equivalent contragredient convention. No Part II result is silently imported. |
| Resolve old ArithmeticStatistics identity | Named ArithmeticStatisticsPartI §0.2 for relative density in its height-ordered family (§0.1), and its supplier InverseGaloisAndArithmeticFundamentalGroups §§IG.2.5–IG.2.7 for the quantitative thin-set/Hilbert-specialization/local-condition interfaces. §2.30 states the integer-box bound with N≥2; it does not promise density among unordered isomorphism classes. |
| Audit against current upstream roadmaps/library | Consulted current read-only TauCetiRoadmap and TauCeti, the reviewed library audit, current split packages and exemplar. Existing class-field, Chebotarev, compact-group, Heisenberg and oscillator objects stay imports/comparisons. Chebotarev's cyclotomic count is not promoted into the separate analytic number-theorem contract. No new duplicated library construction was added. |
| Keep the earlier review's mathematical repairs | Endpoint status stays in Conventions; no EndpointRecord target returns. §§4.22, 4.35, 4.37 retain Thorne 2024 Thm. 8.1/Prop. 8.3 (arXiv:2212.03591v2 pp.47–50), completing the mixed-parity route and its infinite-place matching. §2.51 retains l>n and ACC+ 6.1.2(4). No hidden PL.* input returns. §1.10 retains its genuine CM base-change Check. §5.2 retains the nontrivial L-map from the trivial group. §§5.8–5.9 import SR.6.1–SR.6.3 rather than re-plan cocycle/excursion constructions. |
| Generality and normalization | Kept connected-reductive/general-degree/finite-slope scope where supplied, including finite extensions of ℚ_p in §4.3. Kept geometric Frobenius, HT(ε)=−1, polarization/duality bridge, weighted vs ordinary transfer, all-place vs weak matching, q rather than coefficient-prime scaling, angular signs, and the computed Jacquet modulus distinction. Boundary audit clarified that §3.6's zero sign kernel is the singleton odd-block case; mixed odd/even blocks retain free signs. |
| Lean and false/vacuous declarations | Suggested.lean retains five light real definitions, eleven theorem targets with sorry and all twenty-eight proved examples; two further proved numerical examples mirror the Heisenberg/oscillator Checks in §3.1. There are no sorry'd data, fake heavy carriers, True placeholders, auxiliary development, or hidden variable/include assumptions. The three numerical definition groups and image predicate retain the exact README generality. |
| Source discipline | Wrote compressed statements in own words, preserving theorem/section/page locators and linked edition choices. Kept alternate manuscript/journal page correspondences where present. No source passage or source file was added. The new supplier-identity checks read the suppliers themselves; this compaction does not claim a fresh primary-PDF verification of every deep theorem. |

## Inventory and verification method

Compared the baseline commit with the final file, expanding collapsed Markdown references before comparing source destinations. Exact numbered headings, explicit anchors and API names agree; every target retains its set of source-reference anchors. Check lists retain every bullet slot and every discriminating instance, including negative controls. Each list has at least three bullets (minimum three, maximum thirteen). Each layer retains Examples and Dependencies; the full convention, ownership, downstream and reference structure remains.

| Inventory | Before | After |
| --- | ---: | ---: |
| README bytes on disk | 604135 | 349769 |
| Numbered targets, Layers 0/1/2/3/4/5 | 4/15/52/32/43/11 | 4/15/52/32/43/11 |
| Bold spans (all original labels retained) | 131 | 162 |
| Explicit anchors / bibliography entries | 263 / 87 | 263 / 87 |
| API bullets / names within them | 217 / 236 | 217 / 236 |
| Checks lists / bullets | 71 / 335 | 71 / 335 |
| C-/From supplier headings | 46 | 46 |
| Lean definitions / theorem targets / examples | 5 / 11 / 28 | 5 / 11 / 30 |

The inventories are diagnostics, not a substitute for the statement audit below. In particular, equality of source-anchor sets does not by itself verify a hypothesis or page number; these were preserved while reading and editing the relevant paragraphs.

## Adversarial pass

Each row covers the numbered statement, its API claims and local proof-route assertions. All rows received a scope check against the following matrix: trivial group; rank 0/1 and n=0/1/2; zero module and unit ideal; field versus DVR; p=2, characteristic p and residue field 𝔽₂; q=1; and noncompact input. A case outside the stated carrier or hypotheses is rejected there, rather than treated as a counterexample to an inapplicable theorem. Residue cardinalities of local fields are at least two. Characteristic-zero coefficient and odd-prime hypotheses are never silently removed.

The table records symbolic/numerical boundary tests and dependency checks, not a proof of the planned deep theorem. Unless a change is specified, the disposition is preservation under compaction. Heavy objects remain README targets; only the existing numerical/light-object witnesses are Lean examples.

### Layer 0

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| 0.1 realization L-comparison | Rank 1; rank 2; a ramified omitted factor; two real signs with equal Hodge data | Shift is respectively 0 and −1/2. Partial matching does not supply ramified or real factors. Retained separate purity/irreducibility/epsilon premises for the full comparison. |
| 0.2 NT automorphy | Rank 1; reducible isobaric sum; same representation with unspecified multiplier | Cuspidality and realized Hecke multiplier are essential. Retained conjectural status of general irreducibility and the polarized comparison's hypotheses. |
| 0.3 Hodge list and API | (k,r)=(2,1),(0,1),(0,2); arbitrary k≥0 at r=2 | Lists [0,−1,2,1], [0,−1,0,−1], [0,0,1,1]; length always four. Six pair differences give the three exact exclusions. All three Lean examples remain. |
| 0.4 expected singular-weight realization | r=2; repeated weights; bad level p; arbitrary coherent degree i | Repetition is allowed and realization remains conjectural. Only the specified cohomological good-p Newton inequality is known here; all degrees/cuspidal variant retained. |

### Layer 1

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| 1.1 accessible/n-regular refinements | n=2,3; roots 1,−1; supercuspidal GL₂ | Degree-two characters are 1,−1,1, so distinct original roots need not be 3-regular. Supercuspidal Jacquet is zero. Rank-two versus ambient GL_d scopes retained. |
| 1.2 strong Artin predicate/API | Trivial rank-one representation; nontrivial character; reducible sum | Trivial character has zeta pole; nontriviality is needed for entireness, irreducibility for cuspidality. Weak matching gives uniqueness without full bad-factor comparison. |
| 1.3 irregular systems | Equal versus distinct HT weights; reducible system; primes dividing omitted level/torsion | Weight-one conclusion uses irreducible odd irregular system; twist makes weights (0,0). Retained precise good-prime/level boundary of the descent. |
| 1.4 mod-5 modularity and lifts | PSL₂ versus PGL₂; determinant ε̄ versus ε̄⁻¹; unsolvable local lifting problem | Direct PGL₂ use fails before determinant twist/soluble reduction. Finite-lift assertion retains Snowden's A1/A2 and solvability at every specified place. |
| 1.5 reduced generic fibre | Field point versus dual-number thickening; infinitely many points; infinite-image point | Finite set of finite-image points and absolute residual irreducibility remain premises. Finiteness alone is not a general commutative-algebra reducedness criterion. |
| 1.6 functorial lift/API | Identity; determinant; intermediate noncuspidal lift | Identity/central-character tests pass; composition requires the next functor's actual input domain. All-place and weak predicates remain distinct. |
| 1.7 projective image sandwich/API | 𝔽₅; 𝔽₇ rank 3; a=0; p=2,a=3,n=4; trivial image | 5 fails strict bound; GL₂(𝔽₇) identity passes; a=0 excluded; 8>7 allows p≤n. A trivial image fails the lower PSL inclusion. Same field and conjugation retained. |
| 1.8 finite-slope gluing and realization | p=2; arbitrary p-ramification; infinite-slope section; P(0)=0 | Geometric gluing permits p=2/ramification, but requires nonzero constant term and finite slope. Odd-p modularity application has its separate residual/ordinary premises. |
| 1.9 odd Artin over totally real fields | Odd versus even complex conjugation; finite A₅ projective lift; reducible representation | Totally odd irreducible finite-image scope retained; no even or arbitrary-dimensional Artin result asserted. |
| 1.10 symmetric-power predicate/API | n=1,2,3; soluble BC with cuspidal versus CM-split input | Sym⁰=1, Sym¹=π, Sym² rank 3. Cuspidality can fail after BC; retained explicit isobaric extension rather than false closure in a cuspidal domain. |
| 1.11 GL₂ tensor transfer | π′ a twist of π; one dihedral input; noncuspidal BC | Tensor lift exists isobarically; stated cuspidality tests distinguish exceptions. Full WD comparison retains the additional Kim local-converse route. |
| 1.12 SP predicate/API | n=1,2,0,5 | Positive-rank definition gives trivial character/π at 1/2; rank zero is outside the assertion. Low-rank and all-rank exports remain separately named. |
| 1.13 product/symmetric cube | Dihedral and tetrahedral input; residue characteristics 2,3 | Cube exceptions remain; no spurious exclusion at 2 or 3. All-place product and cube scopes preserved. |
| 1.14 exterior/symmetric fourth | Wild 2,3; unramified diagonal two-root input; polyhedral exceptions | Henniart completion remains, with corrected local normalization and all analytic factors. Cuspidality is not promised for the three polyhedral types. |
| 1.15 low-rank SP | n=1,2,3,4,5; CM versus non-CM RA input | Trivial/identity and low-degree transfer base cases agree. Non-CM RA image excludes polyhedral exceptions; no arbitrary weight-one cuspidality assertion. |

### Layer 2

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| 2.1 potential diagonalizability | Rank 1; crystalline versus merely de Rham; different residual models | Rank-one diagonal point passes; de Rham alone does not. Common crystalline extension/component/residual model retained. |
| 2.2 component/ordinary lifting | Equal HT lists on different components; rank-two imported case; nonordinary lift | HT equality alone does not replace component membership. Kept BLGGT 2.3.1 and 2.4.1 as distinct routes and rank-two lower-owner import. |
| 2.3 integral P-ordinary control | Rank 1; zero complex; mod-3 unit/nonunit coordinates; nonordinary slope | e²=e selects only unit-root coordinate. Rescaled U, arithmetic P, integral/derived scope and r̄(−n)/r̄ degree-shift orientation retained. |
| 2.4 integral Hecke representations | Coincident p-places; n=1; p dividing n; omitted local degree inequality | Distinct-place and degree hypotheses remain explicit. Three Taylor–Wiles local types and fixed-determinant p∤n restriction retained. |
| 2.5 weight-zero component lift | p≤n; inadequate image; no seed on selected component | These fail hypotheses; scalar/decomposed-generic/adequacy and seed-component assumptions remain. No arbitrary-component existence follows. |
| 2.6 rank-two CM lifting | p=2; exceptional p=5; incompatible potentially semistable type | Odd-prime/type and exceptional-image clauses retained; no p=2 extension invented. |
| 2.7 CG Conjecture B/API | n=2; Q empty; Eisenstein ideal; residual realization without amplitude | Polynomial is X²−T₁X+N(v)T₂; empty-Q projector is identity. All five further clauses, every-degree boundary vanishing and completed-Hecke lift retained. |
| 2.8 conditional weight-zero lifting | Arbitrary versus CM field; cyclotomic sign; nonspecified local type | Conditional CG route remains separate from unconditional polarized results; retained native HT/sign conversion, determinant, ordinary/unipotent alternatives and local problems. |
| 2.9 Dwork realizations | N=1; selected versus all character eigenspaces; coefficient-prime comparison | N>1 and rank/character constraints retained. Common Frobenius data do not identify arbitrary residual lattices or eigenspaces. |
| 2.10 semistable/log comparison | Rank-two N with N²=0; ramification factor 2; p dividing 2N | 2N remains nonzero and square-zero over ℚ; integral/characteristic-p analogues need hypotheses. Kept p∤2N, roots of unity and finite totally ramified extension. |
| 2.11 coefficient-prime ordinarity | diag(5,25), N=(0 1;0 0), HT={0,3}; rank 1 | Nφ=5φN and t_N=t_H=3 do not imply ordinarity without consecutive HT. Retained maximal N plus consecutive weights at every coefficient embedding. |
| 2.12 subquotients/semisimplification | Nonsplit residual extension; global semisimple representation with ramified local N | Subquotients preserve ordinary flags in stated scope; global ss is not local WD semisimplification. Lattice choice and monodromy interface remain distinct. |
| 2.13 Moret–Bailly | Empty local set; nonspecified Galois action; desired avoid field | Empty local conditions do not erase disjointness/equivariance conditions. Prescribed local Galois extensions retained, not only rational local points. |
| 2.14 simultaneous residual symplectic automorphy | Rank 0,2; prime 2; several residual representations | Positive even rank and odd prime are required. A single common extension/disjointness for the finite family remains part of the conclusion. |
| 2.15 ordinary polarized lifts | Incompatible ordinary weights; unbounded local degree; wrong multiplier | Prescribed local components, weight/degree bound and polarization remain premises; no unconstrained ordinary lift asserted. |
| 2.16 PD polarized lifting | Merely crystalline non-PD local lift; residual system without polarization | Selected potentially diagonalizable components and compatible multiplier remain required. |
| 2.17 residual ordinary automorphy | One versus finite family; prime 2; no ordinary local lift | Finite-family common extension and ordinary/polarized/odd-prime hypotheses retained. |
| 2.18 auxiliary ordinary primes | CM elliptic curve; determinant smaller than full GL₂; excluded finite primes | Non-CM/open-image input and cyclotomic determinant give full residual GL₂ only in the stated range; density-one/progression intersection remains separate. |
| 2.19 Qian auxiliary choices | l′=l; small N; missing roots of unity; intersecting avoid extension | Distinct primes, all N congruence/size conditions, residue fields, cyclotomic containment, full elliptic residual image and disjointness retained. |
| 2.20 Steinberg/ordinary Dwork realization | λ′≠l; N=0; globally ss but locally nonzero N | Auxiliary coefficient-prime semistable comparison and maximal local monodromy remain; global semisimplification does not kill N. |
| 2.21 ordinary from automorphic ordinary | Reducible/not decomposed-generic residual input; chosen refinement | ACC+ irreducibility/decomposed-generic premises retained; no blanket ordinary implication. |
| 2.22 symmetric-power auxiliary primes | m=1; l_i at a size threshold; same two primes | Strict inequalities including (m+1)² and distinct auxiliary primes remain; threshold equality is not admitted. |
| 2.23 twisted modular curve | q=3,5; nonsymplectic level isomorphism; compactified boundary | Genus-zero small cases do not remove Weil-pairing/component data. Twist, open locus and local conditions retained. |
| 2.24 p–r switch | p=r; local incompatibility; loss of disjointness; low symmetric power | Full seventeen-condition switching datum retained. No reverse implication or unconstrained congruence asserted. |
| 2.25 prescribed PD lifts | Residual representation not already automorphic; wrong local component | No residual-automorphy hypothesis added; exact local/PD/polarization/avoid assumptions remain those of the source. |
| 2.26 PD potential automorphy | One/finitely many systems; one extension per system versus common extension | Simultaneous common extension, Galois/disjointness and local conditions retained, not replaced by unrelated extensions. |
| 2.27 symplectic residual ordinary automorphy | Dropping F₁ or avoid field; further prescribed extension F′ | Quantifier over every stated F′ and both avoidance steps retained. |
| 2.28 residual Steinberg automorphy | Irreducible as GSp versus reducible as GL; arbitrary local seed | Do not equate GSp irreducibility with GL irreducibility. Additional FKP 9.1 hypotheses are kept separately from the residual construction. |
| 2.29 elliptic local-type modularity | p=3,5; wrong Weil-pairing dual; determinant twist | Local Δ ratios, H-duality, soluble CM extension and prescribed types remain. No determinant/duality sign dropped. |
| 2.30 exceptional curves/certificates | Trivial family; N=1; integer box N≥2; unordered isomorphism classes | Arithmetic certificate is still an explicit conditional datum. Quantitative thin-set bound has its N≥2 scope; relative height density uses the actual family, not all isomorphism classes. Supplier identities corrected. |
| 2.31 odd symmetric-power modularity | Odd/even degree; missing CG Conjecture B | Conjectural input and both CG applications retained; no unconditional arbitrary-field theorem substituted. |
| 2.32 change of weight/level | Wrong multiplier; new component not containing prescribed lift | Exact polarized local lift/component conditions retained; no arbitrary weight-change assertion. |
| 2.33 totally real potential automorphy | Non-PD local representation; CM versus totally real base | Totally real/odd essentially self-dual and PD hypotheses remain. |
| 2.34 residual potential automorphy with lifts | No prescribed local lift; omitted 4.5.1 hypothesis | All inherited 4.5.1 assumptions remain explicit by reference to that target; conclusion is not unconditional residual automorphy. |
| 2.35 compatible-system automorphy | Reducible or nonregular family; a single unrelated realization | Regular irreducible compatible-system data retained; finite-prime compatibility and common realization cannot be discarded. |
| 2.36 constituents potentially automorphic | Regular but not extremely regular; density-one versus every prime | Extreme regularity and purity/polarization retain their exact role; density-one conclusion is not all-prime. |
| 2.37 arbitrary-field elliptic modularity | CM/non-CM cases; absent Conjecture B | Conditional status remains explicit; no claimed unconditional arbitrary-number-field modularity. |
| 2.38 weak symmetric-power automorphy | m=1 versus m≥2; missing p/r switch | Stated m≥2 and switching hypotheses remain; weak matching is not upgraded to all-place matching. |
| 2.39 non-CM E/ℚ symmetric powers | Finite versus infinite requested degree set; CM E; avoid field | Common extension for the finite requested set, every coefficient prime and avoidance retained. |
| 2.40 analytic continuation/purity | Rank 1 zeta; two real signs with same HT; ramified factors | Meromorphic, not general entire, conclusion retained. Strict purity, real odd traces and completed functional-equation inputs remain. |
| 2.41 embedding in a system | PD versus merely de Rham; unspecified polarization | Compatible-system construction keeps its actual local/polarized/irreducible hypotheses. |
| 2.42 simultaneous pure-system automorphy | Reducible regular system; non-extreme weights; several systems; totally real CM convention | Decompose after coefficient extension; one common disjoint extension suffices for every constituent. No irreducibility/extreme regularity inserted. Clarified sentence while preserving bold one-extension requirement. |
| 2.43 density-one irreducibility | Exceptional coefficient prime; generic irreducibility alone | Density-one set remains density one, not all primes; no unsupported general irreducibility conclusion. |
| 2.44 auxiliary symmetric-power seed | l′=l; only one degree; two distinct avoidance fields | Seed keeps the needed finite set of degrees, auxiliary prime separation and both avoidance conditions. |
| 2.45 tensor products | Two GL₂ factors with subset sums colliding; one factor | Distinct subset sums are essential to regularity; tensor dimension is the product, not the sum. |
| 2.46 decomposition into systems | Coincident constituent weights; merely regular versus extremely regular | Extreme regularity/purity retain their source scope; no arbitrary semisimple realization promoted into compatible constituents. |
| 2.47 transport from l′ to l | Same unramified polynomials but different local N; global ss | Compatible Frobenius data transport the stated automorphy; local monodromy needs its separate comparison. |
| 2.48 GSp lift in a pure system | One versus two distinct maximal-N places; exceptional l | Strict-purity and density-one irreducibility route keeps both places; no all-prime irreducibility promised. |
| 2.49 strict purity/functional equation | Pure regular reducible system; ramified place; real sign | Full strict-purity/completed-factor assertions retain constituent and local-comparison inputs, not Hodge lists alone. |
| 2.50 Qian residual ordinary automorphy | l=2; nonsemisimple residual input; absent avoidance | Semisimple residual theorem allows l=2 in its stated scope; no odd-prime restriction imported from other routes. Disjointness/ordinary conclusions retained. |
| 2.51 Qian ordinary l-adic automorphy | l=n; l<n; scalar, adequate or enormous condition omitted | Strict l>n from ACC+ 6.1.2(4), decomposed-generic/enormous/scalar and ordinary hypotheses retained. Does not inherit §2.50's unrestricted l scope. |
| 2.52 CN modularity | Infinite X₀(15)(F); absent exceptional certificate; single curve versus density family | Finite-point hypothesis and conditional exceptional branch remain; density result uses its own arithmetic family. No unsupported unconditional certificate or GT.6 import added. |

### Layer 3

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| 3.1 oscillator/Howe duality | Zero-dimensional space; theta lift zero; residue characteristic 2 versus field characteristic 2; odd orthogonal dimension | Zero lift is allowed; small lift, not every big lift, is irreducible. Field characteristic 2 remains excluded while dyadic fields are permitted. Genuineness/splitting data and separate real/quaternionic scopes retained. Heisenberg coordinate change z=t+xy/2 and oscillator scaling remain comparisons to existing objects. |
| 3.2 weighted stabilization/LIR | Torus M=G; proper Levi; identity Weyl element; odd/even repeated blocks; singular auxiliary intertwiner | Torus weight is 1; proper-Levi subtraction/Weyl factors are essential. Identity operator is 1. Aubert signs and regular-composite-before-specialization are retained; tempered/smaller-rank Hypothesis 1.10.4 and TWFL are not inferred. Clarified even-orthogonal wording without extending inner-form/archimedean scope. |
| 3.3 twisted square factors | m=1,2; quadratic character without square root; orders (−1,0),(−2,1) | Nonpositive boundary orders with sum −1 give precisely one simple pole. (−2,1) violates nonvanishing. Meromorphic/nonvanishing is not blanket holomorphy. |
| 3.4 self-dual type | Rank 1; odd rank; even orthogonal type with nontrivial centre | Rank-one exterior factor is 1; symplectic type needs even rank/trivial central character. Orthogonal source/discriminant is not silently made split. |
| 3.5 GSp₄ LLC | Singleton versus C₂ fibre; nongeneric supercuspidal; rank-1/2 twists | Fibre, generic member, similitude and twist comparisons retain exact scope; Shahidi factors alone do not characterize nongeneric supercuspidals without Plancherel data. |
| 3.6 determinant sign kernel/API | Empty set; singleton dimension 3; dimensions (1,1),(1,2); all even | Empty group already trivial; singleton odd kernel zero; (1,1) requires s₀=s₁; (1,2) only s₀=0. Clarified singleton in prose; no quotient by the dual centre is included in this light definition. |
| 3.7 Galois packet/monodromy | Unramified N=0; rank-one N; residue q=9 versus coefficient p=5 | q^(3/2)=27, not 5^(3/2). RankN and half-twist use residue norm and chosen square root; coefficient-prime independence is only asserted in stated unramified/Iwahori cases. |
| 3.8 global Arthur parameters | Empty list at positive rank; repeated pair; odd/even b; central sign quotient | Dimension, distinctness, parity and total central character reject wrong data. Determinant sign constraint precedes central quotient; generic means every b=1. |
| 3.9 GSp₄ spectral types | Yoshida sum versus cuspidal GL₄ transfer; Saito–Kurokawa epsilon −1; character type | General type requires cuspidal symplectic transfer. All six types/component groups and the unique possible nontrivial epsilon case remain. |
| 3.10 weight-(2,2) conjecture | CAP/endoscopic form; n=1 RM field; missing attached variety | Stable/general-type restriction retained; no variety existence proved. Dimension 2n and eigenspace comparison remain the frontier specification. |
| 3.11 regular-weight Serre implication | Reducible residual surface; p=2; sufficiently-large-p variant | Full stated Serre premise and trace-classification inputs remain conjectural; classification handles reductions rather than assuming all surfaces have irreducible reduction. Weaker premise remains a separately cited possibility. |
| 3.12 Mok classification | N=1; repeated packet member; nongeneric Arthur SL₂ | Rank-one class-field specialization agrees. Packet multisets retain repeats; generic multiplicity-one is not generalized to all ψ. |
| 3.13 extended parameters/API | Trivial component group; SL₂ packet size 2/4; even SO outer orbit | Enhancement is needed beyond the parameter. Generic character criterion is tempered/Whittaker normalized; even-SO outer convention retained. |
| 3.14 twisted exterior square | Rank 2; quadratic quotient twists; noncuspidal base change | Pole versus finite nonzero limit remains distinct. At-most-one quotient pole requires cuspidal cyclic BC; no exclusion of all other boundary poles asserted. |
| 3.15 local Arthur packets | Trivial Arthur SL₂; real versus p-adic field; nontrivial SL₂ | Tempered packets are sets with injective pairing; p-adic bijectivity is not transferred to a single real form or nontempered packet. Announced classification premises retained. |
| 3.16 inner unitary classification | One real inner form versus union; pure versus general inner twist; nongeneric parameter | Real bijectivity needs the specified union. Nongeneric/general-inner scope retains Chapter 5 classification and LIR at every place; no unconditional extension. |
| 3.17 Arthur multiplicity formula | Odd/even standard dimension; all blocks even; unbounded localization | Multiplicity 2 only in the stated even-SO/all-even case; otherwise 1. Unbounded localizations use Arthur's extension, not a falsely bounded local theorem. |
| 3.18 odd-orthogonal Vogan packets | n=0; split/nonsplit quadratic forms; wrong Hasse sign; repeated block | Form selection by η(z_φ)=ε(V) retained. Square-integrability needs multiplicity-free good parity; arbitrary inner-form scope keeps its classification premise. |
| 3.19 Xu local similitude packets | n=1; trivial boundary α; nontrivial self-twist; one real form | Reduced component groups and twist quotient retained. Pairing bijective only p-adically; restored explicit trivial lifted global component group in the globalization target, alongside local component preservation and strong multiplicity one at the chosen place. Stable/endoscopic normalization retained. |
| 3.20 Adams–Johnson induction | Root pairing 0 versus −1; same differential/different character; noncompact Cartan | Weak good range includes 0, excludes −1. Actual unitary character and full AJ parameter retained. Noncompact Cartan uses AJ §10 reduction/induction; no compact-Cartan theorem is applied directly. |
| 3.21 AJ/Arthur comparison | Formal regular-integral consequences without full AJ datum; non-quasi-split nongeneric form | Full AJ87 parameter remains required; consequences alone do not define the input. Quasi-split AMR scope and separate KMSW premises retained. |
| 3.22 highest-weight packet criterion | k=0,1,g; touching intervals; positive-lowest versus negative-highest convention | Exact dimension/infinitesimal-character and interval/theta alternatives retained. Contragredient transport is required for holomorphic convention; membership does not assert unrestricted packet-character injectivity. |
| 3.23 nonsplit global formula | Generic versus nongeneric Φ; trivial versus nontrivial diagonal character | Near-equivalence decomposition ranges over all elliptic parameters; formula m=0/1 is only in generic scope. Nonsplit classification hypothesis retained. |
| 3.24 almost-tempered induction | Exponent ±1/2; noncanonical subparameter; n,r at boundary | Open exponent interval/canonical bad-good decomposition and strict 2n<r−1 remain. Lemma 5.5 quantifies over every irreducible subrepresentation of every stated packet member. |
| 3.25 generic standard modules | Nongeneric parameter; pure inner form; full induction versus quotient only | Genericity and classification/TWFL premises retained. Conclusion concerns irreducibility of the full standard module, not merely existence of its quotient. |
| 3.26 GSp₄ classification | General type versus endoscopy; arbitrary number field; specified local members | Totally real fixed-centre scope retained. Trivial S_ψ gives multiplicity one for every permitted restricted product, not an unrestricted number-field theorem. |
| 3.27 Xu global formula | n=1; nontrivial Arthur SL₂; nontrivial Y-twist; locally nontempered localization | Generic global scope, localized pairings and twist-indexed sums retained. Global genericity does not imply local temperedness or every member Whittaker generic. |
| 3.28 reducibility outside general type | l_v=2; parity mismatch; converse for general type | Singular lower weight allowed with exact infinitesimal character/parity; non-general implies reducible. General-type irreducibility stays expected, not a converse theorem. |
| 3.29 archimedean limit packet | p=1; two K-type/chamber conventions; positive versus negative multiplier | Full GSp₄ has two packet members, not four connected-group pieces. R_p⊕R_p and C₂ centralizer retained. Integral lattice/parity witness distinguishes boundary normalization. |
| 3.30 symplectic pairing descent | Essential self-duality without actual twist; reducible CM restriction; absolute irreducible reduction | Twist, CM irreducibility, unitary descent and coefficient/polarization comparison maps remain owned targets; no automatic pairing theorem from self-duality alone. |
| 3.31 holomorphic-limit global packets | Yoshida/SK versus general; reducible residual ideal; generic infinity | Only three types survive the holomorphic limit. Residual irreducibility forces general type; then h/g replacement preserves automorphy/multiplicity one. |
| 3.32 infinitesimal transfer | Singular a,b; one of all coherent degrees; temperate versus general discrete π | All three exact shifted character formulas retained. Limit-discrete-series conclusion keeps tempered hypothesis; no regularity added to erase singular weights. |

### Layer 4

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| 4.1 enormous image/Selmer | n=1; scalar group at n>1; p=2; full End versus trace-zero ad | Rank-one spectral projector test is meaningful; scalar image lacks n distinct roots for n>1. Full adjoint, cX=−X* and exact local conditions retained. Characteristic-zero enormous does not assert residual cohomology vanishing. |
| 4.2 multiple residual constituents | One/repeated constituents; ℓ=2,3; ℓ dividing n; primitive hypothesis absent | Distinct polarized constituents, cyclotomic restrictions, ordinary seed and Steinberg data remain. No generic reducible automorphy lifting inferred. |
| 4.3 eigenvariety/trianguline/Jacquet API | n=1,2,3; roots 1,−1; GL₂ diag(9,1); p=2 torsion; torus; infinite-dimensional identity; nonclosed quotient; exceptional family locus | Character map gives 1/pair/quadratic monomials. δ_B^(−1/2)=3 versus spectrum twist δ_B⁻¹=9. Rank-one flag is unique; ratio 1 excluded in higher rank. Retained finite-extension group field, essentially admissible/compactness hypotheses, Hausdorff quotients, all-p-level completion, KPX density/exceptional locus and Selmer tangent premises. |
| 4.4 level raising/odd-rank types | n=1; n=3 odd-rank branch; residue characteristic 2; omitted residual exclusion | First theorem permits n=1; separate odd-rank construction requires n≥3 and odd residue cardinalities. Residual, not characteristic-zero equality; both exclusions after BC and all three local types retained. |
| 4.5 eigencurve propagation | n=1; critical refinement; same connected but different irreducible components | n≥2 and same irreducible component required. Distinct noncritical/n-regular versus ordinary routes retained; no propagation from connectedness alone. |
| 4.6 dyadic boundary | p=2; \|w\|=\|8\|; χ(−1)=−1; sheet i=0 | Strict annulus on W₀⁺ and i≥1 retained. Endpoints/other weight component are not included; slopes i v₂(w) keep sign. |
| 4.7 level-one propagation | n=2; only one seed prime; companion slope | Positive symmetric power and noncritical/ordinary machinery give stated one-to-all propagation; relation i+i′=(k−1)/v₂(w) retained. |
| 4.8 theta-series Steinberg raising | n=2,3; p=577; q=p; prescribed X₀ | n≥3; 577≡1 mod288 for n=3; q=p excluded. Ordinary polarized HT and residual matching remain, not characteristic-zero identification with CM sum. |
| 4.9 one level-one seed | n=2,3; coefficient embedding varied | Theorem's n≥3 scope and every-ι conclusion retained; no claim all ranks use the same constructed form. |
| 4.10 n-regular congruences | Threshold equality for p; supercuspidal local component; roots colliding after powering | Strict p bound and non-supercuspidal input/output retained; same weight/residual representation and n-regular ramified refinements remain distinct conditions. |
| 4.11 NT II functoriality lifting | n=1; p=2; p≤n; projective field size at 5 | Small p allowed when p^a>max(5,2n−1). Nonordinary weight-two and local Steinberg-status agreement remain; no residual Sym irreducibility or p>n inserted. |
| 4.12 level-one functoriality | n=2; CM versus RAC level-one input | Rank 2 identity specialization agrees; theorem keeps n≥2, level one and RAC scope. |
| 4.13 CM/weight-one symmetric powers | Degree 1; CM quadratic induction; polyhedral finite image | Isobaric output may be noncuspidal. Wang's corrected character-table +6 and exact tensor/automorphic-induction decompositions remain; no blanket cuspidality. |
| 4.14 analytic equidistribution | Trivial representation; compact group 1; unbounded norm multiplicities; q=1; arbitrary reordering | Trivial L has simple pole and main coefficient 1. N_i≥2, compactness, analytic continuation and bounded multiplicities are retained; arbitrary reordering is not equidistribution in norm order. |
| 4.15 one-prime criterion | n=1,2; CM/self-twist input; weak local matching | Positive ranks agree with Sym⁰/Sym¹; non-CM RAESDC and all-place formulation retained. One-prime automorphy is not itself a new bad-factor theorem. |
| 4.16 density-one image | CM π; exceptional small prime; Sym² noncuspidal | Cuspidal Sym² excludes CM; density-one set not every prime. Coefficient-embedding and conjugate SL₂ image quantifiers retained. |
| 4.17 completed L/API | n=1,2; missing conductor; omitted bad prime | Nonvanishing conductor factor preserves entireness but changes FE; all WD factors/archimedean gamma factors and shift s−n/2 retained. |
| 4.18 parallel weight/API | Zero function; weights (0,0)/(2,0); (2,0)/(3,1); empty index | Computed weights 2, unequal 2/4, equal 4/4. Empty-index parallelity is vacuous but no classical-weight value exists without an index. Scalar twists preserve differences; dominant automorphic weights only give k≥2 after attachment. |
| 4.19 purity from infinitely many powers | One/finitely many powers; n=1; missing prime-to-v₀ level | Infinite unbounded powers and good-place condition retained. Rank-two HT={0,m} and all complex embeddings are necessary to the stated root modulus conclusion. |
| 4.20 nonsupercuspidal modular forms | n=2,3; supercuspidal finite place; semistable E | Non-CM/Jacquet hypothesis retained. Semistable corollary's entireness does not extend by this route to arbitrary elliptic curves without the later theorem. |
| 4.21 cyclotomic-det systems | m=1; n=1; wrong determinant sign; strongly irreducible condition dropped | det=ε^(−m), all-good-place matching and source automorphy definition retained. m=1 uses its separate ACC+ route; bad places are not silently matched. |
| 4.22 symmetric-power reductions | r=0,p; p=2; finite/infinite places; missing one of eight local conditions | Strict 0<r<p,p≥5 and all eight NT conditions retained. CT's incomplete mixed-parity proof is not used alone: Thorne 2024 supplies the complete finite-place and infinity route. |
| 4.23 tensor functoriality lifting | r=1; p=2; 2r roots not distinct; ordinary status mismatch | Perfect-subgroup/tensor irreducibility conditions retained; p=2 requires both potentially crystalline. Size bound alone does not replace perfect-subgroup eigenvalue condition. |
| 4.24 rank-two weight-zero analysis | m=0,1; reducible versus strongly irreducible | m=0 is Dedekind zeta with pole1; holomorphic/nonzero half-plane is only for m>0 strongly irreducible input. FE/meromorphic scope kept separately. |
| 4.25 Serre criterion | Trivial compact group; trivial representation; noncompact group; pole at1 | Trivial representation excluded from nonvanishing hypothesis; compact probability Haar and prime indexing remain essential. A pole for a nontrivial character fails the criterion. |
| 4.26 Bianchi/cohomology comparison | k=2; unequal coefficient weights; nonprincipal prime; h_F>1 | Degree-one parabolic/cuspidal comparison remains over all ideal classes. Single component only gives principal-prime operators. Normalized coefficient/eigenvalue equality retained both ways. |
| 4.27 Bianchi form/API | Unit ideal; nonintegral ideal; k=2; h_F>1 | c(O_F)=1; nonintegral-ideal coefficient zero. Fourier norm/central twist, all-component comparison and unramified-prime scope retained. |
| 4.28 conditional elliptic Sato–Tate | CM curve; arbitrary field without CG B | Non-CM and Conjecture B remain explicit; no general unconditional arbitrary-field conclusion. |
| 4.29 all non-CM modular forms | n=1,2; CM form; weight one | Sym¹=π; entireness corollary uses n≥2. RA/non-CM hypotheses retained; weight-one cases belong to their separate isobaric theorem. |
| 4.30 all SP over totally real fields | n=1,2; non-RA input | Stated n≥2; rank-one SP is separately trivial. Totally real/RA/non-CM input remains; no unrestricted GL₂ frontier solved. |
| 4.31 Sym⁶/Sym⁸ | Nontrivial intersection with ℚ(ζ₅)/ℚ(ζ₇); quadratic CM induction | Exact cyclotomic disjointness and noninduced hypotheses retained. Level-raising target supplies the local construction rather than a circular theorem citation. |
| 4.32 semistable analytic continuation | n=1,2; bad multiplicative prime; nonsemistable E | Theorem stated n≥2 and includes completed bad factors. Semistability/non-CM implication retained; no deletion of bad factors. |
| 4.33 general CM rank-two systems | n=1; irreducible but not strongly irreducible; m=0 | m≥1 scope retained. Strongly irreducible branch is automorphic after extension; other irreducible branch gives sums of dimension≤2 systems, not falsely cuspidal high-rank output. |
| 4.34 elliptic Sato–Tate | a_p=0; CM curve; angle endpoints | θ=π/2 at trace0; density (2/π)sin²θ integrates to1. Non-CM, good-prime and positive-imaginary-root convention retained. |
| 4.35 Hilbert functoriality | n=2; mixed parity; infinite place | Identity case and all-place matching agree. Essential square-integrability includes mixed parity; complete Thorne 2024 route retained. |
| 4.36 CM conjugate-self-dual functoriality | n=2; quadratic automorphic induction | Identity case agrees; induced input is excluded for cuspidal higher symmetric powers. Every-place comparison retained. |
| 4.37 low powers to eight | r=1,4,5,6,7,8; failed cyclotomic disjointness | Rank r+1 and case-specific intersections retained. CT finite-place statement remains distinct from completed NT/Thorne all-place result. |
| 4.38 parallel-weight Ramanujan | Weight 2; nonparallel scalar twist; ramified place | Algebraic twist gives q^((k−1)/2) Tate-normalized roots. Untwisted purity sum w, not weight difference, fixes unitary scale; all finite places are essentially tempered. |
| 4.39 Sato–Tate group/API | a=1,2; infinite-order determinant character; ramified/non-tempered place | a=1 gives SU₂; finite a gives determinant roots of unity, infinite order U₂. Local class assignment retains unramified essentially tempered hypothesis and uniqueness. |
| 4.40 Bianchi coefficient bound | k=2; unit normalization removed; ramified ideal | Bound 2√N(𝔭) at k=2; arbitrary rescaling breaks it. Normalization and unramified prime remain explicit. |
| 4.41 mass equidistribution | Fixed weight; h_F>1; non-level-one forms | Growing weight, class number one and level one retained; noncompact quotient uses finite normalized hyperbolic volume, not compactness. |
| 4.42 parallel-weight Sato–Tate | CM input; finite/infinite determinant image; ramified prime | Non-CM/parallelity and exclusion S_π retained; Haar measure is on the correct ST group, not always SU₂. |
| 4.43 cohomological eigenvalue bound | k=2; unit ideal level; nonprincipal prime; several components | Bound transfers on parabolic H¹ with exact coefficient system. Single-component assertion remains principal-prime only; all-component extension stated separately. |

### Layer 5

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| 5.1 classical generic transfer | Rank 1; even SO at n=1; constituent determinant nontrivial but total trivial | Even SO requires n≥2. Orthogonal-type constituents need only total trivial central character; distinctness/type/poles retained. Transfer remains infinity/almost-everywhere, not blanket all-place or level-one. |
| 5.2 general functoriality/API | G′=1 with trivial/nontrivial r; identity; determinant; projection-breaking map | Trivial source can have nontrivial Weil L-map and yield nontrivial Hecke character. Projection compatibility rejects (z,w)↦(z,1). Conjectural weak/strong scopes remain separate. |
| 5.3 local LLC/API | GL₁; GL₂ principal series; SL₂ packet sizes2/4; real field | GL₁ is class field theory; GL₂ sums two characters; SL₂ is not injective. Weil-group definition distinguishes archimedean and nonarchimedean cases; existing proved char-zero export not broadened. |
| 5.4 global descent | One versus repeated symplectic block; other classical group | Distinct symplectic cusp blocks give nonzero generic descent. Odd-orthogonal irreducibility uses Jiang–Soudry; other descents retain separate uniqueness/irreducibility scope. |
| 5.5 metaplectic local/global descent | One/two distinct/repeated blocks; orthogonal block; n=1 odd Weil; real auxiliary place | Distinct symplectic blocks, ψ inverse convention and square-integrability retained. Globalization requires the specified nonarchimedean auxiliary supercuspidal and excludes odd Weil at rank1. Real local theorem does not replace global hypotheses. |
| 5.6 reciprocity/API | Trivial rank1; nontrivial character; quadratic induction; reducible sum | Trivial rank1 yields zeta pole; nontrivial irreducible Artin entireness uses strong all-place cuspidal lift. Reducible sum is isobaric, not cuspidal. Frontier status retained. |
| 5.7 Bun_G/Satake/Hecke API | GL₁ degree0/1; zero complex; two/three legs; PGL₂ ℙ¹; infinite Newton support; modℓ coefficient reduction | All strata retained; rank-one modification changes degree. Zero preserved; fusion coherent with parity; ℙ¹ fibre Λ⊕Λ(−1) pins Weil twist. Compactness needs finite Newton support and compact restrictions. Flat/ULA/integral prime2 and both-adjoint hypotheses retained. |
| 5.8 cocycle stack/support API | Rank1 unramified; GL₂ N=0/rank1; noncompact level union; B=k[[x,y]]/(xy), M=(x); SL₂/char2 Sym²; PGL_ℓ; free groups0/1; cyclic wild p-quotient | Stabilizers/derived relations/monodromy survive; qc support and nilpotent support differ. Odd positive self-Ext vanishing alone does not imply perfection. Good filtration is not semisimplicity. Prime restriction and p⁻¹ averaging retained; imported SR scheme is distinct from owned LCI/quotient/support constructions. |
| 5.9 spectral action/adjunction API | Tensor unit; free groups0/1/n; generator exchange; objectwise versus uniform wild level; bad integral primes | Unit acts identically; diagonal conjugation/coalescence/relations retained. Each object has its own finite level; no uniform level or global qc support imposed. Adjunction alone is not categorical LLC. Excursion algebra remains imported. |
| 5.10 categorical LLC/API | GL₁/torus; GL₂ equal semisimple Weil part but N=0/rank1; global O/W_ψ | Canonical stable-categorical conjecture retains support, coefficient and Ind-completion conditions. Torus ℤ_ℓ equivalence uses Zou and needs no √q. Global unit need not have qc support; parameter assignment alone does not prove equivalence. |
| 5.11 powers imply Ramanujan | n=1 only; unbounded n; nonunitary isobaric lift; residue degree f | Unbounded positive powers and dual/unitary constituent bounds force \|α\|=1. Under BC, cancel f in \|α\|^(fn)<q^(f/2); raw absolute values are not invariant. Removed only a repeated statement of these same hypotheses. |

### Lean declarations and convention examples

There is no shared `variable` or `include` block. Each theorem's binders carry its complete assumptions. Empty index types are deliberately allowed for numerical weight functions and finite sign kernels; the automorphic attachment has its own nonempty embedding datum. The projective sandwich explicitly has a group, finite field, field embedding and actual GL₂ homomorphism, rather than unrelated arbitrary data.

| Declaration group | Boundary computation and result |
| --- | --- |
| `singularWeightHodgeList`, length/nodup/r-two | k is ℕ, r is ℤ; k+1 cannot vanish. At r=2 both pairs coincide, but list length remains four. Three proved examples exercise regular and singular cases. |
| `ProjectiveImageSandwich`, bound/mono/conjugation | Prime/positive exponent/positive rank, actual field cardinality and one conjugation are part of the predicate. Smaller rank requires 1≤m≤n. Conjugation changes the witness, not either embedded finite subgroup. 𝔽₇ identity passes, 𝔽₅ fails, a=0 fails, and p=2 is numerically allowed at q=8,n=4. The last is a bound witness, not a fabricated representation. |
| `orthogonalSignKernel`, membership/even/singleton-odd | Kernel is an actual additive subgroup. Empty and zero dimensions give top; singleton odd gives bottom; two odd signs agree; mixed (1,2) leaves the even sign free. All checks compute in ZMod 2. |
| `IsParallelWeight`, `parallelWeight`, twist/independence | Arbitrary index type, integer weights, no dominance assumption in numerical definitions. Empty-index predicate is vacuous; evaluation takes an actual index. Both-coordinate scalar twists cancel. Three proved examples distinguish zero, unequal and equal nonconstant weight functions. |
| Existing polynomial/matrix interfaces | (X−1).reverse=1−X differs from characteristic polynomial at 1/2; dimension-zero and zero-matrix reverse characteristic polynomials are 1. No replacement polynomial construction is planned. |
| Real sign and norm conventions | Sym² conjugation matrix has trace1/determinant−1; angular character at −1 is −1 whereas z/conj(z)=1; q=9 half-twist gives27 rather than the coefficient-prime value; symmetric-square weights sum to determinant exponent−3. |
| Dwork/ordinary witnesses | Rational nonzero square-zero N survives ramification scaling2. diag(5,25) verifies Nφ=5φN but nonconsecutive HT do not force ordinary. Mod3 unit-root projector is idempotent and kills nonunit coordinate. |
| Rank/chamber/range/pole/Jacquet witnesses | Symmetric degree n−1 at n=1/3; roots1,−1 collide in degree2. Boundary lattice parity distinguished; AJ range includes0/excludes−1. Nonpositive orders summing−1 force (−1,0)/(0,−1). DL block signs distinguish2/5; GL₂ modulus gives3 versus9. |
| Added §3.1 Heisenberg example | Proves the full rational coordinate-change polynomial identity and computes the two coordinate vectors: half-cocycle plus coordinate correction gives1; doubling gives3/2 and fails the polarized law. Mirrors the existing README Check. |
| Added §3.1 oscillator example | m=0/1 gives (2m+1)/2=1/2,3/2; unhalved odd eigenvalue3 is different. Mirrors the existing even/odd README Check without redefining TauCeti's oscillator. |

The original 28 proved examples are retained, with these two additional numerical examples (30 total). Five definitions and eleven theorem targets remain. No heavy carrier or auxiliary lemma was introduced.

### Supplier/convention boundary checks

| Contract group | Instances and disposition |
| --- | --- |
| C-GALOIS and C-SYSTEM, all realization/system supplier rows | Rank1/rank2, singular weights, globally semisimple versus locally nonzero N, ramified omitted factors: retain geometric Frobenius/HT/duality and source-specific local scope. Purely numerical Hodge lists do not supply real epsilon signs. |
| C-AUTOMORPHIC and induction/transfer rows | Identity/determinant, reducible isobaric sum and quadratic CM induction: preserve cuspidal input domains and exceptional decompositions. Strong matching and weak transfer remain distinct. |
| C-ARTIN and analytic rows | Trivial character has zeta pole; irreducible nontrivial Artin holomorphy remains conjectural beyond proved cases. Arithmetic/geometric Frobenius inversion explicitly required. Wiener–Ikehara imported from its actual owner. |
| C-LOCAL-DEFORMATION and deformation rows | Field/DVR, nilpotent thickening, p=2 versus odd-prime theorems, equal HT but distinct components: no inversion of p before integral conclusions and no arbitrary-component implication. |
| C-MODULI and elliptic/modular-curve rows | Twisted level structure versus geometric isomorphism, Weil pairing sign, N=1 versus allowed height boxes: preserve determinant, component, local and family data. |
| C-ARTHUR, trace, weighted-FL and theta/descent rows | Torus/proper Levi, generic/nongeneric, real/inner forms: ordinary matching alone gives no weighted stabilization; every classification keeps its actual external premises. Big theta may vanish or be nonsemisimple. |
| C-COHERENT-GEOMETRY and arithmetic locally symmetric rows | Degree0 versus higher degrees; zero complex; torsion coefficients; noncompact boundary: all-degree integral cohomology, localized boundary and operator normalization remain. |
| C-EQUIDISTRIBUTION and compact-group rows | Trivial character, noncompact group, q=1, arbitrary ordering: finite residue norms≥2, compact Haar probability and norm/prime ordering remain; scalar pole is separated from nontrivial-character nonvanishing. |
| C-CATEGORICAL and geometric/support rows | Zero object, infinite Newton support, integral bad primes, monodromy N=0/rank1, one versus per-object wild level: keep stable/derived categories, integral restrictions, stabilizers, support, all strata and canonical adjunction. |
| Ownership comparisons and lower-layer contracts | Existing library declarations are cited, not implemented anew. All named extra comparisons remain explicit owned targets. No ownership transfer or outside-order dependency was hidden by abbreviation. |

## Maintainer notes retained

These were nonblocking notes in the accepted round-3 review, and compaction does not resolve them by changing ownership:

- Decide whether unconsumed §§5.7–5.10 should remain here or move to GeometricSatakeAndFusion/BunGAndNewtonStrata/ExcursionOperatorsAndSpectralAction. The current README explicitly owns the extra Bun_G, LCI/support and spectral-action comparisons; imports are restricted to the lower foundations and SR.6.1–SR.6.3.
- CrystallineLocalGlobalCompatibilityCM must import §§2.3–2.4 and 2.6, rather than re-plan these integral Hecke/lifting interfaces.
- §2.52's exceptional branch remains conditional on `CNExceptionalCurveData` from §2.30, including GT.6 (EllipticCurveModularityPartII, upstream PR #1036) where needed. It is not silently a completed lower-tier input.

## Validation and stopping state

- `lean-check research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0 at the pinned shared build after checking available memory (78 GB). Exactly eleven warnings, all `declaration uses sorry` on the eleven theorem targets; no errors, no other warnings. All thirty examples are proved. Final file: 367 lines.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: exit 0, zero errors and zero warnings. The packet is outside this fix's edit scope and unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: exit 0, four files and zero problems.
- Before/after inventory assertions, internal anchor/reference resolution, source-destination sets per target, section-label destinations, stale split-name/PL-id search, and complete ordered 157-row pass-table coverage: pass.
- `git diff --check`: pass. Only the four issue-authorized deliverable paths are changed.

All requested fixes are complete and ready for this job's single pull request. No second issue was claimed. There is no mathematical residue from the compaction job requiring a checkpoint; maintainer ownership decisions above remain informational.
