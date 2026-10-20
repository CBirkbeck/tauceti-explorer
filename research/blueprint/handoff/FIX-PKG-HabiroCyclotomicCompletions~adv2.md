# Completed fix: classical Habiro cyclotomic completions

Codex, session `codex-IFYiwp`, completed issue #11421 on 2026-10-20.
Claim comment 6292761385 was confirmed by the claim bot in comment 6292765187.
This is a completed package fix, not an independent review or a checkpoint.
Only the four authorized deliverables changed. Metadata and input packets
remain unchanged. The requested reviewer field is a **fix** assessment;
the subsequent independent review still has its own job.

## Inputs and finding dispositions

Read WORKERS, PROTOCOL, the expansion protocol, PACKAGE_REVIEW, UPSTREAM_GUIDE,
the approved exemplar, both available HC package reviews and their handoffs,
and the HR `~codex2` report and handoff. The requested
`REV-PKG-HabiroCyclotomicCompletions~adv.md` does not exist in this checkout;
the original and `~2` reports are the available HC reports. No findings are
invented for the missing report. The explicit maintainer instructions and
HR findings R1/R1a provide the actionable donor corrections.

| Finding or requirement | Disposition in this submission |
| --- | --- |
| HR R1: HC imports a derived receiver that consumes HC's earlier ordinary results. | Removed `ordinaryDerivedComparison` and its derived Checks from HC §5.5. Scope, Layer 5 Dependencies, §6.4 and the Lean closing comment no longer make HR derived material an input. HR §2.4 owns the receiver after its adjunction; the outgoing contract names HC §1.4, §2.3 and §5.1. |
| Preserve the legitimate early inputs. | Factorial/divisibility topology, polynomial/Laurent equivalence, ordinary polynomial-module completion, exactness, products and finite-presentation comparison remain in the README with their hypotheses, API and Checks. |
| HR R1a: powers of q−1 are not a decaying family for the full topology. | Both the diagonal and the family now use P_k. Added the null-family description of the completed direct sum, decay modulo every P_N, zero image in the completed cokernel, cancellation in the integral Habiro ring and infinite support of the only possible preimage modulo P_1. The old family is explicitly rejected modulo Φ_2. |
| Current Lean shape: the old file admitted completion carriers and hundreds of examples. | Replaced the 5,293-line development-shaped file by 332 lines: 11 real light definitions on existing carriers, 15 important finite theorem targets and 22 proved examples. All heavy mathematical targets remain in the README and are named in the closing omission comment. No admitted data, admitted example, private completion carrier or auxiliary proof development remains. |
| Earlier reviews: broad completion, rootwise, component and localization signatures. | Retained their full README contracts, canonical map equations, generality and discriminating Checks. Under the newer shape rule their missing native carriers prevent Lean declarations; this does not narrow the mathematical roadmap. The only removed mathematical target is the derived comparison reassigned to HR. A backtick-name comparison removes only that target and the old Lean subnamespace name `TaylorComparison`. |
| Earlier reviews: positive orders, actual indices, signs, precision and topology. | Retained m>0 for factorial divisibility, actual-polynomial indices in characteristic two, the non-adic claim about cofinal ideal filtrations, positive orders for nonzero component factors, signed P_N, strict ml<N comparison precision and q=z(1−u). Added native proved controls. |
| Arbitrary-ring root-ratio unit assertion. | Strengthened §3.3 to require Φ_d(ω)=0 with d>1 not a prime power. Exact order alone is insufficient: (ζ_6,1) in ℤ[ζ_6]×ℤ has order six but 1−ω is not a unit. The second factor fails the cyclotomic equation. The proof now uses Φ_d(1)=1 and polynomial division by X−1. |
| Direction and finite/completed distinction. | Reversed the first displayed graded equivalence in §4.5 to match its representative formula [g]↦[P_(N−1)g], with N≥1. Named finite Taylor ingredients explicitly; their signatures do not substitute for completed Taylor maps. |
| Form and named interfaces. | Added the opening Summary and Downstream consumers; named the integral infinite product and the ordinary arbitrary-module completion API. Every retained Lean definition/theorem is named in the README. No Checks, source locators or sound hypotheses were removed to shorten the file. |

## Remaining supplier edges

This is the complete incoming supplier inventory, grouped by mathematical
contract. Sources H, H₀, G, O, L and W justify statements; they are not
roadmap construction edges.

| Supplier | Contract consumed |
| --- | --- |
| Mathlib polynomial/cyclotomic theory | Finite sums and products, integral coefficients, monicity, coefficient maps, positive-divisor factorization of X^n−1, prime-power reductions and cyclotomic values at one. |
| Mathlib polynomial division, quotient rings and CRT | Monic remainders, quotient representatives, `AdjoinRoot` and its root equation/lift, coprime quotient products and finite CRT. |
| Mathlib Hasse/Taylor and power-series theory | Integral Hasse coefficients, factorial comparison with derivatives, polynomial translation, coefficient topology, continuous `eval₂Hom` with its convergence/completeness hypotheses, and zero-constant algebraic substitution. |
| Mathlib adic completion and separation | `AdicCompletion`, `IsAdicComplete`, `IsHausdorff`, injectivity for separated inputs and the Noetherian-domain intersection theorem only under its stated hypotheses. |
| Mathlib polynomial modules, exactness, tensor products and products | Native M[q], finite monic quotient modules, coefficient-module maps, product coordinates and finite-presentation tensor comparison. The cyclotomic completion theorem itself remains new. |
| Mathlib roots, fractions, finite modules and bases | Primitive-root equations under the library's hypotheses, fraction fields, finite-dimensional coordinates and denominator clearing for finite-domain separation. |
| Mathlib Laurent polynomials/series and Hahn series | Laurent extension after q is a unit; injective polynomial embedding; positive exponent dilation through `HahnSeries.embDomainRingHom`; formal exponential/logarithm and substitutions under the coefficient assumptions in §1.1. |
| Mathlib resultants, matrices, adjugates, localizations and algebra automorphisms | Monic resultant/comaximality contracts, finite integral image criteria, actual common fraction-field embeddings, localized coefficients and Galois descent data. |
| Tau Ceti complete separated topological rings | Existing complete-separated categories, products and closed subobjects, and uniqueness of continuous ring maps from completions. |
| Tau Ceti polynomial coefficient lists and synthetic division | Descending Horner coefficients, division by X^(length t)+ofCoeffList(t), and correctness of quotient/remainder lists. The new factorial digit step uses these and negates the quotient. |

All internal construction edges go forward in the README:

| Layer | Earlier HC suppliers |
| --- | --- |
| 1 | Finite q-calculus and cyclotomic index polynomials precede compatible quotients, topology, coefficient maps and cofinal presentations. |
| 2 | Layer 1 finite projections, topology and factorial cofinality; the existing coefficient-list API supplies the executable arithmetic. |
| 3 | Layers 1–2 projections, coefficient changes, factorial sums and Laurent/power substitutions. |
| 4 | Layers 1–3 completion, Taylor and coefficient APIs; order chains precede root rigidity, and weighted filtrations precede matrices and integral image criteria. |
| 5 | Layers 1–4; §5.1 ordinary coefficient-module completion supplies the product comparison used in §5.5. Its nonexactness example also uses §1.2 regularity and §1.4 cofinality. |
| 6 | Layers 1–5; projector examples use both the Taylor image theorem and component decomposition. |

There is **no external roadmap construction input**. QWittVectors Layer 1 is
an ownership exclusion for general lambda-ring theory, not a supplier to
the elementary substitution construction. The scope's other roadmap names
are consumers. In particular, no incoming edge points to HabiroRings derived
material, RefinedTraceMethods or HabiroCohomologyFoundationsPartII. HR §2.4
receives the early ordinary HC interfaces; the derived comparison is absent
from HC's target list.

This resolves the donor edge, not every family dependency. HR report R2's
separate RefinedTraceMethods consumer retargeting to
HabiroCohomologyFoundations §4.21 is outside these deliverables. Historical
packets also retain older ownership text; they are supporting inputs, not
authorized edits in this job. This handoff does not certify the whole Habiro
family acyclic or ask the maintainer to delete HR's legitimate early inputs.

## Current-library and duplication audit

Read the HC library-coverage entries and actual statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The README's exact supplier
contracts name the declarations reused, rather than planning them again.
The compact Lean file uses only Mathlib, so imports no unused Tau Ceti module.

Also inspected the current read-only TauCetiRoadmap checkout at
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including current AdicSpaces and
ProfiniteArithmetic openings. Searched the newer and Completed roadmaps and
current library by cyclotomic quotient/compatible-family, factorial digit,
Jackson/q-binomial, multiplicative shift, module and Laurent-dilation shapes.
No existing cyclotomic completion construction replacing the owned targets
was found. Current Tau Ceti moves the coefficient-list module to
`TauCeti.Algebra.Polynomial.Coeff.List`; the README records this and preserves
the baseline contract.

SmoothRepresentationsOfLocalGroups uses Gaussian polynomials in its
minuscule triangular Satake matrix (README near its LTXZZ Lemma B.2.6
application). That application is already owned there; it does not define a
general q-toolkit in its Suggested file. HC does not replan the Satake matrix.
Additive falling Pochhammer products are also distinct from HC's multiplicative
q-shifts. No build or Lake command was run in either read-only checkout.

## Adversarial pass on changed statements

Read the entire README and compared the edited contracts with the retained
light Lean signatures. The following covers every retained definition and
theorem, plus every changed mathematical assertion in the README. The 22
Lean examples are proved controls, at most two per kept definition. Finite
calculations support the pass; general statements remain roadmap targets.

| Statement | Instances and failure modes tried | Result / change |
| --- | --- | --- |
| `qInteger` | n=0,1,3; q=1; characteristic two | Empty sum zero, [1]=1, [3]=1+q+q²; [2]_1=0 over 𝔽₂. No quotient definition. |
| `qFactorial` | n=0,3; q=1; characteristic two | Empty product one; [3]_1!=6; [2]_1!=0 over 𝔽₂. |
| `qBinomial` | n=k=0, k>n, (3,1), (4,2), q=0,1 | Integral Pascal recurrence gives zero outside the triangle; (4,2) has coefficients 1,1,2,1,1. |
| `qMultinomial` | Empty/all-zero lists, (1,1,1), (1,2)/(2,1) | Empty value one, product of successive choices, permutation and total-factorial behavior agree. |
| `pochhammer` | Length 0,1,2; x=1; q=1; (x,q,n)=(2,3,3) | Correct empty/first factors and sign; last value −85. No division at q=1. |
| `qFactorial_pochhammer` | n=0,1; q=1, characteristic two | Both sides are integral polynomial products; no cancellation by 1−q. |
| `qBinomial_factorial` | k=0,n; n=0; k>n excluded | k≤n is explicit. Cross multiplication survives vanishing factorials. |
| `qMultinomial_factorial` | Empty and zero parts; three ones; q=1 | Total and part factorials telescope as polynomial identities. |
| `finite_qBinomial` | n=0,1,2; q=0,1,2,−1 | Product uses −t so signs are positive; exponent k(k−1)/2 matches the two-factor coefficient q. |
| `jackson` | Constant; t² at q=1,2; characteristic two | Coefficientwise formula gives 0, 2t, 3t respectively; at q=1 in characteristic two it kills t². |
| `adaptedJackson` | Constant; t² at q=1,2; t³ at q=0 | Scaling is 1−q: gives 0, −3t and t² in the respective Checks. |
| `jackson_leibniz` | f=t, g=t; constants; q=0,1,2 | D_q(f)g+f(qt)D_q(g) gives (1+q)t; twist is on the displayed factor. |
| `jackson_at_one` | Constants, t², characteristic two | Ordinary derivative specialization, distinct from the zero adapted operator. |
| `cycloIndex` | Empty S; {1} over ℤ; {1}/{2} over 𝔽₂ | Actual polynomials, not a free monoid of labels; empty closure is bottom. |
| `factorialPoly` | N=0,1,2,3; characteristic two; zero ring | P_0=1 and leading sign (−1)^N; degree claims retain nontriviality. |
| `factorialPoly_cyclotomic_factorization` | N=0 through 7; odd N; characteristic two | Signed finite product correct; empty Icc gives one. |
| `cyclotomic_pow_dvd_factorial` | d>N, N=0; d=1,2; order zero | Positive d explicit; zero exponent gives divisibility by one. |
| `factorial_cofinal` | Empty product, repeated factors, coincident characteristic-two factors | Actual finite product has bounded multiplicities; sufficiently large N works. No uniqueness of exponent labels is assumed. |
| `factorial_root_power_dvd` | k=0; m=1,2; m=0,k=1,N=0 | Positive m required: excluded case would assert 0 divides 1 over ℤ. N≥mk permits larger precision. |
| `factorial_telescope` | N=0,1,2 and through 7 | Multiplication by q gives 1−P_N, including the empty zero sum. This is the finite ingredient of q inversion. |
| `factorial_taylor_vanishing` | k=0, d=1,2; characteristic two; ζ of nonprimitive order | ζ^d=1 and d>0 suffice; every dth factor supplies q−ζ. No primitivity or factorial inversion. |
| `factorialSum_taylor_stable` | M=N; k=0; arbitrary polynomial b_n; zero ring | Every added term has a (q−ζ)^(k+1) factor; coefficient k is unchanged for N≥d(k+1). |
| `taylorPolynomial` | q, 1−q, q²; m=0; zero/characteristic-two coefficients | Actual `AdjoinRoot` carrier and q=z(1−u) give linear coefficient −z and quadratic expansion z²(1−2u+u²). Construction allows m=0; the leading theorem does not. |
| `leadingFactor` | (m,l)=(1,4),(2,2); l=1; zero indices | Values 6,8,m. Total definition permits zero indices; its leading-coefficient theorem explicitly assumes both positive. |
| `factorial_taylor_leading` | m=1 through 6, l=1 through 4; torsion coefficients | Lower coefficients vanish universally, leading coefficient is m^(2l−1)(l−1)!. No exact-order claim after torsion reduction and no cancellation in arbitrary R. |
| `factorialPoly_smul_injective` | Zero module/ring, N=0, M=𝔽₂, coefficient torsion | Unit leading coefficient, not torsion-freeness of M, gives injection. N=0 acts as identity. |
| §1.2 nonunit statement | n=0 versus positive n; zero ring | Positive n and nonzero R now explicit; Φ_0=1 cannot be a nonunit witness. |
| §3.3 root-ratio unit and closeness | Equal roots; p-power ratios; order-six element in a product ring | p-power relation gives p-adic nilpotence as before; non-prime-power unit conclusion now requires the actual cyclotomic equation. A unit cannot be topologically nilpotent in a nonzero separated ring. |
| §4.5 graded equivalence | N=1,2; representative 1 and q | Polynomial quotient is the source of [g]↦[P_(N−1)g]; corrected displayed direction. Zero-precision case is excluded. |
| `factorialModuleCompletion` and its comparison | Zero module; M[q] including M=𝔽₂; ℤ[q]/P_r; N=0 | Comparison uses §5.1 at all positive orders; finite P_r-torsion module has eventually constant tower; quotient at P_0=1 is zero. |
| `completedDirectSum_eq_nullFamilies` | P_k family; constant ones; N=0,1; support depending on N | P_k support is contained in k<N; ones fail modulo P_1. Carrier is neither the unrestricted product nor the direct sum of completions. |
| `factorialDiagonal_nonexact` | Each coordinate k≥1; old (q−1)^k; modulo P_1 and Φ_2 | Polynomial diagonal is injective; P_k family is a completed kernel element; completed regularity forces preimage ones, which fails finite support. Old family evaluates to (−2)^k at −1, never zero. |
| Dependency and scope contracts | Ordinary versus arbitrary-module exactness; consumer direction; lambda-ring exclusion | Ordinary coefficient-module exactness retained with no Noetherian/torsion-free restriction. Derived theorem lives only in HR's downstream contract. |

All 15 theorem signatures were compared with their named README contracts,
exceeding the ten-signature spot check. They have local explicit binders;
there is no ambient `variable`/`include` block hiding hypotheses. The finite
statements use arbitrary commutative rings; `pochhammer` and Jackson even
allow any commutative target ring. The general completed results keep the
README's full coefficient/module/root hypotheses. No group, compactness,
rank, DVR-uniformizer or slope hypotheses arise in these changed statements.

## Sources actually checked

Public primary texts were read in disposable scratch only. No restricted
book was needed. Source statements are restated in our own words; no source
passages or section-by-section source synopsis are in the repository.

| Key | Locator read for this fix | Use / qualification |
| --- | --- | --- |
| H | §3.1 pp.1130–1131; §7.1 Proposition 7.1 pp.1141–1142; §7.3 Theorem 7.1 and proof p.1144 | Compatible monic quotients, finite telescope and module construction. The source's Theorem 7.1 is a restriction theorem; ordinary exactness and the diagonal example use the explicit finite-block/direct-sum arguments, not a false attribution of that example to H. |
| H₀ | §1 p.3; Lemma 3.1 proof p.7 | Factorial cofinality and monic coordinate expansion. |
| G | §5.1 (298)–(311), pp.59–61 | Shifted comparison precision, graded map direction and universal leading coefficient. Torsion-free injectivity hypotheses elsewhere in §4 remain. |
| O | Definition 1.1 p.2; Table 1/Proposition 2.1 p.7; Propositions 2.2, 2.5, Corollary 2.6 p.8; Proposition 2.7 p.9 | Integral q-calculus, Jackson normalization and infinite-series identities. Finite q-binomial coefficient identities are justified by product induction. The existing warning about the raw Proposition 1.5 prefactor remains. |
| L | Unnumbered theorem p.75 and Lemma 1 p.76; three-page paper | Non-prime-power value Φ_d(1)=1 for d>1 and resultant boundary. d=1 is not included in the unit claim. |
| W | §2.1 Lemma 2.1 and proof p.8 | Distinct-order prime-power quotient; equal orders are still excluded from that formula. |

Fixed PDF receipts, accessed 2026-10-20:

| Source | URL | SHA-256 |
| --- | --- | --- |
| H | [Journal PDF](https://ems.press/content/serial-article-files/40881) | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| H₀ | [arXiv v1](https://arxiv.org/pdf/math/0209324v1) | `ae2ea5024a0a45e8eaf16b1bcaaf1c139cd7437aaa5a6ea9ff596e98b47e69d0` |
| G | [arXiv v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| O | [Course notes](https://wgabrielong.github.io/academic-writing/notes/bonn-winter-24-25/V5A2-Habiro-Rings/Habiro_Rings_Notes.pdf) | `6e1757b177f62808ef6ce3241dfe90de3831eb19d93a39c5afb7b41a43615955` |
| L | [Publisher PDF](https://publi.math.unideb.hu/paper/348/download/10_5486_PMD_1997_1721.pdf) | `dd47d31757c7097a03a64b26814db6795a70cdb7cfd6a767145eb16ff1b254d6` |
| W | [arXiv v5](https://arxiv.org/pdf/2410.23078v5) | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |

No instruction-bearing suspicious text was encountered. Other workers'
reports and all fetched documents were treated as data; none supplied
permission to run code, change other jobs' files or contact anyone.

## Validation and completion

- Final `lean-check research/blueprint/packages/HabiroCyclotomicCompletions/Suggested.lean`: exit 0, zero errors, **15 warnings**, each exactly `declaration uses sorry`, one for each theorem target. All **22 examples are proved**. The check used the existing shared Mathlib build at the pin, serially, with 79 GB available before starting. No language server or library build/update was started.
- An independent bounded calculation using exact integer coefficient lists passed **298 assertions**: signed cyclotomic factorization 16, factorial identity 8, Gaussian factorial 36, Gaussian specialization 44, finite q-binomial 32, telescope 8, Jackson product rule 12, universal leading jets 60, factorial-family decay 57, constant-preimage rejection 1, old-family rejection 12 and completed-cokernel kernel 12. Products used convolution, cyclotomic factors used recursive exact division of X^n−1, and jets were reduced modulo Φ_m. The leading-jet range was m=1,…,6 and l=1,…,4; factorial-family tests used N=1,…,6 and k=1,…,12. These are finite checks, not proofs of the completed results.
- All three unchanged supporting packets passed `scripts/check_blueprint.py`, each with zero errors and zero warnings.
- `research/blueprint/intake.py check-files` over the four deliverables and `git diff --check` passed. No private paths, source files or unrelated repository changes are included.

The requested donor corrections are complete. The next step is the separate
independent fix review. Open conjectures and missing native completed carriers
remain mathematical roadmap work; this submission does not claim their
formalization. No second issue was claimed.
