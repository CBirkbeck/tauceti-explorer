# Independent package review: DeformationAndDerivedPatchingAlgebraPartII

**Verdict: accepted with the corrections below.** Reviewer: Codex, session codex-QggYjy,
2026-10-13. Job #9208. The package was authored by Claude, session claude-Lpov4n, for #9164;
this reviewer did not author it. The package is ready for a draft TauCetiRoadmap PR. This verdict
concerns a roadmap and representative signatures, not completed formal proofs.

## Scope and quality

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, the expansion protocol and UPSTREAM_GUIDE.md;
read the complete package and the accepted packet's 68 targets, 37 API items and 26 tests.
Compared the upstream StableReduction and JacobianChallenge READMEs, and the current
AlgebraicVectorBundles README and representative signatures alongside StableReduction's current
Suggested.lean. The package has the required summary, boundaries, conventions, exact supplier
contracts, layers with statements and prerequisites, definition APIs and computed Checks, and
worked examples. Its organization follows the mathematical build rather than a source's sections.

All 68 accepted-plan targets and 26 tests remain represented. The package's corrections to the
plan's supplier assumptions and stronger intermediate claims are retained and checked below.
Added local-cohomology comparisons close two implicit steps in the existing induction; no change
to the end theorem, coefficient generality or list ordering is needed. Metadata remains the single
line `topic = "math.AC"`. The README and Lean contain no source passages, source-by-source
summaries, private paths, job identifiers or review narrative.

## Corrections made

1. **Completion in normalized local duality, K0.7.** The former proof used
   `Hom_R(N̂, E) = Hom_R(N, E)`. That is false for ordinary algebraic Hom over a noncomplete ring.
   The proof now applies `Hom_{R̂}(-, E)` and Matlis biduality over the complete ring, then uses
   `N̂ ≅ R̂ ⊗_R N` for finite `N` and restriction–extension adjunction. An incomplete DVR gives a
   negative control: `R̂/R ≠ 0` has a nonzero map into the injective hull, so ordinary
   `Hom_R(R̂, E) → Hom_R(R, E)` has a nonzero kernel. The theorem itself remains valid without
   assuming completeness. Added the explicit DVR calculation with `ω = R[1]`, degree `-j`, and
   the normalization shift `ω_𝔭[-δ(𝔭)]` at the generic prime.
2. **Regular-terminal reduction, K4.1.** Added `M ≠ 0`. With `M = 0`, `rs = []`, `r' = 0`, all old
   hypotheses hold but `[0]` is not secant for a module of support dimension `⊥`. Added this
   computed Check and a Lean example. The final theorem already treats zero modules separately
   and keeps that generality.
3. **Principal-stage base scheme, K3.5 and K4.2.** Module regularity alone identifies the transformed
   module with `M` on `Spec R/R⟨r^∞⟩`, not with a sheaf on an unchanged base scheme. Identifying
   that scheme with `Spec R` requires ring regularity too. Added
   `R = k⟦x,y⟧/(xy)`, `M = R/(y)`, `r = x`: regular on `M`, a zero divisor on `R`.
4. **Local-cohomology interfaces, K0.1.** Named the filtered-colimit comparison, with Noetherian
   base and arbitrary modules, and supplied its finite-Čech proof. Stated the principal degree-one
   colimit for arbitrary modules, with multiplication-by-`r` transitions; regularity is not needed.
   Both are used in K4.3. For `N = k` killed by `x`, the individual quotients are `k` but the zero
   transition maps give colimit zero. A Lean example pins degree-one vanishing for `ℤ/2` at `(2)`.
5. **Definition APIs and Checks.** Made the prefix-quotient notation API explicit and added three
   discriminating computations: empty list, `[2]` on `ℤ`, `[2,3]` on `ℤ`. Added two corresponding
   Lean examples. Gave `IsCMBlowupChartwise` its named zero-module, zero-ideal, unit-ideal and sheaf
   comparison API, with positive and negative Checks, including the empty blow-up. Added a
   zero-ideal Lean example, and direct positive and negative examples for
   `LowLocalCohomologyVanishes`.
6. **Minor quantifier and witness corrections.** The prefix-product recurrence is valid for all
   natural indices, including indices beyond the list length; the geometric induction uses indices
   within it. The claim involving `r₁^s` explicitly requires a nonempty list. The wrong Matlis
   formula involving `𝔪²` is refuted on a DVR, where `𝔪² ≠ 𝔪`, rather than at an unspecified local
   ring which could be a field.
7. **Sources and ownership.** Added Kawasaki's public 19 August 1999 author preprint, with its
   exact title and pagination, as a directly read source of the colon induction. Marked Schenzel's
   book and the 2000/2002 published proof locators as historical references cited through
   Česnavičius. Moved the affine-chart helper descriptions to supplier contracts: they are notation
   for current Tau Ceti rings, not new formalization targets.

## Sources

Read Česnavičius arXiv:1810.04493v2 §1.14 and §3, including the proof of Theorem 3.14; Kawasaki's
1996 RIMS note §§1–2; HJLS Example 3.6 and its context; and the Stacks statements cited below.
The three downloaded PDFs have the same SHA256 hashes as their packet source records. All page
numbers here and in the README are printed page numbers.

The author flagged Schenzel 1982, 2.4.2; Kawasaki 2000, 2.2, 2.8–2.10, 3.1–3.3; and Kawasaki
2002, 3.6 as unread. The library index contains no cleared Schenzel copy; none was obtained.
The AMS publication PDF URLs returned HTTP 403, and a separately indexed university mirror
returned 404. **The original publication/book locators have not been independently verified.**
They are now explicitly indirect citations, not assertions that the original texts were checked.

The mathematical claims nevertheless have directly read public sources:

| Flagged material | Direct source and finding |
| --- | --- |
| Schenzel torsion bound | Česnavičius Remark 3.3, p. 10, and Kawasaki 1996 Lemma 2.4, p. 42. Positive powers follow by replacing the last secant entry by a power. |
| Goto–Yamagishi identity | Česnavičius Remark 3.10 and its induction, p. 12; Kawasaki 1999 preprint Proposition 3.2, p. 5. |
| Reversed d-sequence and auxiliary parameters | Česnavičius Proposition 3.11(i), pp. 12–13; Kawasaki 1999 Propositions 3.4–3.5, p. 5. Proposition 3.4 explicitly allows membership in either indicated annihilator ideal. |
| Prefix-product torsion and auxiliary regularity | Česnavičius Proposition 3.11(ii)–(iii), pp. 12–13; the underlying five-part colon induction in Kawasaki 1999 Theorem 3.6, statement p. 6 and proof pp. 6–13. The preprint allows nonnegative exponents, with positive exponents where factors are removed. |

The preprint is linked on [Kawasaki's publication page](https://tkawasaki.fpark.tmu.ac.jp/articles.html)
as a [compressed DVI](https://tkawasaki.fpark.tmu.ac.jp/dl/arith-CMfication.dvi.gz).
Its numbering is recorded independently of the 2000 and 2002 published versions. None of the
kept mathematical statements depends on treating an inaccessible original locator as verified.

A sample of 15 distinct other packet locators was selected with random seed 9208. Each was
compared with the actual README statement and the primary source:

| # | Locator checked | Result |
| --- | --- | --- |
| 1 | Česnavičius Theorem 3.14, support/dimension reduction | p. 14; the README gives its own Rees/Proj derivation rather than depending on the unread HIO book. |
| 2 | Česnavičius (3.14.10) | p. 16; `r_b T − r_a` is the exact-sequence map. Both printed and corrected relations annihilate the indicated module. |
| 3 | Česnavičius Definition 3.8 and Remark 3.9 | p. 12; the torsion characterization needs the later index. |
| 4 | Stacks §10.70, Lemma 10.70.6, tag 052P | Two-generator chart kernel is the denominator-power torsion. The packet calls 10.70.2–3 “Examples”; they are Lemmas. The README already uses the correct section/lemma citation. |
| 5 | Česnavičius Proposition 3.11(ii) | Statement p. 13, introduction p. 12; `s ≥ 2`, `m,n > 0`, entire prefix ideal on the right. |
| 6 | Česnavičius Claim 3.14.5 and (3.14.13) | Claim p. 16, calculation p. 17; annihilation by both two-generator entries. |
| 7 | Česnavičius Definition 3.1(ii) | p. 10, not the packet's p. 9. The README already has p. 10. |
| 8 | Česnavičius Lemma 3.6(a) | p. 11; normalized duality annihilator equality. |
| 9 | Česnavičius Remark 3.10, first equality | p. 12; requires `n ≥ 1`. |
| 10 | Česnavičius Definition 3.8 | p. 12; injectivity on the image of the full sequence ideal in the prefix quotient. |
| 11 | Česnavičius induction (3.14.1)–(3.14.11) | pp. 15–16; depth induction at closed points over the maximal ideal. |
| 12 | Česnavičius Claim 3.14.6 and (3.14.14)–(3.14.16) | Claim p. 16, proof p. 17; first nonempty vanishing range is `s = 3`. |
| 13 | Kawasaki 1996 Definition 2.1 | p. 41; later-element colon condition, arbitrary modules. |
| 14 | Stacks Lemmas 47.16.5 and 47.17.3, tags 0A7U/0A7Z | Finite Ext support bounds, depth detection and normalization shift; no completeness hypothesis is introduced. |
| 15 | Česnavičius Lemma 3.6(b) | pp. 11–12; equidimensional support is required for the non-CM locus formula. |

Also checked Stacks 0A84/0AAK (local duality with completion), 08Z1 (Matlis duality over the
complete ring), 0A80 (catenarity), 0A6R/0BJB/0BJC (Čech, restriction of scalars and composite
supports), 02IJ (the inequality direction does not assume universal catenarity), and 080A/080D/080E
(product blow-ups and module strict transforms). No source passages are included in this report.

## Prerequisite closure and duplication

Read the reviewed library audit, including DeformationAndDerivedPatchingAlgebra R03.3, and
the actual supplier targets in SchemeAndStackFoundations SF.0 and SF.2. The parent is tier 10
in CaraianiNewton.md; this Part II is outside the 94. The package's atlas suppliers are SF
(tier 1) and its parent, while StableReduction is already an upstream roadmap. There is no
upward prerequisite or `FoundationsAndLibraryIntegration`/`UPSTREAM:` supplier left in the package.

Confirmed the author's supplier repairs rather than treating packet edges as evidence:

- Depth, support-restricted CM modules and CM sheaves come from SF.0; module Čech comparison,
  flat base change and depth via local cohomology come from SF.2. R03.3 supplies only the
  nonzero-CM parameter-element regularity result needed here.
- SF.2's normalized dualizing complexes supply the carrier for K0.7; local duality in the needed
  module form is planned here. AnalyticStacks is not a supplier of ordinary-ring duality.
- The strict transform along an arbitrary blow-up is planned here. It differs from SF.4's
  modification of an integral scheme by removing exceptional-divisor torsion after pullback.
  AdicCoefficientsAndComparisons L5 is not used.
- StableReduction Layer 4 supplies the general geometric blow-up, universal property, properness,
  exceptional divisor, off-centre behavior and subscheme strict transforms. Its list does not
  supply the arbitrary module strict transform or the product-of-ideals identity; these targets
  are correctly kept here.

Read the pinned Mathlib definitions and signatures for the packet's 44 baseline declarations,
including local cohomology as an Ext colimit, regular sequences, polynomial-module maps,
annihilators, support, quotient maps and sheaf carriers. Separately read the module dimension-drop
statements used by the secancy proof, including their finite-module, Noetherian and maximal-ideal
hypotheses. Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin is
`f790474821cf4256814db967cb154e7af3d0c369`.

Searched every current upstream roadmap and Completed roadmap by the mathematical objects,
including the nine post-snapshot roadmaps, at upstream commit
`0d144d044dacebca17b654695b6f1ad58f159b27`. Searched current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and read the relevant Rees grading,
affine blow-up, homogeneous-chart equivalence and chart-immersion modules. The package correctly
imports those interfaces. Current AlgebraicVectorBundles' tensor/sheaf interfaces do not already
provide Rees modules or their strict transforms. The current dimension/regular-element material
is also consumed rather than planned as a new target. **No further target removal was necessary.**
The compatibility notation in Suggested.lean does not claim ownership of current library rings.

## Adversarial mathematics pass

The table groups the packet's 68 targets with their defining APIs; the added comparisons and
predicates are included as well. Each group was checked on both the stated generality and the
degenerate or wrong-definition controls listed. “Kept” means the corrected package's claim survives
these calculations, not that its Lean proof is complete.

| Statements and APIs checked | Instances and calculation | Outcome |
| --- | --- | --- |
| K0 annihilator-product, zero, successor, factor bound, vanishing-to-unit | Cutoffs 0,1,2; zero module; `R/(x²)`; `k ⊕ R/(y)`. Product `(xy,y²)` differs from intersection `(y)`. | Kept; no radical or intersection substituted. |
| Prefix quotient and notation API | `ℤ/([]) = ℤ`, `ℤ/(2) = ℤ/2`, `ℤ/(2,3) = 0`; the product quotient would be `ℤ/6`. Iterated quotient and permutation preserve the generated ideal. | Added explicit API and three Checks. |
| Secancy, dimension characterization, permutation, sublist, powers, truncated product, append, regular comparison | Field `[0]`; zero module; DVR `[x]`, `[x²]`, `[x,x]`; `[xy,y]` fails its second drop. Nonzero finite prefix quotients follow from Nakayama. | Kept; dimension equality excludes the zero module. |
| Low local cohomology and CM comparison | Zero module, field, DVR, `k⟦x,y⟧/(x²,xy)`: nonzero `x`-class in degree 0 below dimension 1. | Added direct Lean positive/negative controls. |
| K0 CM-secancy, maximal-ideal membership, dimension drop, terminal vanishing, annihilator membership, empty equivalence, owner comparison | Empty list on field and zero; `[x]`, `[x²]` on DVR; `[y]` on the non-CM ring above. Intermediate quotients need not be CM. | Kept. |
| Schenzel bound, regular secant consequence, extension to parameters, reversal | Powers of the last entry; empty list excluded in the torsion theorem; nonzero assumption for parameters; reversed tails equal original prefixes as generated ideals; dimension 0 uses the empty list. | Kept; public statement sources recorded. |
| Matlis annihilator, normalized local duality, duality annihilator | `N = 0, κ, R`; complete and incomplete DVR; `ω = R[1]`, `Ext^{-1} = R`; field shift control. | Corrected completion scalar ring and DVR witness. |
| CM locus and nonequidimensional defect set | Zero/CM modules; equidimensional local ring; plane-plus-line `k⟦x,y,z⟧/(xy,xz)` at `(y,z)`, where depth 0 plus component dimension 1 is less than total dimension 2. | Kept support restriction, finite Ext, normalized shift and equidimensionality distinction. |
| Composite supports, change of rings, principal/two-generator cohomology, filtered colimits | Ideals 0 and 1; DVR and residue field; two-variable regular ring; principal transition maps zero on a killed residue module; finite Čech terms. | Added named colimit comparison and general principal formula. |
| K1 d-sequence, empty, zero, weak regularity, singleton, equivalence, torsion characterization | `[0]`, `[1]` over `ℚ`; `[2,0]` and `[0,2]` over `ℤ`; `[t,u]` on `R/(u) ⊕ R`. Later `u`-torsion, not `t`-torsion, equals `tu`-torsion. | Kept; no locality, finiteness or final properness added. |
| Goto–Yamagishi colon and intersection identities | `[0]` on `ℚ` fails the colon equality at `n=0`; `i=2,n=2` on `k⟦x,y⟧` gives `(x²,xy)`; `n=1` uses its separate base case. | Kept `n ≥ 1` and both induction directions. |
| K2 prefix product, zero, successor, one, take, ideal bounds | Empty list; `s=0`; indices beyond list length; `[2,3]` gives `(2)` rather than `ℤ`; zero first entry. | Corrected total-index prose and nonempty witness condition. |
| KawasakiConditions projections, empty and zero cases | Empty auxiliary lists; clauses (ii) at `s≤1`; `m,n>0`; zero modules; `[X]` on `ℚ⟦X⟧/(X²)` fails d-sequence injectivity. | Kept all three quantified clauses and the last auxiliary index. |
| K2 reversed d-sequence, prefix-product torsion, last auxiliary regularity, proposition | Empty auxiliaries; full ideal torsion; regular sequences on a CM module; CM-secant `[y]` on a non-CM ring; last-auxiliary-element antecedent. | Kept; direct theorem source plus read colon induction. |
| Robustness | Empty auxiliary list; `[X]` and quotient by `[Y]`; concatenation of secant lists. For every prefix, the auxiliary list must be secant for that prefix quotient. | Kept the author's explicit prefixwise qualification. |
| K3 Rees module, membership, singleton, unit, zero ideal, coefficient and map APIs | Degree 0; ideal 0 and degree 1; ideal 1; `(2)` on `ℤ/2`, whose actual degree-one image is zero while tensoring retains `ℤ/2`; identity/composite coefficient maps. | Kept actual coefficient submodules; no tensor replacement. |
| Chart module, regularity, annihilator, tensor surjection, map, principal, self, zero/unit, finiteness, homogeneous localization | Denominator 0 gives zero localization; denominator unit; `(2)` on `ℤ/2`; `(x)` on `k⟦x,y⟧/(xy)`; map of fractions `x/aⁿ`, kernel killed by a denominator power. | Kept; fractions occur in localizations without assuming a nonzero denominator. |
| Module blow-up, chart, off-centre, map, map-on-chart, identity, composition, zero, self, chart surjection | Ideals 0,1; principal torsion; `ℤ/2` at `(2)`; functorial maps are fixed on spanning images on a cover. | Kept sheaf/image construction and coherent finite case. |
| Chartwise CM, sheaf comparison | Zero module; empty blow-up; unit blow-up of a CM DVR and of the non-CM ring above; HJLS maximal-ideal blow-up. | Added explicit predicate API and controls. |
| Module strict transform, quotient API, comparison | Unit ideal; all exceptional torsion `ℤ/2` at `(2)`; principal regular generator; exceptional torsion is removed after pullback. | Kept; no identification with base-torsion modification of integral schemes. |
| Product-of-ideals scheme and module identities | Either ideal 0 or 1; invertible principal ideal; module-regular but ring-nonregular `x` on `R/(y)` over `R=k⟦x,y⟧/(xy)`. Product charts recover both fractions. | Corrected principal-stage scheme identification. |
| Blow-up support, Rees bound, Proj prime chain, support-dimension bound | Zero module/ring; ideal 0 (empty Proj), ideal 1 (`Spec R`); proper support `R/(y)`; infinite global dimension. Domain height bound has only the inequality direction. | Kept; no catenarity or chosen scheme structure on support assumed. |
| K4 regular-terminal quotient and Rees/sheaf quotient comparison | Zero-module counterexample; `[x]`, terminal parameter `y` on `k⟦x,y⟧`; arbitrary reduction by `x` at centre `(x)` would give nonzero kernel. | Added `M ≠ 0`; regularity on `M/I_tⁿM` only, not every shorter product. |
| Principal stage and two-generator chart | `s=0,1,2`; node `xy=0`; `r_bT-r_a`; coefficient or constant regularity proves injectivity by top or bottom coefficient; closed fibre prime gives monic polynomial. | Kept torsion quotient, closed-point scope and map direction. |
| Claim annihilation and polynomial annihilation | Both two-generator entries annihilate `H¹`; at `xy=0`, `yT-x` acts nontrivially on an image of `y⁻²`; characteristic 2 changes no argument. | Kept Noetherian base-change hypothesis and sign/direction witness. |
| Claim vanishing and chart depth induction | `s=2` has empty inner range, `s=3` first content; all quotients by `r_s^m`, `m>0`; row 2 controls incoming differentials to row 1; monic fibre polynomial shifts vanishing by one. | Kept simultaneous induction with secancy, no terminal hypothesis. |
| Weaker-hypothesis CM blow-up and Kawasaki end theorem | Zero module; empty list; field and DVR; non-CM ring with CM-secant `[y]`; positive terminal dimension reduced by a CM parameter. | Kept end-theorem generality; CM localizes from closed points of the proper blow-up. |
| Arbitrary-centre nonexample | HJLS semigroup generators, free basis of rank 21, two-dimensional non-CM chart, over fields of characteristic 0, 2 or 3. | Recomputed below; kept. |

For K4.4, specifically checked both short exact sequences involving the kernel of multiplication
by the chart relation on `H²`. Its surjectivity follows from the zero `H²` of the quotient; its
kernel inherits the required vanishing by the long exact sequence. The auxiliary power quotients
inherit Kawasaki's conditions for each shorter prefix by secancy, permutation, powers and K2.4.
This closes the accepted plan's former prefixwise inheritance gap without assuming the desired
depth conclusion as a hypothesis of the outer induction.

For HJLS, write `u=x³`, `v=x⁵y³`, `w=x¹⁵y²`, `z=y⁷`. The relations `v³=wz` and
`w⁷=u³⁵z²` reduce to the 21 monomials `v^i w^j`, `0≤i<3`, `0≤j<7`; their distinct exponent
classes modulo `(3,0)` and `(0,7)` give a free basis over `k[u,z]`. On the chart at `x³`, with
`Y=y/x`, write `a=x³`, `b=x⁵Y³`, `c=x¹⁴Y²`, `d=x⁴Y⁷`.
The relations `b²¹=a²³d⁹` and `c²¹=a⁹⁰d⁶` make the chart finite over `k[a,d]`.
The relation `dc²=ab³c`, together with `c²∉aB` (the exponent `(25,4)` is absent from the chart
semigroup), shows that `d` is a zero divisor modulo `a` at the origin. That local ring has
dimension 2 and depth 1. These monomial calculations are independent of the characteristic.

## Lean and validation

Spot-checked the README against all kept definitions and the theorem signatures, including more
than the required ten: annihilator containment, empty CM-secancy, Schenzel bound, extension to
parameters, reversal, Matlis annihilator, weak-regular-to-d-sequence, torsion characterization,
both Goto–Yamagishi identities, prefix recurrence, Kawasaki's proposition and robustness,
chart regularity, support bound, polynomial relation, closed-point depth induction, both end
theorems and the existential counterexample. Hypotheses, actual quotient carriers, list indices,
scalar rings, finite dimensions and zero cases agree. Heavy sheaves, dualizing complexes and
spectral sequences remain README targets and are identified in the closing comment.

Suggested.lean has 598 lines and 33 examples. Definitions and data instances have real bodies
over pinned carriers; the Rees-module closure is the short coefficientwise check. There are no
theory developments, auxiliary-lemma chains, sorry'd data, `True` placeholders or global instance
removals.

- `lean-check` on the final Suggested.lean: exit 0; every diagnostic is
  `warning: declaration uses 'sorry'`.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: clean.
- `python3 scripts/check_blueprint.py` on the unchanged accepted packet: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables and own handoff:
  0 problems.
- `git diff --check`: clean.

## Remaining work

No mathematical or package defect remains identified by this review. Verification of the original
Schenzel and published Kawasaki proof locators remains a bibliographic limitation, explicitly
distinguished from the directly sourced statements and induction. It does not block a draft
roadmap. The packet is unchanged as required. The maintainer can proceed with the upstream draft
after this review is taken in; no second job was claimed.
