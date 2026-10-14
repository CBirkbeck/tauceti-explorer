# Independent package review: AutomorphicGaloisRepresentations, revision 2

Issue #7918. Codex, session `codex-VHGxgz`, 14 October 2026.

**Verdict: needs_changes.** The revised package satisfies the amended README/Lean
shape and its Lean file elaborates. The remaining defect is mathematical:
§5.1's general-multiweight Hilbert ordinary refinement lacks a sourced, fully
normalized identification of its two graded characters. I fixed the parallel
case, removed the unjustified extension, and exposed the missing comparison.
The review is complete; this is not a checkpoint of the review.

## Work reviewed and fixes

I read the full README and Suggested.lean, the accepted packet, the previous
package review and the revision handoff. All 66 original targets remain in
their documented sections, with all 90 original API names and all 66 original
test names. The README has 71 numbered sections, including the five interfaces
moved down from later roadmaps. Definitions retain their API and discriminating
Checks. The unchanged metadata is `topic = "math.NT"`.

Two complete current upstream models were read: ArithmeticDirichletSeries and
ConformalMapping, including both Suggested.lean files. I applied
UPSTREAM_GUIDE and PACKAGE_REVIEW's 12 October amendment. Arithmetic carriers
unavailable at the pins belong in the README. The previous review's demand for
all arithmetic signatures in Lean is superseded; it is not a remaining defect.

Fixes applied:

1. §1.5 now points to §4.8 for classical absolute irreducibility, rather than
   promising it in Layer 7.
2. Removed the generic `hilbertGeomCharpoly_normTwist` theorem from Lean and
   the extra API entry from §3.11. Current
   IntegralHeckeAndGaloisDeterminants Layer 3a.1 already owns coefficient scaling
   and duality. The boundaries now name that owner. The specialized polynomial
   definitions retain the weight-one and inverse-Hecke conventions.
3. §7.1 now states operation-specific compatibility hypotheses. Direct sums
   and tensor products of two rank-two systems have rank four, outside the
   rank-two almost-strict predicate. Restriction and ramified character twists
   may create newly unramified coefficient-place pairs; almost-strict transport
   requires comparison at those pairs. Added negative controls for both errors.
4. Recovered Kisin's public author DVI and replaced inaccessible AMS links and
   journal-page locators with verified author-copy pages. Expanded R06.3 to the
   actual factorization, invertibility and injectivity hypotheses of crystalline
   period continuation. A Sen factorization alone is insufficient.
5. Corrected the Buzzard supplier locator: §§8–11 construct form spaces;
   Lemma 12.2 and §13 supply compactness and gluing. Small-slope classicality is
   separate. The totally real fixed-slope instance is sourced to Skinner §2.4.2.
   Added the verified Wintenberger 1997 locator and Skinner's GL₂ application.
6. Scoped finite twisting to an unramified ordinary quotient to the
   parallel-weight range. §4.10 now distinguishes a candidate quotient character
   from its identification with the attached representation. §5.1 records the
   nonparallel comparison gap and a test detecting the missing algebraic factor.

## Remaining defect and precise repair

The original ordinary-refinement target includes Hilbert forms beyond the
parallel-weight theorem in Skinner–Wiles §3.3. Hida's Theorem I(iv), printed
p. 118, supports existence of a nearly ordinary rational filtration in the
general regular-weight range, but does not by itself give this package's
normalization dictionary. Balasubramanyam–Ghate–Vatsal §3, internal pp. 7–8,
exhibits a labelled algebraic factor on principal units. For weight `(2,4)`,
`v=(1,0)` and trivial finite character, a principal unit with first embedding
`1+p` gives quotient value `(1+p)⁻¹`, rather than 1. Finite twisting cannot
erase that algebraic factor.

To repair the package, supply a precise general-weight comparison target:
identify the quotient on all units and on a chosen uniformizer, prove its
change-of-uniformizer law, and transport it to the fixed geometric `ρ` and the
arithmetic-dual conventions of §3.11. Recover the subcharacter by the
determinant. Use a source with those exact weight/operator conventions and
locators, or give the intervening comparison argument as a target with exact
inputs. Then connect §4.10 and §5.1 to it. Rational filtration existence and
lattice saturation do not discharge this obligation. No heavy Lean carrier or
implementation of a Hida family is requested.

I read Hida's original article, the relevant normalization and proof passages,
the BGV local-character passage and Hara–Ochiai's ordinary statement. These
do not establish the complete requested dictionary without additional work;
I have not invented the missing all-unit/uniformizer formula. The README marks
the gap explicitly. The existing twelve packet gaps and fifty-one supplier
requests remain implementation contracts; the packet was not edited.

## Sources: flagged obligations and fresh checks

Locators below identify the versions actually read. Source statements and
arguments were checked in their original mathematical context. An accessible
paper's attribution of an earlier result is distinguished from reading that
earlier proof. No source passages or source-by-source synopsis are added to the
repository, and no restricted book was used.

| Author-flagged obligation | Fresh verification and consequence |
| --- | --- |
| Kisin 2008: §4.1, Theorem 4.3, fixed-type quotients | Public author DVI: §4.1 p. 31, Theorem 4.3 and proof pp. 32–33, Theorem 2.5.5 pp. 19–20, Theorem 2.7.6 p. 23. Read the hypotheses and proof passages. Corrected source version and locators; nilpotent coefficient algebras remain essential. |
| Taylor's original Hilbert congruence/local-global results | Original access attempts did not yield the papers. Verified the constructor and local statements in Kisin §4.1/4.3, Skinner introduction pp. 242–244 and Blasius §3. These directly source the retained conclusions. Taylor's original proof remains an explicit imported proof obligation, not a claim of fresh original verification. |
| Saito 1997 and classical all-weight coefficient-prime comparison | Original publisher access did not yield the paper. Read Skinner Theorem 1 and its proof discussion pp. 242–244, which include the classical case, and Saito's supplement Theorem 3 pp. 429–430. Kept the exact source/proof obligation; do not infer crystallinity from Hodge numbers alone. |
| Momose openness and inner twists | Read Ribet 1985 §3 pp. 190–192: inner-twist fixed field, quaternion algebra, open subgroup and Theorem 3.1. This directly sources the stated constrained-image formulation. Momose's full original argument was not obtained. No full unrestricted GL₂ claim is made. |
| Carayol bad reduction and vanishing cycles | Public original: §5.6 p. 429, §6.7 p. 432, §11.1 p. 449 and §11.4–11.5 p. 451; introductory Theorems A/B pp. 409–411. Confirmed the weight-two H² exception and the normalization-kernel direction. Detailed geometric proofs remain R18/LPV contracts. |
| Period continuation and central-isogeny lifting | Kisin 2003 author DVI, Proposition 5.14/Corollary 5.15 pp. 26–27 and Corollary 2.6; Wintenberger 1997 Theorem 2.2.2 pp. 1310–1311; Skinner §2.4.1–2.4.2 pp. 252–255, especially footnote 9 p. 254. Expanded continuation hypotheses and retained φ^{f_v}. Wintenberger 1995's original was not obtained; the 1997 alternative and Skinner application are direct sources. |
| Unitary/symmetric-square realizations and quaternionic families | Read Skinner §2.3–2.4 pp. 246–255 and Blasius's geometric realization argument. The exact BR93 packet/geometry assertions remain independent early AG2 contracts, sourced in Skinner; the original BR93 proof was not obtained. Read Buzzard 2006 §§11–13 pp. 73–80 and Buzzard 2004 §7 Proposition 4 p. 19. Corrected the compactness/gluing/classicality distinction. |
| Ordinary characters and period/Wach comparisons | Read Skinner–Wiles §§3.1–3.3 pp. 27–31, 38–39; DFG §§1.2, 4.5, 5.3–5.4 pp. 9, 51, 56, 58; Hida Theorem I(iv) p. 118 and its proof pp. 132–134; BGV §3 pp. 7–8. General-weight character normalization remains the defect above. Integral Wach reduction and rational D_cris stay distinct. |
| Faithful geometric multiplicity, finite-quotient conditions and quaternionic sign | Read DDT §4.1 pp. 109–110 and Lemma 3.27 pp. 94–95, Chenevier §§1.1–1.5/1.10 and Corollary 2.22 pp. 7–8, 12, 34, and KW II §§7/9. Nilpotent whole-ring inputs and the excluded Nv≡−1 case remain explicit contracts. |
| Independent geometric weights and analytic trace-zero density | Read Saito's supplement Theorems 1–3 pp. 429–430, Blasius purity/Ramanujan arguments, and Skinner 2020 §3 p. 350. The independent weight supplier must not import this roadmap's coefficient-prime application. The generic analytic density theorem remains R01.5, rather than being inferred from large image alone. |

The random sample was selected before reading with `random.Random(7918)` and
fifteen packet nodes. All their associated locators were compared with the
README, not merely their first citations.

| Sampled README target | Locators checked | Outcome |
| --- | --- | --- |
| §4.13 HK/de Rham multiplicity | CDN §5.2.1, Proposition 5.2, pp. 43–45 | Correct tower, local type, actions and coefficient completions. |
| §3.4 special components | Carayol §6.7 p. 432, §11.4 p. 451 | Nonzero monodromy retained. |
| §2.10 weight-one Artin representation | DS Theorem 4.1 pp. 513–514, Corollary 4.2 p. 514, Remark 6.5 p. 521, §8.1 p. 525 | Correct k=1 route; not a k≥2 geometric application. |
| §5.3 ordinary CM splitting | HO Proposition A.3 pp. 70–71; DK Lemma 9.2 p. 67 | CM-type and regularity hypotheses retained. |
| §4.1 weight-monodromy | Saito Hilbert Theorem 2 p. 13; supplement Theorem 1 p. 429 | Geometric range and independent weight input retained. |
| §5.2 good nonordinary crystalline/Wach | Scholl Theorem 1.2.4 p. 2; DFG §§1.2/5.4 pp. 9/58 | Characteristic-zero crystallinity needs no ordinary or small-weight hypothesis. |
| §3.3 vanishing-cycle filtration | Carayol §5.6 p. 429; §11.1 p. 449 | Weight-two localized exception retained. |
| §5.1 ordinary line/lattice | SW §3.3 (3.2) pp. 38–39; DFG §§1.2/4.5/5.3–5.4 pp. 9/51/56/58 | Parallel formulas valid; general Hilbert extension was unjustified and is now a gap. |
| §6.6 classical Hecke representation | DDT §3.3 pp. 93–95, Lemmas 3.26–3.27 | Exact residual/type-Σ conditions and cofinal quotient argument retained. |
| §1.6 integral newform realization | DFG §§1.2/4.5/5.3–5.4 pp. 9/51/56/58 | Primes dividing Nk! and lattice choices retained. |
| §4.7 full coefficient-prime comparison | Skinner Theorem 1 pp. 242–244, §§2.4/2.4.2 pp. 251/254–255 | Residual and discrete-series restrictions removed only by the full theorem. |
| §4.9 KW local forms | KW II Proposition 7.7 p. 67, Corollary 7.8 pp. 67–68 | Unramified base, parallel weight and residual hypotheses retained. |
| §4.12 nearly ordinary away-p compatibility | SW §3.3 (3.3) p. 39 and §2.1 p. 9 | Same arithmetic dual and twist as §4.11. |
| §1.2 parabolic realizations | DFG §2.4 p. 24, Lemma 4.12 p. 51, §5.6 p. 56, §5.2 (29) pp. 53–54, §1.3 p. 12 | Pairing, conjugate form and coefficient action consistent. |
| §6.8 geometric determinant | DDT §4.1 pp. 109–110, Lemmas 1.37–1.39 pp. 40–42; Kisin Theorem 4.3 proof pp. 32–33; Chenevier §§1.1–1.5/1.10 pp. 7–8/12 | Generic law is upstream-owned; geometric extraction still needs a faithful whole-ring module. |

## Prerequisites, ownership and current-library comparison

The current upstream checkout is `0d144d044dacebca17b654695b6f1ad58f159b27`;
the current Tau Ceti library is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
I searched by mathematical objects, coefficients, operators and hypotheses,
then read the relevant matches. I screened all nine newer roadmaps and every
Completed directory, including the four specifically required completed
roadmaps. No new modular arithmetic target was found there. LocalGaloisGroups
supplies local reciprocity, rather than eigenform extraction; IntegralLattices
concerns integral quadratic lattices, rather than a line inside an arbitrary
DVR Galois lattice; HodgeStructures supplies structural Hodge theory, rather
than geometric eigenform comparison.

| Existing owner | Package treatment and result |
| --- | --- |
| Current Tau Ceti `HeckeRing.GL2.EigenformAwayFromLevel`/`Newform` | Read the structure fields: good-index eigenvalues, nonzero cusp form, new-space condition and a₁=1. Already deferred in boundaries; no second analytic bundle. |
| Current Tau Ceti `TauCeti.det_tateModuleGaloisRepresentation` | Read its ℓ≠0/separably-closed-extension hypotheses and Weil pairing. Already a boundary baseline, not replanned. |
| Current ModularForms Layers 8, 8W, 8G | Read the current integral q-expansion lattice, conjugate eigensystems, coefficient field and period-line contracts. Weight one uses its own existing branch; no analytic construction duplicated. |
| Current IntegralHeckeAndGaloisDeterminants §§1.3, 3a.1, 4.1 | Read whole-ring law extraction/reconstruction/descent and scaling/duality. Removed the generic norm-twist theorem; specialized arithmetic dictionaries and geometric extraction remain distinct. |
| StableReduction Layer 4 | Read general relative-Proj/Rees blowups. Imported, while Scholl's particular equivariant resolution and boundary argument remain here. |
| SmoothRepsLocalGroups SR5.2 and generic Galois/period suppliers | Generic WD carriers and functor laws stay imported; attached modular comparison retains N and exact type. |

Every internal target prerequisite points backward; automated link checking
found no broken anchor, forward prerequisite or self prerequisite. External
contracts were checked against the current ownership and CaraianiNewton tiers.
AG2.0–AG2.2 are independent earlier-tier inputs; later AG2 comparisons are
consumers. The downward character, ordinary, optimized-weight and compatible
system interfaces remain owned here. There is no FoundationsAndLibraryIntegration
or `UPSTREAM:` prerequisite. Source-side requirements absent from the pinned
libraries are named supplier obligations, rather than assertions of existing
implementations.

## Adversarial mathematics pass

This table covers each of the 71 numbered targets, including the definitions,
API identities and conventions within each section. “Retained” means no new
false instance was found under its stated hypotheses; it does not claim a
formal proof. Source and supplier limitations above still apply.

| Statement(s) | Instances and counterexamples tried | Result/change |
| --- | --- | --- |
| Conventions: Frobenius, dual, determinant, twist | Roots 2,3 give dual trace 5/6, determinant 1/6; 11a1 at 3 gives X²+X+3; nonquadratic ψ distinguishes ψ⁻¹. | Inversion/twist and determinant agree. |
| Conventions: labelled degrees and WD direction | `(k,w)=(2,0),(12,10),(2,2)` give `(0,1),(0,11),(1,2)`; wrong parity `(2,1)` gives wrong sum. F=diag(1,3), N=E₁₂ gives FNF⁻¹=N/3. | Parity required; N≠0 survives Frobenius semisimplification. |
| §1.1 Eichler–Shimura/operator identity | Multiply `(1−FX)(1−I*VX)` using FV=p^{r+1}; r=0 and p=2. Ordinary μ_p/Z/p versus supersingular and away-p p+1 fibres. | Diamond factor and fibre domains retained. |
| §1.2 parabolic realizations | Boundary classes in open cohomology; empty cuspidal factor; ψ of order three in conjugate-form pairing. | Boundary kernel, Tate twist and ψ⁻¹ correction retained. |
| §1.3 Scholl projector/resolution | r=0; sign idempotent without inverting its group order; open boundary contribution. | Actual equivariant compactification and rational projector required. |
| §1.4 orbit factor/descent | Two conjugate eigenforms; oldspace repeated roots; changing a period generator by a coefficient unit. | Orbit idempotent in new quotient, genuine coefficient action and fixed lattice retained. |
| §1.5 rank-two realization | 11a1 and Δ; k=1; reducible ordinary local restriction. | k≥2 range retained; corrected irreducibility reference to §4.8. |
| §1.6 integral structures | ℓ divides Nk!; arbitrary homothety of lattice; ramified coefficient DVR. | Integral localization and chosen lattice required. |
| §1.7 higher-weight existence | k=2, k=12; bad prime; k=1. | Good-prime and k≥2 hypotheses retained. |
| §2.1 Rankin estimate | k=1; complex conjugate coefficients; boundary s=k versus s>k. | Convergence and pole statements remain separate. |
| §2.2 sparse eigenvalues | All embeddings bounded versus only one; nonintegral bounded numbers; exceptional prime set. | Integrality and every embedding required for finiteness. |
| §2.3 residual eigensystems | Eisenstein residual decomposition and a characteristic-two scalar pair with equal traces. | Full polynomial recognition and semisimplification retained. |
| §2.4 Condition C and its APIs | Trivial group with M=1/0; cyclic diag(2,1) over F₅ has four polynomials; deleting one gives η=1/4,M=3; index two doubles η. | Subset need not be subgroup; relative index is correct. |
| §2.5 semisimple subgroup bound/fibres | Exhaustive GL₂ enumeration over F₂,F₃,F₅; nonzero determinant and 0/1/2 distinct roots; growing cyclic unipotent groups. | Fibre counts q²+q,q²,q²−q correct; semisimplicity essential. |
| §2.6 uniform splitting-prime bound | η<0; η=1/2; infinitely many varying residue primes. | η<1/2 and common M retained; coefficient splitting does not bound arbitrary images. |
| §2.7 prime-to-characteristic lifting | Trivial group, n=0, mixed/equal characteristic complete DVR; residue-characteristic-order unipotent group. | Complete DVR, finite residue and prime-to-order hypotheses retained. |
| §2.8 characteristic-zero lift | Finite bounded-order residual images with small primes excluded; one chosen residual prime versus all good Frobenius. | Prime-to-order lift and recognition inputs retained. |
| §2.9 weight-one irreducibility | Eisenstein character sum; complex conjugation at 2; cuspidal versus noncuspidal form. | Cuspidality and L-function argument retained; oddness is characteristic-zero. |
| §2.10 weight-one Artin theorem | Dihedral finite image, zero trace, good/bad primes, k=1 versus regular k≥2. | Finite-image route and all-good-prime polynomial retained. |
| §3.1 quaternionic multiplicity | d odd/even; no finite discrete-series place; multiplicity greater than one before extraction. | Geometric construction's even-degree hypothesis retained; not unrestricted constructor. |
| §3.2 twisting/determinant | Nonquadratic central character; dual without cyclotomic twist; geometric q=3. | Exact determinant removes quadratic ambiguity. |
| §3.3 vanishing-cycle filtration | Weight-two component H² before/after cuspidal localization; nontrivial higher-weight coefficient sheaf. | Exception and normalization-kernel monodromy direction retained. |
| §3.4 special components | N=0 with identical Frobenius polynomial; nonzero rank-one nilpotent N. | Special monodromy cannot be dropped. |
| §3.5 local fundamental representation | p=2; inertia-only data versus full local extension; Frobenius inverse. | Full source parameter and normalization retained. |
| §3.6 ordinary cuspidal local components | Dihedral quadratic induction versus p-ordinary reducibility; chosen split auxiliary place. | Local induction/globalization hypotheses retained. |
| §3.7 Carayol B | Auxiliary place v₀ and extraordinary dyadic component. | Both intermediate exclusions remain explicit. |
| §3.8 primitive restriction | A₄/S₄ versus nonsolvable A₅; normal/non-normal cubic extension; same restriction with missing determinant. | Solvable local image and determinant recognition retained. |
| §3.9 extraordinary cubic step | Cyclic extension versus non-normal S₄ cubic; almost-all Satake agreement versus chosen local parameter. | Separate stronger cubic supplier required. |
| §3.10 unrestricted Hilbert constructor | d even, principal series at every finite place; coefficient-field extension. | No geometric discrete-series restriction transferred to this constructor. |
| §3.11 representation dictionary | Nonquadratic s; q=3 dual roots; norm twist changes determinant by q²; arithmetic versus geometric Frobenius. | Specialized formulas retained; generic scaling removed to existing owner. |
| §3.12 Hodge–Tate property | Elliptic/Δ degrees; unequal labelled kτ; wrong parity; ramified F_v. | Exact labelled and parity conditions retained. |
| §3.13 rank-one converse and avatars | Totally real versus CM field; finite ray-class representatives with algebraic powers; quotient character on K× not automatically trivial. | Global algebraic-value and coefficient-field steps retained. |
| §3.14 oddness/irreducibility/uniqueness | Real complex conjugation det −1; locally ordinary reducible but globally irreducible; residual reducibility. | Three irreducibility notions remain distinct. |
| §3.15 CM predicate/APIs | Regular quadratic induction, conjugate character equal/unequal, reducible induction and finite-image weight one. | Proper quadratic extension and distinct regular characters required. |
| §3.16 virtual reducibility iff CM | Open abelian subgroup, finite projective image, regular infinity type. | Regular Hilbert scope retained; no arbitrary induction irreducibility. |
| §3.17 Carayol A | Even d without finite discrete series; extraordinary and auxiliary places after comparison. | Existence restriction remains; local exclusions discharged only by later comparison. |
| §4.1 geometric purity | Steinberg N≠0, old geometric range, k=1 finite Artin system. | Independent weight input and geometric hypotheses retained. |
| §4.2 Ramanujan | CM and non-CM, nonparallel regular weight, everywhere principal series. | Separate all-Hilbert route retained. |
| §4.3 local normalization | Special parameter with F=diag(1,3), geometric reciprocity, π dual. | Half-norm twist, conductor and L-factor direction consistent. |
| §4.4 all-Hilbert away-λ compatibility | Even d without discrete series; bad finite place with nonzero N; place over λ. | λ-place excluded here and supplied separately. |
| §4.5 geometric coefficient-prime | Good/nonordinary and semistable primes; ramified base; geometric range absent. | Geometric scope and independent comparisons retained. |
| §4.6 Kisin at λ | Reducible residual representation; nonparallel weights; dual numbers versus field points. | Residual absolute irreducibility is required only on this route. |
| §4.7 Skinner at λ | Remaining parallel-weight-two case; quadratic ambiguity after Sym²; Sen factorization without dense factorizing algebras. | Full continuation contract strengthened; φ^{f_v} retained. |
| §4.8 classical irreducibility | Ordinary reducible local restriction and reducible reduction; distinct k−1 versus weight-one zero gap. | Global characteristic-zero k≥2 assertion retained. |
| §4.9 KW local forms | p ramified in F; nonparallel weight; special N versus unramified crystalline case. | Source's unramified/parallel/residual scope retained. |
| §4.10 finite-weight packet/APIs | Parallel κ=2; supersingular roots; nonparallel `(2,4)`; ramified finite twist. | Quotient identification now conditional; finite untwisting scoped to parallel case. |
| §4.11 nearly ordinary construction | Odd p, even d, parallel κ; κ=2 unit action; geometric ρ versus arithmetic dual. | Parallel source theorem and exact twist retained. |
| §4.12 nearly ordinary away-p | Nontrivial inducing character; p-place; inverse reciprocity. | Same §4.11 scope and representation retained. |
| §4.13 HK/de Rham multiplicity | Supercuspidal M versus principal series; weight-two distinguished real place; locally versus globally trivial central character. | Tower/type/central-character and completion hypotheses retained. |
| §5.1 ordinary line/lattice/APIs | 11a1 at 3 and nonordinary 2; T=0, field O, ramified DVR, k[[ϖ]]; Oe₁ versus ϖOe₁; unequal Hilbert weights. | Lattice algebra valid; general-weight character comparison marked as remaining gap. |
| §5.2 crystalline/Wach/APIs | Good supersingular 11a1 at 2; k beyond Fontaine–Laffaille; repeated Euler roots; semilinear basis change. | Integral N(T)/π versus rational D_cris and root nonvanishing requirements retained. |
| §5.3 ordinary CM splitting | Inert prime, split prime with incompatible CM type, coinciding local characters. | Regularity and ordinary-CM-type criterion retained. |
| §5.4 conjugation moves CM line | Global conjugation swaps distinct induced lines; equal characters and arbitrarily chosen line. | Distinct-character and k>1 hypotheses retained. |
| §5.5 endpoint weight | k=p+1 at p=2/3; crystalline characteristic-zero representation with weights 0,p. | Small integral range and weight-two lift conclusions remain separate. |
| §6.1 Tate-module decomposition | Weight two, nonquadratic diamond character, pairing adjoint action. | Coefficient factor and dual conventions retained. |
| §6.2 residual newform/APIs | Different stable lattices; reducible reduction; scalar traces in F₄. | Independence only after semisimplification; full polynomials required. |
| §6.3 full Hecke algebra/APIs | Level-88 oldspace algebra Q[X]/(X²f), z=Xf nonzero with z²=0. | Full algebra need not be reduced; actual nilpotent control retained. |
| §6.4 bad local factors | Steinberg N rank one versus N=0; good-prime p versus bad prime. | Inertia/monodromy Euler factor and conductor retained. |
| §6.5 optimized weight-two/APIs | ℓ=3 quadratic restriction; 11a1 mod 5 reducible versus mod 7; Σ empty/nonempty. | Exact modularity/local restrictions and nonemptiness retained. |
| §6.6 type-Σ Hecke representation | ℓ odd versus 2; allowed Σ at ℓ; bad primes outside Σ; Artinian quotient not product of fields. | Source hypotheses and cofinal reduced-family argument retained. |
| §6.7 reduced localization | Eisenstein versus specified non-Eisenstein maximal ideal; full nonreduced oldspace algebra. | Reduced quotient is specified, not inferred from localization alone. |
| §6.8 geometric determinant/APIs | Characteristic two mixed determinant identity; dual-number determinant 1+ε reducing to 1; nilpotent generic coefficients. | Whole-ring extraction and faithful generic module required. |
| §6.9 law-to-representation | Reducible residual law, scalar trace in char 2, Hausdorff topology and coefficient change. | Absolutely irreducible residual and reconstruction hypotheses retained. |
| §6.10 quaternionic Hecke representation | Residual reducibility and ordinary line varying across family; nilpotent quotient. | Whole-family law/reconstruction required before specialization. |
| §6.11 fixed quaternionic character | Nv≡−1 mod p and split unramified residual restriction; fibrewise characters without projective invariant line. | Excluded sign case and line/descent obligation retained. |
| §6.12 family local conditions | Reduced generic points of O[ε]/ε²; nonflat torsion family; finite eigenform quotient product. | Field-point verification insufficient; exact quotient/functor argument retained. |
| §7.1 systems and operations/APIs | Rank-two direct sum/tensor rank four; restriction kills ramified scalar inertia; inverse ramified twist; changed bad set. | False unconditional almost-strict preservation fixed; new comparisons required. |
| §7.2 full-family purity | Principal series, special nonzero N, CM induction, λ-place. | Ramanujan plus full local comparison; no circular geometric-weight import. |
| §7.3 fixed-eigenform family/APIs | Good polynomials alone versus full local data; d even/everywhere principal series; weight one. | Weak/strict and regular/Artin scopes remain distinct. |
| §7.4 Dimitrov image | CM exception, small primes, nonsplit coefficient field; subgroup SL₂(F_q) versus full GL₂(κ). | Finite exclusions and subfield form retained. |
| §7.5 Ribet–Momose image | Inner twists, quaternion nonsplit primes, determinants constrained by norm. | Constrained open image, not unrestricted GL₂. |
| §7.6 residual ramification/APIs | Fixed squarefree level and q|N; infinitely many residual unramified congruences versus bounded lower levels. | Level-lowering hypotheses and finite exceptional set retained. |
| §7.7 density-one ordinary primes | All λ nonordinary versus some λ ordinary; norm bound at weight two; finite ramified/small coefficient primes. | “Some ordinary λ” differs from “every residual λ”; correct quantifiers retained. |

## Definition tests and Lean signatures

For every definition I checked that its examples fail plausible alternatives:
omitted diamonds, full open cohomology, arbitrary idempotents, trace-only
recognition, a subgroup in place of the large subset, semisimple elements in
place of a semisimple representation, arbitrary induction, an unsaturated
lattice, a reduced full Hecke algebra, and a family specified only at field
points. These are mathematical tests, not inventory assertions.

| Definition section | Number of prose Checks after fixes |
| --- | ---: |
| §1.1 / §1.2 / §1.3 / §1.4 / §1.5 / §1.6 | 4 / 4 / 4 / 5 / 3 / 4 |
| §2.4 | 8 |
| §3.1 / §3.10 / §3.11 / §3.13 / §3.15 | 3 / 6 / 4 / 3 / 5 |
| §4.10 / §5.1 / §5.2 | 4 / 8 / 5 |
| §6.2 / §6.3 / §6.5 / §6.8 | 5 / 4 / 3 / 4 |
| §7.1 / §7.3 / §7.6 | 7 / 4 / 3 |

Ten signature spot-checks, against the exact corresponding README clauses:

| Signature | Hypothesis/generality check |
| --- | --- |
| `arithFrobCharpolyDual` | Arbitrary field coefficient expression; representation interpretation requires k≥1 and nonzero ψp^{k−1}. No division claim at zero. |
| `ConditionC.mono` | Bounds increase; no unwanted nonnegative η premise or subgroup condition. |
| `ConditionC.of_index_two` | H≤G and relative cardinality index two, not ambient GL₂ index. |
| `card_charpoly_fibre` | Prime residue field, nonzero determinant, distinct root counts; verified every fibre over F₂,F₃,F₅ by enumeration. |
| `card_le_of_conditionC` | Semisimple subgroup and η<1/2; one A uniform in ℓ. |
| `exists_lift_of_not_dvd_card` | Complete DVR, finite residue field, finite group of prime-to-residue-characteristic order; arbitrary n including zero. |
| `hodgeDegrees_sum` | Integer weights with even w−k, matching the source's parity. |
| `hodgeDegrees_normTwist` | Adds one to each degree under w↦w+2, including negative integer inputs. |
| `ordinaryLatticePlus_saturated` | Domain/fraction field and scalar tower; torsion-free actual quotient, without a false rank claim for T=0. |
| `ordinaryLatticeQuotient_free_rank_one` | Finite full DVR lattice, ambient dimension two, specified line dimension one; not restricted to Z_p. |

Final Lean file: 325 lines, nine real-bodied definitions, nine named theorem
signatures and eighteen examples. It develops no arithmetic carrier, theory
or construction. Heavy README objects remain there under the amended rule;
they are not replaced by `Prop := sorry`, arbitrary carriers or commented
fake declarations. Source arithmetic hypotheses are not smuggled into the
light algebraic coefficient definitions.

## Validation

- Fresh final `lean-check`: exit 0, twenty warnings, all
  `declaration uses sorry`, no errors or other warnings. The imported pinned
  Landau source matches its exact git object byte-for-byte. Mathlib's shared
  build is at `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti's imported
  source is `f790474821cf4256814db967cb154e7af3d0c369`.
- Read all thirteen accepted baseline declarations at the pins, plus the
  averaging/projector declarations. Their finite-group, integrality, residue,
  coprime-index and convergence hypotheses are retained.
- No language server, lake build/update/cache operation or lake operation in
  the read-only current checkout was run.
- Packet validation: zero errors, zero warnings; input unchanged.
- Sorry-data check: pass. Intake file checks: zero problems. Internal anchors,
  prerequisite ordering and `git diff --check`: pass.
- Only this package's README, Suggested.lean, review.json, this report and the
  authorized review handoff change. No source asset or local path is submitted.

The remaining repair is specified above and in the handoff. Compilation checks
elaboration; it does not certify the proposed theorems or fill the ordinary
character comparison gap.
