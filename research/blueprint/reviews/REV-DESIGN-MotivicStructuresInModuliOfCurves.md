# Independent review: motivic structures in curve moduli

Job `REV-DESIGN-MotivicStructuresInModuliOfCurves`, issue #3578. Reviewer: Codex, session `codex-5naFJa`, 19 October 2026. The design was written by the separate session `codex-o0QXo2` (DESIGN job #3453).

**Accepted after corrections** as a complete target-level planning pass. Every node is verified or corrected as a plan; all thirteen layers remain planned, none closed. The fifteen explicit gaps remain open. This is neither a proof-closure certificate nor a claim of implementation.

## Counts

- 103 nodes: 76 verified, 27 corrected, zero added, zero unverifiable. A corrected verdict includes API additions and test-kind normalization; the register below states the mathematical check for each node.
- Ten definitions, seven constructions and 86 theorem targets. The seventeen definitions/constructions now have 84 API contracts and 52 tests, with at least three tests each. Twenty API contracts and one discriminating test were added; all 51 inherited test kinds were normalized to PROTOCOL §12.
- Seven pinned baseline declarations confirmed; none removed or replaced. Fifty planets across thirteen layers, all within the six-per-layer and 60-character limits.
- All 134 extraction items retain dispositions (86 CLP, 48 BFP). Item CLP/27 now distinguishes proved Lefschetz consequences from the stronger full-unimodality assertion needing another argument.
- Four supplier requests and four ownership proposals retained after reading their actual suppliers. Fifteen gaps retained and narrowed where arithmetic was independently reproduced.
- All twelve inherited source findings confirmed individually. Four findings added: two BFP general-statement corrections and two Gorsky preprint typos already identified by Kannan. Final total: sixteen confirmed.

## Corrections and their effect

1. **Orthogonal marking range and zero marks.** CLP Corollary5.11, p.19, assumes n≥1 for generation by the marked tautological bundles. For n=0 that list is empty but A*(BSO10) has nonconstant classes. The corrected TC.6 route proves marked cases first, then uses the proper forgetful map from one mark. Projection formula gives pi_*(psi1 pi*alpha)=12alpha in genus7, recovering both rational Chow generation and the product-natural CKgP argument at n=0. The kappa-class prerequisite and an acceptance check were added. Mukai and quadratic-descent gates are still required.
2. **Grassmann convention.** R09.1 classifies locally free quotients. The rank-(7−n) subbundle of Q_n of rank16−n is therefore represented by the supplier’s rank-nine quotient Grassmannian. Its kernel is E_n. The universal quotient, base-change and smooth relative dimension9(7−n) contracts are explicit. A fourth test at n=4 distinguishes a rank-three quotient, whose kernel would have rank9, from the required rank-three kernel.
3. **Lefschetz statement.** The opposite-degree map is multiplication by a^(d−k); multiplication by a alone raises degree by2. The statement/title now give opposite-degree injectivity and growth below the middle. The source’s full paritywise-unimodality assertion also needs decrease above the middle, which the stated injection argument does not supply; it remains a precise obligation in G-projectivity-lefschetz. No perfect pairing on an arbitrary STE is assumed and no counterexample to the stronger claim is asserted.
4. **Direct prerequisites.** Added genus-zero cohomology to odd induction and finite generation; low cohomology to homology13; and degree-four tautological cohomology to homology15. These are the exact even or genus-zero Kunneth factors used by their proof sketches. No dependency cycle is introduced.
5. **Graph family and locators.** The eleven middle maps in the Mbar_(1,13) proof use variable tails {y,i} and fixed forgotten flag x. They do not come from a fixed tail with eleven variable decorations. The statement was already correct. BFP Notation4.1 is p.1331, Proposition4.2 spans pp.1331–1332, and the genus-four equivariant Euler normalization is §11.3 p.1361. The Gorsky formula now has its own source entry on that node.
6. **APIs and checks.** Added the missing extensionality, membership, base-change, universal and orientation/sign contracts where used by consumers. Kept geometric carriers in the reader because they do not exist at the pins. Normalized inherited `example` test kinds to the five allowed kinds; added the Grassmann negative control. Every acceptance check, API and source locator is now present in the reader; all worked polynomial/sieve tables were retained.
7. **Independent Euler calculation.** The corrected Gorsky formula has been evaluated through three marks with exact rational arithmetic. The coefficient certificate below replaces the earlier claim that this expansion had not been reproduced. Published-source collation, the geometric formula’s primary inputs, formal certification, boundary-table assembly and graph-matrix certificates remain open.

## Sources and source findings

Every node’s cited statement/proof was reopened at its locator. CLP pp.1–31 and BFP pp.1323–1365 were read as the published author copies, including all used tables and the graph drawings. The four original PDF hashes match the packet. Getzler–Kapranov §2 pp.74–78 and §8 pp.107–111 were checked in the published paper; Gorsky §§1–3 pp.1–7 were checked in arXiv v3, without claiming journal collation. A bounded correction search additionally located [Kannan, arXiv:2602.09117v2, Remark3.8 pp.11–12](https://arxiv.org/pdf/2602.09117v2); §3.3 pp.10–12 was read directly and its version/hash added. No Picard-stack target is introduced.

Each finding has an individual reason and confirmed verdict in the packet. The inherited E1–E12 concern the even≤14 sign, half-spin central descent, unordered-pair induction subgroup, same-degree filling hypothesis, quadratic trivialization gap, parabolic exact sequence, genus-four count scope, approximation exponent, −11q3 coefficient, two cross-references and the closed-strata edge-orientation system. E4’s RH counterexample at (1,12,11) was checked against Proposition2.2; E5 remains a gap in the printed proof, rather than a claim that all its relative Chow conclusions are false. Existing numerical and final geometric endpoints were not silently declared disproved.

The additions are:

- **E13, BFP §9.1 p.1351.** For nonproper varieties the point-count trace needs compact support. A1 has ordinary graded trace1 and q points; H_c^2=Q_l(−1) gives the required q. Proper applications are unaffected.
- **E14, BFP Definition9.1 p.1351.** An arbitrary twisted-count class function need not be an integral rational representation character. For Spec F_(q³) with C3 action the three counts are (0,0,3), whereas rational C3 characters take equal values on the two nonidentity elements. The later all-Z smooth proper/Tate conditions are kept when integral representation coefficients are claimed.
- **E15, Gorsky v3 Theorem3.8 p.6.** Riemann–Hurwitz equation(3), p.4, requires h=1−(sum_(j=1)^r k_j)/2. The printed constant gives h=7/2 on the genus4 identity term k1=−6. Kannan already identifies the constant-term typo. The sum used here includes k_r, as required by Gorsky’s equation(3); the unramified case uses gamma=r.
- **E16, Gorsky v3 Definition3.5/Lemma3.6 p.5.** The unbound congruence modulus k must be r in gcd(x_i,k) and c(k,lambda_i,d). Kannan explicitly records both replacements. These findings are scoped to the preprint actually read.

The author’s recorded correction searches and the independent bounded searches are distinguished in `searched`. No exhaustive novelty claim is made. No source passage, image or restricted-library material is copied into the repository.

## Pinned baseline and ownership

All seven declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Declaration | Confirmed contribution and limit |
| --- | --- |
| `TauCeti.spinPlus` | Even exterior-algebra submodule for a split quadratic polarization; no SO10 vector-bundle descent. |
| `TauCeti.spinPlusAction` | Even Clifford action under the polarization line=bottom hypothesis. |
| `TauCeti.spinPlusSubrep` | Invariant half-spin subrepresentation under that same hypothesis. |
| `TauCeti.finrank_spinPlus` | Over a field with finite-dimensional nonzero W, rank 2^(rankW−1), hence16 at rank5. |
| `TauCeti.repRing` | Split Grothendieck ring of finite-dimensional monoid representations over a field; the finite-group characteristic-zero application uses Maschke. |
| `TauCeti.repRingCharacter` | Additive/tensor-multiplicative character map; it does not put every class function in the integral representation ring. |
| `CuspForm` | Slash invariance, holomorphy and vanishing at every cusp for integer weight and the stated GL2(R) subgroup; no moduli realization. |

The reviewed library audit and current read-only TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` were checked together with the current Tau Ceti library. AlgebraicVectorBundles’ finite locally free algebra is imported; its scope does not supply the relative Grassmannian here. R09.1’s quotient statement and smoothness theorem were read instead. Completed HodgeStructures supplies abstract Hodge/weight strictness, not geometric cohomology. SchurWeyl Layers7/9 supply fixed-degree characteristics and harmonic tensors, not completed modular series or geometric descent. SpinRepresentations, OrthogonalSpinGroups and the library already supply the spin primitives. Nothing is re-planned or edited upstream.

All 39 distinct external prerequisite references were checked against their current statement or exact lower-roadmap node. In particular: R09.5 gives fppf rigidification with stabilizer sheaves; R19.1 gives parabolic/newform realizations; FF.1/FF.3 give the exact evaluation/binary-form contracts; SF.5 and MC.2 still need the stated stack-product/cycle/GRR extensions; StableReductionPartII supplies the curve-stack key definition and MC.3/5/7 operations; WC.1/4/5/6 distinguishes stack mass, integral equivariant coefficients, local cutoff, global Tate conclusions and purity; DWP.8 supplies the oriented row. The current suppliers do not erase the recorded comparison/descent gaps.

## Exact arithmetic certificate

The calculation uses rational integers and fractions, without numerical approximation. For g=4 enumerate 1≤r≤18, −8≤k_r≤−1, and nonnegative k_j supported on proper divisors j of r, with sum_(j<r) k_j≤10 and sum_j j k_j=−6. Retain nonnegative integral h=1−sum_j k_j/2 and stable (h,s), where s=sum_(j<r)k_j. Compute N(r;lambda) directly: convolve the residues x modulo r with gcd(x,r)=lambda_i, keeping total residue zero. This avoids using the misprinted closed congruence formula. Put gamma=gcd(r,{j:k_j>0}), gamma=r if there are no positive exponents. For each type evaluate

c(k)=chi_orb(M_(h,s)) r^(2h) product_(prime p dividing gamma)(1−p^(−2h)) N(r;lambda) / (r product_(j<r) k_j!),

using the Bernoulli-number expression in Gorsky Theorem3.7, p.5. Discard zero coefficients. There are exactly the following 25 nonzero terms, written as our computed exponent vectors and coefficients. They are enough to recompute the expansion through degree3 by generalized binomial coefficients; no source passage or table is reproduced.

| r | Nonzero k_j | c(k) |
| --- | --- | --- |
| 1 | k1=-6 | -1/1440 |
| 2 | k1=2, k2=-4 | -1/10 |
| 2 | k1=6, k2=-6 | 1/36 |
| 2 | k1=10, k2=-8 | -1/1440 |
| 3 | k3=-2 | -1/9 |
| 3 | k1=3, k3=-3 | -1/6 |
| 3 | k1=6, k3=-4 | -11/180 |
| 4 | k1=2, k4=-2 | 1/3 |
| 4 | k1=4, k2=1, k4=-3 | 1/6 |
| 4 | k1=2, k2=4, k4=-4 | -1/16 |
| 5 | k1=4, k5=-2 | -13/30 |
| 6 | k3=2, k6=-2 | 2/9 |
| 6 | k1=2, k2=2, k6=-2 | -1/4 |
| 6 | k1=3, k3=1, k6=-2 | -1/18 |
| 6 | k2=3, k3=2, k6=-3 | 1/18 |
| 6 | k1=1, k2=1, k3=3, k6=-3 | 1/9 |
| 8 | k1=2, k4=2, k8=-2 | -1/8 |
| 9 | k1=3, k9=-1 | 1/3 |
| 10 | k1=2, k2=1, k10=-1 | 3/5 |
| 10 | k2=2, k5=2, k10=-2 | -1/10 |
| 12 | k1=1, k2=1, k3=1, k12=-1 | 1/3 |
| 12 | k1=2, k4=1, k12=-1 | 1/6 |
| 15 | k1=1, k3=1, k5=1, k15=-1 | 8/15 |
| 16 | k1=2, k8=1, k16=-1 | 1/4 |
| 18 | k1=1, k2=1, k9=1, k18=-1 | 1/3 |

Summing c(k) product_j(1+p_j t^j)^(k_j) yields, through t³,

2 + 2p1 t + (−p1²+p2)t² + (−5p1³/3+p1p2+8p3/3)t³.

Multiplication by the centralizer factors z_(1³)=6, z_(2,1)=2 and z_(3)=3 gives S3 character values (−10,2,8), hence 2s_(3)−6s_(2,1), with sign coefficient zero. The same algorithm in genus2 reproduces the ten nonzero terms of Gorsky Example3.9 and its expansion through degree3. This checks arithmetic conditional on the orbit formula and Harer–Zagier input; neither is formalized by the calculation.

Additional independent polynomial checks passed:

- Closed minus boundary equals open for all four genus-four vectors; compact vectors have the required degree, palindromicity and nonnegative coefficients. The open Euler values for n=0,1,2,3 are 2,2,−2,−10.
- S2 identity specialization and S3 specialization with dimensions1,2,1 recover the ordinary vectors. Closed S3 Schur Euler coefficients are 12542,11724,1955; open coefficients are 2,−6,0.
- Multiplication of all three inverse-zeta products gives the unmarked sieve rows. The five-orbit signed four-point formula reduces exactly to (q+1)²q²(q−1)².
- The cusp graph-family sums give 11,429,6006,264 and891; 891−825=66, 825+11=836 and891−836=55. These identities do not verify matrix rank, the nonzero pairing, or the independent Getzler/Petersen multiplicities.

## Remaining work for the orchestrator

Preserve all fifteen gaps and the four ownership proposals. In particular, route generic stack duality to the stacks PartII, completed modular symmetric functions to SchurWeylSymmetricFunctionsPartII, and the stack cycle/Chow/GRR/Lefschetz extensions to their existing owners. The current R09.1 Grassmannian and StableReductionPartII key moduli definition are exact imports, never new constructions here. Read the primary mapping-class, genus-one/two, Hurwitz and finite-field geometry sources before closing their contracts. Supply the missing matrices/pivots/pairing and boundary-assembly certificates; published Gorsky collation remains open. No question blocks acceptance of this honest planning pass.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicStructuresInModuliOfCurves.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/MotivicStructuresInModuliOfCurves.lean`: exit 0 at the pins, 38 expected `declaration uses sorry` warnings and no others; 148 lines. The existing file was left unchanged: its light stability/order/seed/polynomial statements still agree with the corrected packet, and absent geometric carriers remain reader targets.
- Independent arithmetic described above: all assertions passed. No graph matrix or sieve-proof computation is claimed by an elementary consistency identity.
- Source-finding schema/version/verdict completeness, reader/roadmap synchronization, allowed test kinds, planet bounds, submission-path checks and `git diff --check`: passed. No sorry-bodied data definition, local path or source excerpt is introduced.

## Node register

The packet carries these same individual verdicts; source locators remain on every node and in the reader.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `TC.0/tautological-rings` | corrected | Least unital operation-stable Chow system, decorated graphs and degree-doubling cycle map agree with CLP; stack operations remain explicit supplier obligations. Test kinds normalized to PROTOCOL §12. |
| `TC.0/kappa-classes` | corrected | The forgotten-mark psi power uses exponent a+1 and pushforward lowers codimension by one; kappa0=2g−2+n distinguishes the pointed convention. Test kinds normalized to PROTOCOL §12. |
| `TC.0/induction-order` | corrected | Corrected BFP Notation4.1 to p.1331. Lexicographic (g,2g+n) descent proves well-foundedness and boundary/forgetting compatibility; stability excludes fictitious targets. Test kinds normalized to PROTOCOL §12. |
| `TC.0/boundary-exactness` | verified | Normalized compact boundary factors, the −1 Gysin twist, and ordinary versus Borel–Moore duality match §2.1 and equation(6.1); generic DM duality remains a gap. |
| `TC.0/cusp-moduli-identification` | verified | Weights12 and16 give rank-two parabolic realizations with the stated Hodge types. R19.1 supplies modular realizations; configuration-to-moduli comparison is additional. |
| `TC.1/vcd` | verified | The separate g=0, g=1, unmarked and marked bounds retain the stability and mapping-class hypotheses recalled in BFP §2; primary proofs remain in G-mapping-class-inputs. |
| `TC.1/top-vcd-vanishing` | verified | Top-degree vanishing retains the source genus restrictions; it is not inferred from the vcd upper bound alone, and the cited primary input remains explicit. |
| `TC.1/compact-support-vanishing` | verified | Duality translates the vcd and top-degree results into the stated compact-support/BM bounds, with the genus-zero endpoint treated separately. |
| `TC.1/normalized-boundary-injection` | verified | The injection uses the precise low-degree open compact-support vanishing and compact normalized boundary factors; AC’s primary proof is still a named source input. |
| `TC.1/odd-induction` | corrected | Added the genus-zero cohomology prerequisite. Boundary Kunneth reduces an odd factor by degree or stable pair outside the finite base region. |
| `TC.1/genus-zero-cohomology` | verified | Keel’s compact presentation is imported as a genuine finite-base theorem; the smooth open M0,n is not asserted to have only even cohomology. |
| `TC.1/odd-135` | verified | The all-pair vanishing is the AC finite-base theorem plus odd induction; its primary small-genus calculations are honestly unclosed. |
| `TC.1/lower-polynomial-counts` | verified | The recalled lower-genus count ranges match BFP; all-field, equivariant and smooth proper comparison inputs remain separate from a bare numerical count. |
| `TC.1/odd-seven` | verified | The finite genus bases lie in the lower-count ranges; WC.5 and the explicit DM comparison yield odd vanishing before the stable-pair induction. |
| `TC.1/low-genus-odd-nine` | verified | The genus-at-most-three bound and the indicated finite bases match BFP §2; no genus-four result is used circularly. |
| `TC.2/symplectic-local-systems` | corrected | V has rank2g and contraction target Q(−1); highest-weight partitions have length≤g and weight their size. Harmonic tensors are imported, geometric descent is a gap. Test kinds normalized to PROTOCOL §12. |
| `TC.2/genus-one-pure` | verified | The hook partition and binomial(n−1,k−1) multiplicity match CLP Proposition2.2, with positive degree and n≥k restrictions and separate degree-zero unit. |
| `TC.2/genus-one-even` | verified | Petersen’s compact even tautological theorem is not replaced by a claim about every open weight piece; its primary proof remains G-source-inputs. |
| `TC.2/stable-tautological-range` | verified | The strict genus inequality and coarse cohomological upper bound match the Harer/Wahl inputs used on CLP p.10; no stability boundary is strengthened. |
| `TC.3/marking-filtration` | corrected | Phi uses stable-target pullbacks and Psi uses psi times Phi in degree k−2. Added membership contracts; the empty-target and negative-degree tests distinguish zero cases. Test kinds normalized to PROTOCOL §12. |
| `TC.3/local-system-quotient` | verified | The size-n partition, weight k and transpose Specht action match Lemma3.1; the n>0, n≥k consequence excludes the unit exception. Geometric spectral-sequence descent stays open. |
| `TC.3/genus-two-even` | verified | The range is even degrees through20. The proof is ordered after the marking quotient and retains Petersen’s primary compact-type calculation as a gap. |
| `TC.3/semi-tautological-extension` | corrected | The definition imposes forgetting pullback and clutching pushforward, with external products; reverse operations are proved later for cusp-generated systems. Added extensionality/closure APIs. Test kinds normalized to PROTOCOL §12. |
| `TC.3/filling-criterion` | verified | Checked the explicit RH counterexample to the printed degree bound and the strengthened same-degree forgetting hypothesis. Boundary factors satisfy the complementary-dimension bound; no failed printed lemma is assumed. |
| `TC.3/genus-two-odd-markings` | verified | The odd marking number kills the highest-size local system via the hyperelliptic involution; the exact lower-degree genus-one seeds and n−1 sources match Lemma3.2. |
| `TC.3/cusp-ste-operations` | verified | The reverse-operation closure is an output for cusp-generated STEs, not part of the STE definition. The earlier all-genus H11 theorem remains a source-input gap. |
| `TC.3/finite-generation` | corrected | Added the genus-zero input. The strict genus and weak marking/cohomological bounds match Theorem1.3, and the repaired filling criterion includes all required smaller triples. |
| `TC.3/homological-generation` | verified | The finite region is explicitly a derived sufficient BM seed region, not a formula quoted from Remark3.3; each complementary degree uses its own dimension and homology twist. |
| `TC.3/finite-simple-types` | verified | Fixed output degree bounds tensor lengths and edge twists, so the finite seed realizations yield finitely many simple factors after semisimplification; no splitting of Galois extensions is asserted. |
| `TC.3/top-heavy` | corrected | Corrected the ample power to a^(d−k) and the title to the proved injections/growth below the middle. Full paritywise unimodality is recorded as requiring another argument. |
| `TC.4/chow-kunneth-generation` | corrected | CKgP quantifies exterior-product surjectivity against every admissible test stack; the elliptic diagonal test rules out the false Y=point version. Test kinds normalized to PROTOCOL §12. |
| `TC.4/ckgp-permanence` | verified | The open, stratification, affine/Grassmann and proper-surjection permanence uses the stated product-natural Chow contracts; existing scheme formulas are not silently generalized. |
| `TC.4/pure-algebraicity` | verified | The diagonal/projector argument controls the pure weight piece of open cohomology, with the correct cycle degree; it does not assert purity of the entire open group. |
| `TC.4/known-ckgp-ranges` | verified | The constants c(1)=c(2)=10, c(3)=c(4)=11, c(5)=7, c(6)=5 agree with CLP Table1; the earlier marked Hurwitz proofs remain a source gap. |
| `TC.5/gonality-strata` | corrected | The closed ≤3, exact4 and open5 decomposition is over geometric gonality and is invariant under forgetting marks. Added the exact-membership criterion. Test kinds normalized to PROTOCOL §12. |
| `TC.5/low-gonality-input` | verified | The hyperelliptic/trigonal marked range is the recalled primary result, not a consequence of the moduli-stack definition; G-known-chow retains its proof obligation. |
| `TC.5/tetragonal-hurwitz` | corrected | Ranks3,2 and degrees10 match genus7 Casnati–Ekedahl data. PGL2 target automorphisms are retained; O(1)/bundle lift descent stays in G-known-chow. Added family/isomorphism APIs. Test kinds normalized to PROTOCOL §12. |
| `TC.5/tetragonal-splitting` | corrected | The three stated splitting families and the exclusion of the hyperelliptic stratum match the table; added a geometric-membership API and kept distinct equal-F strata. Test kinds normalized to PROTOCOL §12. |
| `TC.5/ce-pushforward` | verified | The universal-curve/projective-bundle pushforward is degree-correct and uses the earlier CE tautological statement; nodal-stack GRR is requested, not inferred from scheme GRR. |
| `TC.5/open-tetragonal-stratum` | verified | The ≤3-mark incidence surjectivity and rank conditions follow the cited lemma; the source filling theorem remains an explicit Hurwitz input. |
| `TC.5/sigma-chow` | verified | The special-stratum generators and evaluation relations are the two separate splitting-stratum computations on pp.15–16; their lift/Chow descent is still required. |
| `TC.5/tetragonal-global-chow` | verified | Localization and the support-tautological pushforward treat the special strata before whole-locus generation; the marking bound is not extended to four for the full M7,n. |
| `TC.6/orthogonal-universal-chow` | verified | BP has GL5 Levi and ten-dimensional split unipotent radical. The equivariant exact sequence gives Chern identities without the false P-equivariant direct-sum splitting. |
| `TC.6/orthogonal-fibre-powers` | corrected | Added n≥1 exactly as Corollary5.11 requires; the empty list cannot generate A*(BSO10). Relative quadratic splitting/component control stays in G-orthogonal. |
| `TC.6/mukai-lift-gate` | verified | Half-spin is a Spin10 vector representation and only projectively PSO10; the gate explicitly requires mu4 rigidification, actual stabilizers and family comparison rather than claiming them proved. |
| `TC.6/mukai-descent-gate` | verified | Each bundle’s central character, cancelling twists and product-natural rational transfer are separately required; a projective group action alone does not descend vector bundles. |
| `TC.6/marked-spinor-incidence` | corrected | Corrected to subspaces of rank7−n, equivalently supplier quotients of rank9. Added universal/base-change/dimension APIs and a fourth test detecting the opposite quotient convention. Test kinds normalized to PROTOCOL §12. |
| `TC.6/spinor-tautological-bundles` | verified | The exact sequence has ranks n,7,7−n and line c1=−psi in the specified compatible lift. Central-cancelling twists must be incorporated before any descended Chern identity. |
| `TC.6/genus-seven-chow` | corrected | For n=0 added proper forgetting from one mark and pi_*(psi1 pi*alpha)=12alpha, plus the kappa prerequisite; n=1..4 uses the fibre-power route. Both Mukai/orthogonal gates remain open. |
| `TC.7/hyperelliptic-quotient` | verified | The parity-dependent binary-form quotient is separated from characteristic-two curve counts; FF.3 alone is not a characteristic-two moduli presentation. |
| `TC.7/hyperelliptic-moments` | verified | The first two character sums use distinct evaluation points and the proper finite-field characteristic hypotheses; their zero/second-moment values match BFP Lemma5.2. |
| `TC.7/hyperelliptic-marked-counts` | verified | The low-mark counts are ordinary stack masses with the falling-factorial marking factors; the all-characteristic extension is a named geometric source input. |
| `TC.7/quadric-incidence` | corrected | The cone is affine A15 and smooth quadrics use P15. Incidence permits singular/nonreduced fibres before sieving; added a membership contract preserving that distinction. Test kinds normalized to PROTOCOL §12. |
| `TC.7/quadric-orbit-count` | verified | The three stabilizer orders and their quotient-mass use match Propositions6.1–6.2, including disconnected stabilizer handling; characteristic-two classification remains explicit. |
| `TC.7/nonreduced-sieve-bounds` | verified | Positive-dimensional singular loci are handled by their inverse-zeta cancellation, not by counting only isolated singular points; the family tail contract has the required uniform bound. |
| `TC.7/quadric-inverse-zeta` | verified | The three inverse-zeta products match the cone, nonsplit and split point counts. Independent polynomial multiplication verifies their first coefficients and the sign convention. |
| `TC.7/cone-sieve` | verified | Every attached coefficient was compared with Propositions8.1–8.2. The unmarked identity q15−q14−q13+q12 was independently expanded, retaining vertex exclusion. |
| `TC.7/nonsplit-sieve` | verified | Every table cell matches Propositions8.4–8.5, including exact S0=(q6−q2)p12 in the three-mark row and the zero unmarked S2 coefficient. |
| `TC.7/split-sieve` | verified | Every table cell matches Propositions8.6–8.7; degree≥6 truncations retain the stated o(q6) errors rather than becoming exact fibre counts. |
| `TC.7/sieve-tail` | verified | The n≤2 tail is negligible at the stated cutoff; n=3 retains an integral q6 term. The same distinction is retained under marking twists. |
| `TC.7/four-point-signed-count` | verified | All five Frobenius orbit-type terms were multiplied exactly to obtain (q+1)^2 q²(q−1)^2. Unordered orbit denominators and sign by number of orbits are correct. |
| `TC.8/curve-marking-twists` | corrected | Cycle-type descent uses sigma times geometric Frobenius and groupoid mass. Added conjugacy functoriality; the trace uses compact support for open moduli. Test kinds normalized to PROTOCOL §12. |
| `TC.8/weight-euler-characteristic` | corrected | The definition is an alternating compact-support weight class with rational group representations. Negative virtual coefficients and representation dimensions are retained; added its coefficient contract. Test kinds normalized to PROTOCOL §12. |
| `TC.8/stable-graph-transform` | corrected | The free connected stable-graph transform has flag/Koszul automorphisms and no extra edge determinant. Added its modular-operad universal property; orientation belongs to the other complex. Test kinds normalized to PROTOCOL §12. |
| `TC.8/getzler-kapranov` | verified | Theorem8.13 uses the completed characteristic and ordinary exp(Delta) separately from plethystic Exp/Log. Adams operations act on the Tate variable; completion remains a PartII gap. |
| `TC.8/polynomial-induction` | corrected | Corrected Proposition4.2 to pp.1331–1332. The proof separates the oriented weight complex from untwisted graph additivity and does not infer integral representation coefficients for arbitrary counts. |
| `TC.8/genus-four-euler` | corrected | Reproduced a 25-term corrected Gorsky expansion yielding class values (−10,2,8) and Schur coefficients (2,−6,0). Corrected/split the source locators; published collation remains open. |
| `TC.8/hyperelliptic-equivariant` | verified | The three partitions and their q-polynomials agree with §11.1, including the fixed-mark plus conjugate-pair twist; they are not products of independent rational-point counts. |
| `TC.8/twisted-sieve` | verified | Compared all cone/nonsplit/split rows of Propositions11.2–11.4, retaining the exact/truncated and error distinctions; ordinary identity specializations agree. |
| `TC.9/genus-four-cutoff` | verified | The local cutoff and all-Z upgrade are separate WC.5 imports. The genus-four conclusion is not mislabeled as all-genus vanishing; the unknown integral middle coefficient is fixed by Euler data. |
| `TC.9/genus-four-boundary-counts` | verified | The four coefficient vectors match Proposition9.6. Exact subtraction and identity specializations were checked independently; full graph assembly is still a finite-certificate gap. |
| `TC.9/genus-four-closed-counts` | verified | All four Theorem1.4 vectors match, are palindromic/nonnegative and have degrees9+n; the three-mark middle coefficient is10605. |
| `TC.9/genus-four-open-counts` | verified | All four Theorem1.5 vectors equal closed minus boundary. In particular the three-mark coefficient is −11q3, with q4 coefficient zero and Euler value −10. |
| `TC.9/genus-four-tate` | verified | The proper all-Z hypothesis supplies actual Tate cohomology under the exact WC.5 contract; this is stronger than a local eigenvalue or virtual-Euler statement and keeps the DM comparison gap. |
| `TC.9/odd-nine` | verified | Lower genera and genus4 with n≤3 cover the finite induction region; no infinite marking base or count beyond the proven range is asserted. |
| `TC.9/genus-four-equivariant-counts` | verified | Every S2/S3 Schur vector matches Theorem11.1. Weighted identity evaluations recover the ordinary vectors; compact coefficients are palindromic/nonnegative. |
| `TC.9/genus-four-local-system-traces` | verified | The six size≤3 local-system trace polynomials and Tate contractions match Theorem11.5. These are compact-support Euler realizations, not individual cohomology decompositions. |
| `TC.10/low-cohomology` | verified | Degree≤3 tautological cohomology uses AC in degrees0,2 and odd vanishing; this is the even boundary input needed by homology13. |
| `TC.10/degree-four` | verified | The pure open quotient vanishes in the stated range and the boundary terms are tautological. No unproved high even-degree generalization is used. |
| `TC.10/degree-six-stable` | verified | The stable cohomology range keeps g≥10; the source theorem does not assert every genus has tautological degree6. |
| `TC.10/even-homology` | verified | The CKgP finite-region table and even boundary induction give degrees≤14. The corrected inequality is an upper bound; the cohomological complement retains its own dimension. |
| `TC.10/even-high-realization` | verified | The complementary degree14 Tate exponent d−7 is consistent with cohomology weight2d−14; it is not ordinary degree14 cohomology for varying d. |
| `TC.10/degree-six-pairing-criterion` | verified | The intersection-matrix statement is explicitly a sufficient finite criterion, with unknown computations retained, rather than a proved all-genus degree6 theorem. |
| `TC.11/genus-two-odd-galois` | verified | Petersen’s semisimplified genus-two degree13/15 classification has the correct Tate shifts; the primary local-system result remains G-genus-two-inputs. |
| `TC.11/omega-graphs` | corrected | An e-edge undecorated cusp pushforward is L^e S12→H^(11+2e), and a multiplicity basis is not a rational-vector basis. Added the retained-flag sign contract. Test kinds normalized to PROTOCOL §12. |
| `TC.11/basis-1-12` | verified | The eleven rational-tail cusp maps and the fixed forgotten-mark convention match Lemma7.4; rational dimension is22 rather than11. |
| `TC.11/basis-1-13` | corrected | Corrected the middle proof family to tails {y,i} with fixed forgotten flag x. The 286+11+132 count is429; retained flag and independence certificates remain explicit. |
| `TC.11/basis-1-14` | verified | The five graph-family counts sum to6006 and match the diagrams, with explicit forgotten/retained flag conventions; freeness needs the independent multiplicity certificate. |
| `TC.11/basis-2-12` | verified | The three one-edge families have counts66+132+66=264 and agree with Lemma7.7; graphical multiplicity and rational dimension remain distinct. |
| `TC.11/graph-restriction-rank` | verified | The nine displayed graph-family counts sum to891 and 891−825=66. Actual entries,825 pivots and66 kernel vectors remain G-computations, not verified by arithmetic alone. |
| `TC.11/unordered-pair-module` | verified | The corrected subgroup S10×S2 gives rank66 and hook dimensions11+55. Ordered-pair induction would double the rank and is excluded. |
| `TC.11/genus-two-fifteen-base` | verified | The 825-image plus11 independent complement gives multiplicity836 only after one nonzero pairing, as the proof requires. The pairing and finite matrix are retained as open certificates. |
| `TC.11/genus-two-nearby-bases` | verified | The n=11 degree13 and n=13 degree15 cases use different lower groups and the odd-marking reduction; their source lemmas are not conflated. |
| `TC.12/homology-thirteen` | corrected | Added low-cohomology as a direct prerequisite for even boundary factors of degree≤2. The finite exceptional pairs and genus-two Lefschetz step agree with Theorem1.6. |
| `TC.12/homology-fifteen` | corrected | Added degree-four as a direct prerequisite for even boundary factors≤4. Both cusp seeds and exceptional genus-two bases are retained, with the source dimension in each complement. |
| `TC.12/high-odd-realizations` | verified | Complementary degree13 and15 twists match L^(d−12)S12 and the stated degree15 alternatives; semisimplification is retained where the source needs it. |
| `TC.12/genus-two-cohomology-fifteen` | verified | Lemma8.1’s complementary-degree generation and actual degree15 realization cases are distinguished; large marking-number degree15 is not inferred from small homological degree. |
| `TC.12/weight-fifteen-complex` | corrected | The row uses compact normalized vertex factors and det(edges) before invariants. Added the orientation-change API; edge permutations carry the required sign and d²=0. Test kinds normalized to PROTOCOL §12. |
| `TC.12/fifteen-boundary-injection` | verified | The compact-support vanishing and weight-row spectral sequence give injectivity of alpha and exactness at the next term in the stated range; no untwisted graph replacement is used. |
| `TC.12/no-fifteen-zero` | verified | The type(15,0) restriction argument follows the source graph cases and oriented row. It concerns g≥2, leaving the genus-one cusp contribution. |
| `TC.12/genus-one-fifteen-split` | verified | The boundary/pure splitting has the indicated cusp quotient and algebraic map; the large multiplicity186263 and finite rank data remain explicit certificates. |
| `TC.12/realization-classification` | verified | The degree13/14/15 classification combines cusp homology, no type(15,0) in genus≥2 and genus-one splitting, with all Tate exponents and semisimplification conditions retained. |
| `TC.12/genus-three-cohomology` | verified | For n≤11 the homological-degree bounds and duality cover the whole compact genus-three cohomology; the exceptional middle checks use the stated Lefschetz/supplier obligations. |
