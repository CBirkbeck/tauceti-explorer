# Independent package review: K-theory of finite and local fields

Issue #10958; job `REV-PKG-KTheoryFiniteLocalFields~adv`; reviewer Codex,
session `codex-TT20BH`, 19 October 2026. Verdict: **needs_changes**.

The input package was written by another worker in commit `5ba051d04`
(PR #10918). This review starts from atlas commit
`2df2f6217cd26a6ec60fc587ffd7150323440789`. It changes the package in place,
preserving its mathematical scope and existing checks. The packet is unchanged.

## Verdict and remaining work

The compact suggested file satisfies the carrier rule and elaborates. The README
has the required roadmap form, substantial APIs and discriminating examples.
Several mathematical errors and ownership claims are corrected below. Acceptance
still requires actual prerequisite targets for the following contracts; a request
in this package's boundaries is not an export of the requested supplier.

| Remaining defect | Evidence and affected targets | Required repair |
| --- | --- | --- |
| Topological completion and operations | RefinedTraceMethods RT.4:topological states KU, bundles and Bott periodicity. It does not state the finite-group Atiyah–Segal completion theorem, the compact augmentation-kernel tower argument, or continuous prime-to-residue-characteristic completed Adams operations needed by §§1.3–1.7. | Register those exact exports in an earlier foundation or move the necessary foundational targets here with their APIs and checks. Preserve the distinction between an integer change on a finite eigenvalue group and a global profinite change. |
| Eilenberg–Moore | StableHomotopyKTheory H.6, including its current package Layer 7, supplies coefficient products and filtered-spectrum spectral sequences, but not the pullback Eilenberg–Moore theorem used in §1.7. Its reader explicitly records that omission. | Assign the simply connected finite-type theorem, multiplicative Tor comparison and convergence, rather than cite a general exact-couple construction. |
| Absolute logarithmic Witt foundation | CrystallineCohomology §CR.4.6 has a relative Wₙ(A)-linear differential; its characteristic-p and semistable log models do not construct the initial absolute log-Witt complex of an arbitrary prelog ℤ_(p)-algebra. The supplier's reader also records this outstanding request. | Assign the initial object, level-one identification, standard filtration and absolute F,V,d relations before the consumers in §§5.3–5.6. In particular relative linearity cannot be used to kill absolute dV(1). |
| Early Chern and geometric comparison | §1.11 needs an early universal Chern operation and Lang/classifying-group cohomology. MotivicEtaleKTheory M.8 uses M.7, while M.7 uses this package's rigidity layer. M.1 field/scheme cohomology does not give the required group-scheme fibration comparison. | Supply the independent universal-class/Moore-Hurewicz construction with `chern_unit_bott` and `chern_edge_finiteField`, plus the stated Lang edge map and transgression. Separate these from the later local-field comparison so that Layer 1 does not depend on Layer 2 through M.7. |
| Characteristic-p K comparison and approximation | M.5 states Bloch–Gabber–Kato, not the separate Geisser–Levine K-theory result. The Popescu passage for the regular-local comparison in §§5.17,6.11 also lacks the requested general owner. | Register both statements with the exact generality used. A differential-symbol theorem alone does not give the asserted higher K comparison. |
| Space-level splitting | §6.12 cited the homotopy splitting theorem underlying its own conclusion as an input. HM03 Theorem D and the K-book identify the answer, but the intervening space-level splitting argument is not planned. | Decompose that proof or identify an independent earlier export. Equality of homotopy groups is insufficient. The circular prerequisite is now removed and marked as a gap. |
| Dependency order | The required foundational atlas packages are not current upstream roadmaps, and this roadmap is not assigned a tier/bundle in CaraianiNewton. GeometryOfNumbersAndQuadraticArithmetic §6.10 consumes the finite-field K calculation and supplies a hermitian comparison consumed here. | Give an authorized layer order/bundle: finite-field K first, the generic/finite-even hermitian supplier next, then the applications here. Do not restore duplicated hermitian foundations to hide the order issue. |

These are substantive closure defects, not a demand that suggested theorem proofs
be completed. Other explicitly recorded source-proof obligations remain honest
targets, as detailed in the source ledger. This is a completed independent review,
not a checkpoint or an acceptance conditional on unseen source proofs.

## Fixes applied

- Corrected §5.14's coefficient tensor to be over ℤ, with prior reduction modulo
  p^ν. The integral logarithmic Witt complex is not already a ℤ/p^ν-module.
- Corrected §5.10's exact sequence: the degree-two homotopy-orbit group is the
  **cokernel** of the displayed differential map. Its `[dlog π]ₙ` is a class in
  that degree-two quotient. Added length-one, length-two and exact-form checks.
- Restricted §5.5's unique divisibility of higher log-Witt forms to the specified
  complete mixed-characteristic DVR. The trivial-log example 𝔽p[x,y] in length
  one has nonzero p-torsion dx∧dy and disproves the original general assertion.
- Removed §6.6's splitting claim at p=2. In degree two over ℚ₂, the two order-two
  edge terms form ℤ/4, witnessed by the double of the mod-two Bott class and the
  nontrivial Hilbert symbol of {−1,−1}. Odd-prime abstract splitting remains
  separate from a coherent natural splitting at higher coefficients.
- Fixed the finite-field Chern multiplier to
  `(−1)^(i−1)(i−1)!`, and named the early product and edge contracts. The
  𝔽₇/mod-three weight-two example detects the minus sign; the existing
  𝔽₃/mod-two weight-three example detects the factorial obstruction.
- Replaced the claimed supplied Tate-module left-exactness, torsion-freeness and
  bounded-exponent vanishing lemmas by named targets on the **existing** carrier
  in §6.2. Cited the actual finite-rank criterion. Specialized the existing
  StableHomotopyKTheory §7.13 completion extension rather than assigning a second
  general construction here.
- Corrected the hermitian owners to GeometryOfNumbersAndQuadraticArithmetic
  §§6.8a–6.10 and HermitianKTheoryOfPoincareCategories HK.0–1/HK.7. Deleted the
  duplicate finite-even-field homotopy-limit proof from §1.10, retaining the
  arbitrary-perfect-field extension and classical connective comparison. In
  §6.13 the generic square is an application of the supplied square. Corrected
  its references to III Theorem 3.1.1, Proposition 3.1.4 and Remark 3.1.10; the
  previous “Corollary 3.1.8” is a remark, not the dyadic theorem. The ordinary
  étale K-comparison does not imply hermitian homotopy limits.
- Corrected the Witt locator: HM03 (3.1.3) is an equation, not a lemma; the
  relevant lemmas and equation are on pp.45–46. Clarified Hesselholt05's PDF-page
  convention and its correspondence with printed pp.87–103. Corrected the
  K-book torsion reference to pp.233–234.
- Added explicit mod-p basis/module checks at the cutoff r(i), and a zero-ring
  boundary check in both README and Lean. The seven computed tame-coordinate
  examples are proved; they do not rely on `sorry`.
- Marked the missing supplier exports in the boundaries instead of presenting
  requests as existing theorems. No packet target was changed or removed.

## Adversarial mathematics pass

Each row covers the definitions, identities, map directions and hypotheses of
the indicated subsection, including its API. “Retained” means no additional
counterexample was found in this pass; it does not certify the future proofs.
Unavailable-carrier statements were checked as mathematical targets in the
README, not disguised as Lean declarations. Source-proof and supplier limitations
are recorded separately below.

| Statements checked | Instances and computations tried | Result and change |
| --- | --- | --- |
| Conventions: coefficients and completion | m=1 gives zero; connective negative groups vanish; ℂ has completed K₂=ℤₗ although K₂/ℓ^ν=0. | Retained cofiber, quotient, torsion and Tate-module distinctions. No ℤ/m-module assertion for arbitrary coefficient homotopy. |
| Conventions: signs, twists, trace levels | {u,π} and {π,u} over residue 𝔽₅; n=1 versus an adjacent-level map; degree-zero equalizer. | Retained left-linear boundary, arithmetic Frobenius, twisted divisible coefficients and id/F equalizer. id−F is not a ring map. |
| 1.1 Coefficient functors, exactness and products | K₂(ℤ;ℤ/2)=ℤ/4; K₂(𝔽₃;ℤ/2)=ℤ/2; modulus one. Inclusion and reduction for m dividing m′ have different multipliers. | Retained exact Bockstein direction and exceptional Moore moduli. Located actual product suppliers. |
| 1.2 Bott lifts | β₋₁ over ℤ has nonzero double; primitive 2 in 𝔽₅× has order four; no primitive second root in characteristic two. | Retained the restriction on additivity, and root rather than inverse-root Bockstein. |
| 1.3 Brauer characters | Trivial group and p-group give dimension; GL₂(𝔽₃) unipotent gives 2, −I gives −2. | Retained semisimple eigenvalue construction and finite/global embedding distinction. |
| 1.4 Green lift and stabilization | Trivial/p-group virtual characters; rank-two virtual lift; rank increment adds one; quadratic field extension has two Frobenius characters. | Retained the integral virtual lattice and reduced stabilization. Source proof remains explicit. |
| 1.5 Adams fibre | q=1 has even homotopy and is excluded; π₁ at q=4 is ℤ/3; π₃ at q=2,3 is ℤ/3,ℤ/8. | Retained connected fibre and the extra hypothesis for uniqueness of lifts. |
| 1.6 Quillen map | q=2 has trivial determinant but nonzero K₃; q=5 determinant generator; rank-two virtual character. | Retained plus extension and choice independence as targets. Flagged completion/Adams supplier gap. |
| 1.7 Detection and equivalence | q=2 with ℓ=3,7 gives first odd class in degrees 3,5; GL₂(𝔽₂) has nonzero mod-two H₁; q=4,ℓ=3 detects the Bockstein sign. | Retained stability and separate ℓ=2 argument. Simple-space Whitehead cannot be replaced by simply-connected Whitehead. Flagged Eilenberg–Moore. |
| 1.8 Operations and transfers | 𝔽₂⊂𝔽₄ in K₃: res multiplies by 5, tr·res=2, res·tr=1+4; K₀ transfer doubles. | Retained positive-degree restriction on transfer surjectivity and compatible, noncanonical cyclic generators. |
| 1.9 Finite coefficients, algebraic closure, completion | Characteristic-prime positive groups vanish; K₀ completes to ℤₚ; zero ring completes to zero; finite fields retain coefficient even groups. | Retained finite-field product hypotheses and explicit lim¹ control. |
| 1.10 Hermitian comparisons | 𝔽₂ unit form versus hyperbolic form; 𝔽₄ has nonzero odd integral K but trivial positive 2-completion; arbitrary perfect characteristic two uses surjective Frobenius. | Deleted supplied finite-even theorem; retained precisely the perfect-field extension and classical connective variant. |
| 1.11 Symplectic H₃ and Chern map | Rank zero excluded; q=3,9 H₂ need only have odd order; nonsquare 2 in 𝔽₅ works although −1 is square. | Retained actual comparison map and transgression q²−1, not equality of dimensions. Named missing early/geometric exports. |
| 2.1 Henselian rigidity | ℤ₅ modulo four; p-coefficients over ℤₚ retain principal units; unit ideal fails the Jacobson-radical condition. | Retained invertibility and henselian-pair hypotheses. |
| 2.2 Localization and two boundaries | ∂{2,5}=2 and ∂{5,2}=3 in 𝔽₅×; n=0 has isomorphism instead of a shifted positive-degree sequence. | Retained Bockstein anticommutation and integral/coefficient mixed product, including small moduli. |
| 2.3 Integral torsion and canonical splitting | K₁ valuation ℤ survives; finite residue positive even groups vanish; changing π by a unit has zero product in the uniquely prime-to-p divisible even group. | Retained i≥2 restriction on odd localization isomorphism and π independence only for the integral even section. |
| 2.4 Coefficient algebra and section changes | π=5→10 adds nonzero [2] modulo four; integral even sections agree; residue 𝔽₂ kills the finite tame summands. | Retained four elements over the polynomial Bott base and two over the full residue K-ring; excluded small generic Moore moduli. |
| 2.5 Prime-to-p groups and e-invariant | K₁ completion has an extra ℤℓ valuation factor; i=0 gives infinite invariants; negative i uses q an ℓ-adic unit. | Retained separate integral, finite-coefficient and completed statements with their degree ranges. |
| 3.1 Full norm residue | Compatible exponents of roots; finite roots versus their abstract cyclic description; characteristic-p roots have no p-part. | Retained full-root target and the independent degree-two norm-residue input. |
| 3.2 Tame coordinate and reciprocity | Over 𝔽₅: (r,s,u,v)=(0,1,2,1),(1,0,1,2),(1,1,1,1),(−1,1,2,3) give 2,3,4,4; change of uniformizer preserves the value. Over 𝔽₂ and the zero ring the result is 1. | All three Lean theorem signatures remain general over a commutative ring. Added the zero-ring witness. The actual DVR boundary comparison remains a separate target. |
| 3.3 Norm-residue kernel | Uniformizer/unit pairs and principal units distinguish tame and wild symbols; a finite quotient alone does not imply unique divisibility of its kernel. | Retained surjectivity and each divisibility input separately. |
| 3.4 All-prime divisibility | Mixed characteristic p-torsion-freeness is independent of p-divisibility; in equal characteristic Ω² vanishes for the one-variable local field. | Retained explicit Merkurjev and characteristic-p torsion proof obligations; no circular use of the K-book's later Hilbert-90 corollary. |
| 3.5 Moore structure and integer ring | Roots of unity versus residue roots at p; residue 𝔽₂; tame ∂ versus its inverse symbol convention. | Retained the full local-field statement and restricted prime-to-p integer-ring torsion claim, consistent with the K-book erratum. |
| 4.1 Linear THH model | Integral and rationalized categories over ℤₚ have different mod-p π₀; zero category and identity functor. | Retained the linear Waldhausen input. Ordinary stable THH(K) cannot replace the logarithmic object. |
| 4.2 TR, TC, R/F/V | n=1 has no lower fixed-point level; finite-field TCⁿ has π₀=ℤ/pⁿ and π₋₁=ℤ/pⁿ⁻¹. | Retained fixed-point indexing, transition maps and ring equalizer convention. |
| 4.3 Circle operator and splitting | Odd p versus p=2; ηd may vanish although η does not; coefficient Bockstein versus Connes d. | Retained d²=ηd in its scope, without inventing a nonzero-square example. |
| 4.4 Norm and modern comparison | Trivial spectrum and first fixed-point level; bounded-below hypotheses retained for the comparison. | Retained norm fibre sequence and genuine/modern distinction. |
| 4.5 Tate cochains and filtration | C₃ on 𝔽₃ has one copy in each degree; C₅ on ℤ has Ĥ⁰=ℤ/5, Ĥ⁻¹=0; trivial group vanishes. Hℤ Tate π₀ differs from homotopy fixed points. | Retained algebraic comparison, ∂(ut⁻¹)=−1, ẼG factor and conditional convergence. THH(𝔽p)'s d²ε=tσ tests the circle differential. |
| 4.6 Additivity/fibration | Zero term and split two-term sequences; localization must preserve the chosen weak equivalences. | Retained linear-model-specific targets rather than infer them from stable THH additivity. |
| 4.7 Resolution/torsion complexes | Projective complexes and residue torsion complexes over a DVR; comparison with the z-model, not arbitrary localization. | Retained the specialized dévissage proof obligation. |
| 4.8 Logarithmic spectra and square | π₀ of log THH(ℤₚ|ℚₚ) is ℤₚ; fraction-field THH has zero mod-p groups; residue/ordinary/log terms differ. | Retained the localization square with the linear comparisons as prerequisites. |
| 5.1 Perfect fields and prime-field model | ũv=p; can in degree 2 has image pℤₚ and φ is onto, with reversed ranges in degree −2; algebraically closed residue kills the Artin–Schreier–Witt cokernel. | Retained negative TC degree, both comparison ranges and control of R-limits. Allows p=2 where stated. |
| 5.2 Coefficient rings and ramification | ℤₚ has e=1,θ=−1; ℤₚ[ζₚ] uses π=ζₚ−1 and e=p−1; length zero/one differ. | Retained general perfect residue as a separate Cohen/Witt proof target. Fixed equation-versus-lemma locator. |
| 5.3 Residue map and modified V | Length one gives k→A/p; raw Teichmüller fails additivity in length two over ℤ₃; θ=−1 gives Vπ=−V. | Retained p-th-power residue map, Frobenius twist, unit factors and ne basis count. |
| 5.4 Log differentials | res(dlog π)=1, res(du)=0; tame annihilator equals pA; πᵖ=p gives a strictly smaller ideal. | Retained absolute coefficient-differential part and distinct log/ordinary base-change criteria. |
| 5.5 Twisted derivation and hW | n=1 recovers ω; derivative on [x]² for p=3 is 2x⁵dx; 𝔽p[x,y] gives nondivisible Ω². | Restricted unique divisibility to canonical-log mixed DVRs; retained the general prelog derivation/hW construction. |
| 5.6 Mod-p log-Witt basis/action | n=1 dimensions e,e,0; p=3,e=1 gives r(0)=1; s=1,t=1,i=j=0 product is zero; s=t=0 gives jπ^(i+j)dlog π. | Added cutoff and product checks; retained unit coefficient at r(i), agreement of overlapping product cases and delayed linear independence. |
| 5.7 Log trace maps | Nonzero nonunit π is a q-weak-equivalence, not an A-module automorphism; ∂dlog π=1. | Retained domain M, unit agreement and odd-p/level-one differential-graded restrictions. |
| 5.8 Ordinary DVR THH | Unramified versus ramified derivative φ′; n=1 and p-completion distinguish ordinary torsion from log degree one. | Retained explicit Lindenstrauss–Madsen proof obligation and scope. |
| 5.9 κ and log THH | Over ℤ₃, βκ=dlog(−3) fixes the sign; rational and mod-p groups differ; uniquely divisible degree two has zero reduction. | Retained normalization and the separate p-completed Bockstein argument. |
| 5.10 Low-degree orbit groups | n=1 cokernel vanishes; n=2 Frobenius target vanishes; dπ=πdlog π dies in the quotient. | Fixed image/cokernel reversal and degree of `[dlog π]ₙ`; added three checks. |
| 5.11 Ramified coordinates and Bott | p=3 cyclotomic unit has u_K≡1−π modulo three; Eisenstein root equation is exact over W(k), not merely modulo p; α exponent is integral when roots exist. | Retained the exact polynomial equation and normalized α. No weakening to a congruence. |
| 5.12 Infinite cycles/comparison | Ordinary-to-log map; dlog π permanence; representatives can become zero. Bounded-below geometric fixed points and mod-p versus completed ranges tested. | Retained explicit comparison hypotheses and no inference of nonvanishing from permanence. |
| 5.13 Tate differentials/bases | n=1, χ=0 and χ=∞ endpoints; B₁=p; first length R₁=2p+1; nonnegative/negative χ differ. | Retained separate differential ranges, exponent bounds and survivor conditions. No division by a vanishing valuation argument. |
| 5.14 Bott/pro-Witt | ν=1 and degree-zero comparison; integral W(A) cannot tensor over ℤ/p; Bott exponent carry preserves χ. | Fixed tensor base; retained pro-isomorphism rather than a levelwise equivalence and the dimension proof's order. |
| 5.15 TC and local trace | Degree zero not generally an isomorphism; p=2 excluded from odd-prime computation; infinite perfect residue requires its own Brauer/cd argument. | Retained exact H²/H⁰ sequence and explicit Artin–Schreier/residue targets for the larger scope. |
| 5.16 Monoid/truncated polynomial THH | Zero weight, weight not divisible by truncation exponent, and divisible weight have different circle/representation terms. | Retained representation-sphere shifts and cyclic-polytope input; no collapse to dimension counting. |
| 5.17 Twisted TR/nilpotent K | First Witt length, zero representation and relative even-degree vanishing; p∣m versus p∤m changes V/e′. | Retained weightwise products, transition maps and relative exact sequence; identified missing approximation/comparison exports. |
| 6.1 Maximal divisible subgroup | Div(ℚ)=ℚ, Div(ℤ)=0, finite groups have zero Div, Div(ℚ×ℤ/6)=ℚ×0; ℤₚ/ℤ_(p) is divisible though ℤₚ is reduced. | Retained actual-subgroup supremum, reduced quotient, noncanonical complement, finite products and functorial inclusion. No arbitrary subgroup or quotient preservation. |
| 6.2 Completion extension/Tate module | Tₚℤ=0; Tₚ(ℚₚ/ℤₚ)=ℤₚ; bounded exponent gives zero; two Prüfer factors have rank two. | Cited existing carrier/criterion and general spectral extension; assigned the missing elementary API lemmas here. Retained explicit lim¹ hypotheses and intersection kernel. |
| 6.3 Cyclotomic invariants | i=0 has infinite invariants; p=2 uses sign and principal-unit parts; finite cyclotomic extensions change the p-power root count. | Retained w_i formulas with nonzero twist, and supplied local cyclotomic image rather than a second image theorem. |
| 6.4 Three Galois coefficient systems | ℤₚ,ℚₚ,ℚₚ/ℤₚ have different H⁰/H¹; twist zero and twist one have exceptional free/invariant terms. | Retained continuous-cohomology limits, local duality and finite-degree Euler characteristic in their finite-local-field scope. |
| 6.5 Residue-characteristic coefficients | Finite p-adic valuation ring versus fraction field; degree one valuation class; residue positive p-coefficients vanish. | Retained finite coefficients distinct from the integral divisible answer. |
| 6.6 Edge/Chern comparison | i=1 Kummer; i=2 over 𝔽₇ modulo three detects −1; i=3 over 𝔽₃ modulo two kills 2!; ℚ₂ has nonsplit K₂ mod two. | Fixed sign and dyadic splitting, stated named early contracts and marked dependency cycle. |
| 6.7 Completed groups | ℚ₂,ℚ₃, unramified quadratic field and ℚ₅(ζ₅); valuation-ring K₁ has one fewer free generator. | Retained special two-primary root counts, degree-one exception and higher even torsion. |
| 6.8 Integral groups/lattices | ℚ₂ K₃ modulo two has three order-two summands; twist-one/degree-one exceptions; a ℤ_(p)-lattice need not split off from its ℤₚ completion. | Retained maximal divisible versus reduced factors and separate lattice assertions. The nonsplit K₂ example does not contradict the K₃ count. |
| 6.9 Completion maps | ℤ_(p)→ℤₚ is dense but not onto; quotient is a rational vector space, not a chosen complement; prime-to-p finite pieces disappear. | Retained kernel/image/cokernel separately and no canonical integral reconstruction. |
| 6.10 Cardinality and Milnor summand | Binary series inject into Laurent series; finite-rank transcendence would give the wrong cardinal bound; positive-degree equal-characteristic completion can vanish despite uncountable integral groups. | Retained actual transcendence/cardinal hypotheses and separate Milnor comparison; missing characteristic-p supplier recorded. |
| 6.11 Equal-characteristic comparison | 𝔽₃((t)) retains order-two K₂ quotient; characteristic-prime completed higher answer differs from the prime-to-p cyclic quotient. | Retained integral divisibility and regular-local comparison separately; flagged Geisser–Levine and Popescu contracts. |
| 6.12 Odd-prime homotopy type | d=1 removes U^(d−1); virtual rank gives π₀=ℤₚ; ℤ₂× is not procyclic; SU removes degree-one contribution. | Retained p odd and space-versus-group distinction; removed self-referential splitting prerequisite and marked missing proof decomposition. |
| 6.13 Dyadic hermitian application | V=ℤ₂ has residue characteristic two; shifted residue coefficient line; L and V differ before completion; integral K(V) is not derived 2-complete. | Corrected source/owner and applied the supplied square. Bounded Witt exponent proves L-completeness, not K-completeness. |
| 7.1 Arithmetic maps | Degree-one units and valuation under F→F_v; finite products of local targets. | Retained actual maps and different coefficient/completion carriers. |
| 7.2 Restriction/transfer | Identity extension; split and nonsplit places; ramification/residue degrees enter different boundary formulas. | Retained tensor-product decomposition over all w∣v and projection formulas. |
| 7.3 Hilbert symbols after completion | Tame residue 𝔽₂, wild roots, and {u,π}/{π,u} sign witness. | Retained full-root norm residue and its completion compatibility, not a prime-to-p-only replacement. |
| 7.4 Étale operations/unramified classes | Place away from coefficient prime versus place over it; unit Kummer classes versus uniformizer. | Retained unramified inflation only in its stated scope and Chern/edge distinction. |
| 7.5 Trace square | Ordinary TC(O_v) maps to log TC(O_v∣F_v); TC(F_v) is a different target; degree zero and p=2 excluded from the local isomorphism. | Retained specified homotopy and degree/coefficient restrictions. |
| 7.6 Semilocal maps | Multiple places above p, identity extension and degree-one valuation factors; no implicit interchange of infinite limits/products. | Retained finite semilocal product, naturality and completion distinctions. |

## Sources opened and locator checks

Sources were read from public author/versioned PDFs. No restricted book was used.
The versions and links are in the package References. This report records checks
of the package's claims and prerequisites, not source excerpts or chapter summaries.
An accessible secondary statement does not establish that an omitted primary proof
has been read.

The packet has **39** source-gap entries; the package handoff's shorter inventory
does not replace that list. The following ledger follows their order. Each cited
secondary statement or replacement was opened; where the requested original was
not obtained, that limitation remains explicit.

| Gap | Passage checked | Outcome for this package |
| ---: | --- | --- |
| 1 | K-book IV.1.12 p.269; Mestel §9 p.30 | Stable mod-p vanishing is stated, not proved there. Quillen §11 was not read; §1.7 retains that substantive target. |
| 2 | Mestel §§7–9 pp.17–30 and its prime-two exclusion | Separate two-primary detection/product argument remains necessary; no odd-prime proof is asserted to cover it. |
| 3 | Mestel Lemmas 32–34/Theorem 35 pp.27–29 | Detection is not a consequence of the GL order formula. Original omitted detection proofs remain open. |
| 4 | Haine Theorem 5.8 p.9; Mestel Theorem 14 p.11 | Green's statement confirmed. InductionRestriction L6 supplies the integral characterization, while the required restrictions are §1.4 targets. Green's original proof was not read. |
| 5 | Atiyah–Segal Theorem 2.1 pp.3–4 and Proposition 4.2 p.10; Haine Lemma 6.10 p.10 | Source statements confirmed; requested RT completion/tower exports absent. Explicit gap added. |
| 6 | Mestel Theorems 19–20 pp.15–16 | Simply connected finite-type Eilenberg–Moore input confirmed; H.6 does not supply it. Explicit gap added. |
| 7 | K-book IV.2.8/Scholium 2.8.1 pp.281–282 | Exceptional moduli and finite-even-vanishing hypothesis retained. Actual supplier is StableHomotopyKTheory package §§7.31,7.33; original Browder/Araki–Toda proofs not read. |
| 8 | K-book IV.5.7–5.9 pp.315–316 | Universality and operation statements confirmed; SchemeKTheoryOperations S6 is the requested owner, not a new proof certified here. |
| 9 | Mestel Lemma 21 and Definition 24 through Theorem 35 pp.18–29 | Bockstein-normalized generator and detection route retained; no claim of checking omitted original proofs. |
| 10 | CMM Theorem 1.4 p.3, Corollary 4.36/Remark 4.37 pp.36–37 | Henselian/invertible hypotheses confirmed. Rigidity remains §2.1's theorem target; Gabber's original proof not obtained. |
| 11 | K-book III.6.2.4 pp.233–234 | Mixed-characteristic p-torsion-freeness still needs the explicit Merkurjev proof target in §3.4. No original proof read. |
| 12 | K-book III.6.6–6.7 pp.238–240 and its later characteristic-p Hilbert-90 route | Later route uses the torsion theorem it would need to establish. §3.4 retains an independent proof obligation, not circular closure. |
| 13 | K-book VI.7.3 p.509; degree-two norm residue and local-duality contracts | The proposed prime-by-prime divisibility route does not assume Moore's answer. It still requires the independent norm-residue and torsion inputs. Moore's original proof was not read. |
| 14 | HM03 §1.2 pp.12–15 | Linear cyclotomic construction and ordinary spectral-category comparison are distinct. §4.1 retains the comparison construction. |
| 15 | HM03 §§1.3–1.5 pp.16–28 | Linear additivity, approximation and fibration references checked; their cited primary proofs were not all obtained. Specialized targets remain §§4.6–4.7. |
| 16 | HM03 Proposition 1.5.1 and Theorem 1.5.6 pp.24–28 | Torsion dévissage is for the linear model. No substitution by stable THH(Perf_tors) is allowed. |
| 17 | HM03 Proposition 3.2.2/Addendum 3.2.3 p.49; HM04 Theorem D pp.1–3 | HM04's written theorem is nonlogarithmic. The universal prelog extension is not supplied by CR's relative complex. Explicit foundation gap added. |
| 18 | HM03 Proposition 2.3.4 pp.38–40 | Ordinary DVR THH formula checked as quoted there; Lindenstrauss–Madsen original proof not obtained. §5.8 remains a proof target. |
| 19 | HM03 Remark 2.4.2 p.43 | Statement is a sketch-level input. §5.9 retains the required Bockstein argument rather than treating the remark as a completed proof. |
| 20 | Nikolaus–Scholze Corollary II.4.9 and HM03 Addendum 5.4.4 | Replacement requires bounded-below geometric fixed points and conversion between completed and mod-p ranges, retained explicitly in §5.12. Original Tsalidis proof not read. |
| 21 | HM03 Lemma 5.2.1 p.75; HM97a operator statements; HM97b Theorem B p.75 | Exact unit equation and representation-sphere input checked. Not every earlier continuity/Noetherian proof invoked by HM03 was reconstructed. |
| 22 | HM97a Theorems C–D p.ii, §5 and Appendix B | Perfect-field and continuity inputs are actual separate targets. No finite-level/pro-limit interchange without its lim¹ check. |
| 23 | HM03 Theorem 6.1.6 pp.101–102 | Perfect infinite residue requires Brauer p-torsion/residue/Artin–Schreier work, explicitly assigned in §5.15; finite local duality alone does not cover it. |
| 24 | Hesselholt05 Theorem 11 PDFp.30; GH06 Theorem 3.1 p.19 | Twisted-TR/regular-local statements located. Their full primary proof chains are not certified by this review. |
| 25 | HM03 Theorem D p.6; K-book VI.7.9 p.511; Handbook Theorem 67 p.167 | Space-level answer located. Missing splitting proof decomposition marked in §6.12; not inferred from group tables. |
| 26 | HM03 proof of Theorem 6.1.10 pp.103–104 | Larger perfect-residue cohomological-dimension input is separate from finite-local-field duality. Its construction is a §5.15 target. |
| 27 | HM03 Theorem A p.2 and §6.1; K-book IV.2.5 pp.280–281 | Odd-prime abstract splitting separated from natural splitting at higher coefficients. Removed false dyadic splitting and supplied ℚ₂ negative control. |
| 28 | K-book VI.4.7; CMM Theorem 4.29 p.33; GH06 Theorem 3.1 p.19 | Characteristic-p K result is not merely Bloch–Gabber–Kato. M.5 lacks the exact export; marked gap. |
| 29 | AV Lemma 2.7.1 and equation (2.10) pp.16–17, in v1 and October 2026 author revision | Required group-scheme edge comparison and transgression are specified; no supplier presently states them. |
| 30 | Calmès et al. II Corollary 4.4.13 p.107; registered hermitian/GN roadmaps | “Unregistered supplier” is stale: HK exists, while GN owns the concrete square and finite-even result. Corrected owners and removed duplication. |
| 31 | Calmès et al. III Theorem 3.1.1 p.49 and Theorem 3.1.3/Proposition 3.1.4 pp.50–51 | Distinguish finite-vcd₂ completion, classical connective covers and full even-field spectra. BKSØ/Friedlander originals not read; consume assigned supplier. |
| 32 | III Remark 3.1.6 pp.51–52; K-book IV.5 operations | Perfect characteristic-two extension uses Hiller's unique divisibility, not finite cardinality. Primary Hiller proof not read. |
| 33 | III Remarks 3.1.9–3.1.10 pp.52–53 | Bounded Witt exponent and L-completeness, not integral K-completeness. Restricted Lam book was not used; source remains the public paper's argument and assigned quadratic supplier. |
| 34 | AV proof of Lemma 2.7.1 pp.16–17 | q=3,9 exceptions require odd H₂, not zero. Original Schur-multiplier computations were not read; exact target retained. |
| 35 | WeibelChern §§2.1–2.8 pp.8–12, Theorems 3.2–3.3 pp.13–15, Proposition 5.1 p.24 | Fixed factorial sign and product normalization. Missing independent early universal construction/cycle remains explicit. |
| 36 | HM03 equation (2.2.1) p.33; Sharifi §§6.3–6.4 pp.130–133 | Finite-residue coefficient-field construction is not the arbitrary perfect-residue Cohen theorem. §5.2 retains the general target. |
| 37 | Atiyah–Segal completion; Haine Construction 6.11 p.11 | Integer finite-eigenvalue changes and global profinite changes distinguished. Continuous completed Adams export remains missing. |
| 38 | HM03 Connes-operator discussion p.9 | d²=ηd does not exhibit ηd≠0. Input package had already removed the unsupported witness; no invented example added. |
| 39 | GH06 Theorem 3.1 p.19 and its approximation input | Popescu regular-to-smooth passage is an independent missing foundation; explicit characteristic-p gap records it. |

### Random sample of 15 additional locator entries

Used Python `random.Random(10958).sample(entries, 15)` on 36 candidate locator
entries outside the author-flagged proof statements. These are additional
statement/definition locators, not a claim that the surrounding arguments have
no other source gaps. All 15 selected passages were opened and read. Correct
pages are recorded below; page guesses in the sampling ledger were not used as
evidence. The candidate population comprised HM03 2.2.3, 2.4.1, 2.4.3,
3.1.1–3, 3.1.5, 3.2.1, 3.2.6, 3.3.3, 3.3.5, 3.3.10, 4.2.1, 5.2.3,
5.4.3, 5.5.3, 6.1.4, 6.1.6, 6.1.10, A.1.4, A.1.7; CMM 1.4, 4.29,
4.36, 6.5; Haine 3.1, 5.7, 5.8; Hesselholt05 7–11,13; GH06 2.8,3.1;
and WeibelChern 5.1. Here “3.1.1–3” denotes the two sampled-list candidates
3.1.1 and 3.1.3, not an additional 3.1.2 entry.

| Draw | Source and actual locator | Check and outcome |
| ---: | --- | --- |
| 1 | HM03 Proposition 5.2.3 p.76 | α multiplication and dα=eαdlog π; normalization retained. |
| 2 | Hesselholt05 Theorem 13 PDFp.33, printed p.103 | Relative K/de Rham–Witt exact sequence, including degree shift and regular Noetherian characteristic-p hypotheses. |
| 3 | HM03 Lemma 3.3.5 p.53 | Surjective F and the p^(n−2) quotient-class generator; checked n=2 endpoint. |
| 4 | Hesselholt05 Proposition 8 PDFp.24, printed p.94 | Product over weights and R/e′V transition, not direct sum. |
| 5 | HM03 Lemma 3.3.10 p.58 | The relevant obstruction is a sum in the 3×3 square; terminal square has the minus sign. |
| 6 | CMM Theorem 4.29 p.33 | Ind-smooth 𝔽p hypothesis and logarithmic comparison at the stated sheaf/local level. |
| 7 | Hesselholt05 Lemma 9 PDFp.26, printed p.96 | Vᵐ and dVᵐ summands, prime-to-p weight and representation indexing. |
| 8 | HM03 Theorem 2.4.1 pp.41–43 | Log THH mod-p normalization and degree two; README already had p.41 rather than the sample-list p.40 guess. |
| 9 | Haine Definition 5.7 p.9 | Brauer character is defined on all elements via lifted eigenvalues, including p-elements. |
| 10 | HM03 Lemma 3.3.3 pp.51–52 | Cokernel description; corrected §5.10 rather than call its kernel the orbit group. |
| 11 | HM03 Proposition A.1.4 pp.106–107 | Stated convergence hypotheses checked; no unconditional strong convergence inserted. |
| 12 | HM03 Lemma 3.1.1 p.45, adjacent Lemma 3.1.2/equation (3.1.3) pp.45–46 | Fixed the package's nonexistent “Lemma 3.1.3” grouping and page range. |
| 13 | HM03 Lemma 5.5.3 p.88 | Tate survivor exponent inequalities and zero/∞ χ endpoints retained. |
| 14 | HM03 Theorem 6.1.6 pp.101–102 | Odd-p mod-p TC/Galois splitting; higher ν/naturality and p=2 are separate issues. |
| 15 | CMM Theorem 6.5 p.52 | Henselian p-ideal, finite Krull dimension and residue p-dimension bound d≥1; comparison range ≥d. |

## Libraries, current roadmaps and Lean signatures

Read the actual statements of the packet's 102 baseline references at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. These include finite-field
norms/Frobenius, Witt operators, local-field/residue/completion maps, dimension
K₀, representations and virtual characters, algebraic Tate cohomology,
differentials, cardinal estimates and power-series embeddings. None supplies
higher algebraic K, absolute log-Witt or THH/TR/TC carriers. Existing dimension
K₀ and ordinary algebraic Tate cohomology remain boundaries, not new targets.

Checked current TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Searches used the
mathematical objects and operators, including Brauer lift, Quillen fibre,
Poincaré GW/L, Tate module, divisible subgroup, log differential, Witt/TR/TC,
cyclotomic character, tame boundary and local completion; the nine newer
roadmaps and the four Completed directories were included. LocalGaloisGroups'
current cyclotomic-image interface is already deferred. QuadraticFormInvariants'
classical Witt ring and GrothendieckEulerForms' exact K₀ are boundaries. The
current Tate module supplies the carrier and finite-rank criterion but not the
three elementary named lemmas originally promised. No matching current higher
finite/local K calculation was found. The additional finite-even hermitian
duplication found in the registered GN package was removed as listed above.

Read upstream AlgebraicTopology and GrothendieckEulerForms as form models,
together with UPSTREAM_GUIDE and the PadicMeasures exemplar. The README has
seven ordered layers, full source/hypothesis prose, API lists, definition checks,
examples, dependencies and downstream consumers. The two real-bodied Lean
definitions each have at least three discriminating README checks and multiple
Lean examples. Heavy definitions are listed in the closing comment, including
the extra Tate-module lemmas; they have no placeholder carrier declarations.

All eleven theorem signatures were checked against their variable blocks:

| Signature | Hypotheses and check |
| --- | --- |
| `tameCoordinate_swap` | Arbitrary commutative ring and units, all integer valuations; swap inverts the residue expression. 𝔽₅ gives 2 versus 3. |
| `tameCoordinate_change_uniformizer` | Unit c and exponents −r,−s; cross powers cancel, including negative valuations. |
| `tameCoordinate_mul_left` | Addition of first valuation and multiplication of first unit; bilinearity of rs sign and zpow uses the commutative unit group. |
| `maxDivisible_divisible` | Arbitrary additive commutative group; the supremum of divisible subgroups is divisible. Actual subgroups, not unrelated divisions of one element. |
| `mem_maxDivisible_iff` | Finite sums of divisible subgroups form a divisible subgroup, so one subgroup contains each given element of the supremum. |
| `maxDivisible_eq_top_iff` | Uses ℤ divisibility in Mathlib, matching positive-integer surjectivity in the definition. Zero group also satisfies the equivalence. |
| `maxDivisible_quotient` | Divisible subgroup splits by injectivity; quotient is reduced. Does not assert an arbitrary quotient of a reduced group is reduced. |
| `exists_isCompl_maxDivisible` | Existence, not a chosen/canonical complement; ℚ⊕ℤ/6 and the zero group are controls. |
| `map_maxDivisible_le` | Additive image is divisible; only inclusion into the maximal subgroup is promised. |
| `maxDivisible_prod` | Binary product, no inference about infinite direct sums or arbitrary unrestricted products of Tate modules. |
| `maxDivisible_eq_bot_of_finite` | Finite additive commutative group, including zero; multiplication by its exponent excludes a nonzero divisible subgroup. |

The seven computed tame examples cover residue values 2,3,4, negative valuation,
uniformizer change, residue characteristic two and the zero ring. The four
divisible-subgroup examples are target statements with `sorry`. Successful
elaboration is not a proof of these eleven theorems or four examples.

## Validation and handoff

- `lean-check research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`:
  exit 0; 15 warnings, all for `sorry`; no errors or other warnings. Memory was
  above the worker minimum. No language server, library build or Lake update.
- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`:
  exit 0, 0 errors and 0 warnings on the unchanged packet (280 nodes, 39 gaps).
- `python3 research/blueprint/intake.py check-files` on the four changed
  deliverables: 4 files, 0 problems. JSON parsing, `git diff --check` and
  `python3 scripts/check_sorry_data.py` on Suggested.lean also exit 0.

The next package correction should begin with the seven rows of the verdict
table, preserve the concrete fixes/negative controls above, and reconcile the
supplier layer order before seeking acceptance. In particular, do not replace
an absent export by a boundary sentence, restore the duplicated finite-even
hermitian proof, or weaken the perfect-residue scope to avoid the coefficient
foundation. The source ledger records exactly which original proofs remain
unread, so a later worker need not infer that from a successful Lean check.
