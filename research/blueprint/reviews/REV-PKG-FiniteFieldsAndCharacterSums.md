# Independent package review: FiniteFieldsAndCharacterSums

Review job: `REV-PKG-FiniteFieldsAndCharacterSums`, issue #10899. Reviewer: Codex,
session `codex-UOy17G`, 20 October 2026. The package was written by a different
session (`codex-edi9is`, #10766 / #11472); this reviewer did none of that job.

## Verdict

**needs_changes.** This is a completed fixing review, not a checkpoint. The
local corrections below are applied. The package is not ready for an upstream
draft PR because some exact supplier extensions have no matching target with
the necessary generality, its ComputationalNumberTheory dependencies have no
established publication order and overlap its own ownership, and the exact
Gamma multiplication proof route retains unverified source locators. These
are substantive closure defects, not failures of Lean elaboration.

The statements and their full generality remain in the README. Accepting the
package must await the supplier/ownership work in the handoff below; replacing
these theories with a conditional headline or an application-specific special
case would not resolve the review.

## Scope, fidelity and form

Read WORKERS, PACKAGE_REVIEW, PROTOCOL (including §§5, 13, 15 and 20), the
expansion protocol and UPSTREAM_GUIDE. Read the five accepted packets, the
package and its author's handoff, and the reviewed AUDIT-19 library coverage.
AlgebraicCodingTheory and Completed/EffectiveBounds README/Suggested files were
the two current upstream models. The package has the required summary,
boundaries, conventions, supplier contracts, six ordered layers, examples,
dependencies, downstream consumers and references. Its mathematical prose and
source locators are in its own words; this review adds no source passages.
`metadata.toml` remains the fitting single line `topic = "math.NT"`.

The five packets contain 444 nodes. The package retains 437, defers seven to
existing suppliers and adds two explicit prerequisites (norm-one Lang sheaf and
Schoof's auxiliary-prime cutoff), giving 439 target subsections. I compared the
statement inventory: 385 accepted statement strings are present exactly; the
59 exceptions consist of the seven deferrals, mathematical cross-reference
rewrites, removal of extraction/process terminology, and the author's explicit
prime hypothesis, integral-exponential coefficient and correlation-conjugation
corrections. No further accepted target was dropped in this review. Definitions'
APIs and Checks were inspected, including the characteristic, degree, support,
nontrivial-character, squarefreeness and finite-field tower hypotheses.

The new coefficient-pairing Checks cover a definition previously embedded in a
theorem paragraph. The README now has 122 Checks blocks (including theorem
controls); every definition block's existing set of at least three tests is
retained. No packet, accepted reader, other package or ownership registry was
edited.

## Corrections applied

1. **Terras adjacency.** The Lean matrix used only the distance condition and
   therefore had diagonal 1 at parameter zero. The README's simple graph has
   no loops. Added `z ≠ w` to the matrix entry and a proved delta-word test
   showing its diagonal action is zero for every parameter. The README Check
   now states this negative control explicitly.
2. **Definition examples.** Replaced automatic zero-map tests by proved tests
   of a single linearized monomial, the positive root value of the prime-field
   trace character, its canonical-character comparison, identity-extension
   norm/trace lifts, prescribed-degree projective evaluation of X, the nilpotent
   quotient's top coefficient, nonconstant RS evaluation, the repetition word,
   cyclic shift direction, trace/geometric words, Hermitian evaluation and code
   words, a norm-one nonmember and a nonzero principal-series sum over F3.
   All examples are proved; none uses an admitted theorem.
3. **Quotient pairing API.** Named `quotientTopCoefficient` in the README and
   added its reduction and linearity API. Checks distinguish the fixed top
   coefficient from constant/leading coefficients and distinguish multiplication
   followed by quotient reduction from a coordinate dot product.
4. **Dwork coefficient contract.** Mapped the input to the actual all-prime
   RD.1.64 target. Explained the finite-product derivation of the q-series bound:
   weighted degree n implies total factor degree at least n/p^(f−1). The norm
   estimate therefore follows by ultrametric coefficient convolution. This
   removes the unnecessary stronger coefficient request to RD.6.
5. **Dwork sources and remaining scope.** Replaced the unavailable Robert book
   locators for coefficients and splitting by the public 2001 article,
   Appendices 1–2, printed pp.167, 169. Identified RD.6.46's actual odd-prime
   splitting export, and marked precisely the missing p=2 extension. The
   Hasse–Davenport route uses the corrected distinction throughout.
6. **Other source/denominator precision.** Expanded the extremal curve
   cohomology citation from Deligne 1.18(b) to 1.18(b)–(d), pp.178–179. Marked
   Milne's local-ring Hensel result as the prototype for the README's stated
   Jacobson-radical generalization. Restricted the divided irreducible-count
   restatement to n≥1, retaining the undivided n=0 assertion. Explicitly marked
   the Cohen Gamma-route locators as unverified; Conrad's product identity
   alone does not verify that proof route.

## Fresh source checks

The package author's flagged Robert and Cohen locators were all addressed.
The cleared-library index does not clear Cohen II or Robert's 2000 book; no
other copy was read. Robert's freely available 2001 paper was read directly,
including rendered printed pages 167 and 169. Appendix 1 has the precise
q-series coefficient estimate. Appendix 2 has the finite-product identity,
primitive-root normalization and trace-character values, including p=2.
Cohen II, Theorem 11.6.14 (pp.372–375), Lemmas 11.7.12/11.7.14 and
Corollary 11.7.15 / Theorem 11.7.16(1) (pp.390–395), remain unverified and are
now explicitly marked at both consuming targets. The public Robert article
does not by itself certify the exact L3 multiplication theorem.

A reproducible random sample used `random.Random("codex-UOy17G")` on the
original package's ordered See-lines; the following 15 nonflagged targets were
read in their public primary sources. Page numbers are printed pages unless
stated otherwise.

| Target | Source location inspected | Result |
| --- | --- | --- |
| Power sums detect enumerations | [Shallue](https://arxiv.org/pdf/1211.6044v1), Ch.1, Lemma 1.4, p.9 | Matches the enumeration criterion, with the field characteristic retained. |
| Trace modulo an odd prime | [Sutherland, Lecture 8](https://math.mit.edu/classes/18.783/2023/LectureNotes8.pdf), Algorithm 8.3, pp.4–5 | Matches the returned trace and torsion tests; odd characteristic and excluded auxiliary primes remain. |
| Hensel uniqueness modulo I^k | [Milne, ANT](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Lemma 7.35, pp.121–122 | Local-ring source verified; general-ring nilpotent/Jacobson-radical extension is the local argument in the README, now distinguished. |
| IPT correctness | [Shoup v2](https://shoup.net/ntb/ntb-v2.pdf), §20.1, pp.522–523 | Algorithm and correctness match. |
| Berlekamp B2 round | Shoup §20.5, p.541 | Samples all basis coefficients uniformly; it does not choose just one basis vector. |
| SFD cost | Shoup Theorem 20.5, pp.528–530 | Matches the ring-operation cost claim; supplier semantics are still required. |
| Complex Gauss norm | [Kowalski](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf), Proposition 2.4, p.18; [Conrad](https://kconrad.math.uconn.edu/blurbs/gradnumthy/LfunctionGaussJacobi.pdf), §1(1), p.1 | Matches, with both characters nontrivial as appropriate. |
| Minimal trace rank | [Wu–Liu v2](https://arxiv.org/pdf/1211.5475v2), Theorem 5.1(3), p.18, proof pp.19–21 | Rank-length decomposition and independence match. |
| Irreducible recurrence period | [Goresky–Klapper 2009](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), Corollary 6.2.2, p.159; Proposition 6.6.5, p.171 | Matches nonzero solutions; reciprocal characteristic-polynomial convention remains explicit. |
| Schoof | Sutherland Algorithm 8.1, p.1; [Schoof](https://www.numdam.org/article/JTNB_1995__7_1_219_0.pdf), §5, pp.233–235 | Prime cutoff, CRT/Hasse interval and polynomial-cost route match. |
| Stepanov auxiliary function | Kowalski §4.3, Δ and (4.31), p.62 | Matches the strict dimension inequality and nonzero auxiliary function. |
| Canonical additive character | Kowalski Proposition 1.13, p.14; [Conrad](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf), Definition 2.1, p.1; [Katre](https://www.bprim.org/sites/default/files/jacn.pdf), §1, p.75 | Positive exponential and absolute trace match; Katre's standing odd-prime scope is not used to exclude p=2 from the general definition. |
| Mixed Weil estimate | Kowalski Ch.3 introduction, p.31 | Matches the degree coefficient and nondegeneracy hypotheses. |
| RIP expectation | Shoup Theorem 20.2, pp.523–524; Theorem 9.3 / Example 9.10, pp.288–289 | Independent uniform attempts and the geometric tail calculation match. |
| Extremal curve cohomology | [FKMS v3](https://arxiv.org/pdf/1712.03173v3), §4.1(4.2), p.11; [Deligne](https://publications.ias.edu/sites/default/files/Number32.pdf), 1.18(b)–(d), pp.178–179 | Corrected locator: (b) handles H0, (c) duality, (d) the top coinvariants and twist. Rendered p.178 was inspected. |

Additional direct checks: Conrad Appendix (A.6), p.19, verifies the final
Hasse–Davenport identity; Robert (2001), Appendices 1–2, resolves the flagged
Dwork sources. Source retrieval receipts (SHA-256) include Robert
`2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581`,
Shoup `8e1abc54f4510c3f274dfbed07ea602a6a439ee24b2c916e61abe829b402ec06`,
Deligne `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6`,
and Schoof `25bb61877af10d60b2195e572844ad09be4f1cd6982afb0959aa8f10696efcad`.
These receipts identify inspected editions; they do not assert verification of
all bibliography entries.

## Adversarial mathematics pass

Walked every target's statement, hypotheses and convention, then the definition
APIs and Checks. The table groups the pass by mathematical family; it records
small/degenerate instances and hypothesis checks, not a claim to have proved
all proposed theorems.

| Statements/definitions checked | Instances and failure modes considered | Finding |
| --- | --- | --- |
| Presentations, residues, embeddings, tensor coordinates, normality and intermediate fields | f=1, f=X, degree one, p dividing extension degree; gcd/lcm tensor factors; inverse congruences and relative q-Frobenius | Positive-degree/monicity guards and relative exponents retained. No new defect found. |
| Monic, irreducible and squarefree censuses; prescribed constants | degree 0/1, constant 0, X³=X·X², q=2 | Degree-zero conventions retained; divided inequality now explicitly uses n≥1. |
| Linearized/Ore/subspace polynomials and reduced endomorphisms | zero vs constant polynomial, p=2, nonperfect coefficient algebra, n=1 | Support/exponent and composition conventions agree; Frobenius need not be invertible. |
| Characters, Fourier transport, Gauss/Jacobi conventions | trivial characters, q=2/3, positive phase, zero extension and shifted dual frequency | g(1,ψ)=−1 and J(1,1)=q−2 retained; stronger proved character examples added. |
| Hasse–Davenport, digits, Stickelberger and Gamma | m=1, b=0, endpoint exponent, p=2, trivial Gauss factors | Exact Gamma equality cannot follow from equality of residues of p-power roots. Existing safeguard retained; source and binary supplier gaps remain. |
| Projective evaluation and coefficient pairing | ambient degree 2 with X, nilpotent X mod X², X² mod X²+1 | Added discriminating proved tests/API; top coefficient is fixed by ambient degree. |
| Polynomial L-series and quotient-ring functional equations | constant coefficient, zero reciprocal-root list, primitive vs trivial characters; nonunit Fourier coefficients over Z/4 | Ring primitivity and constant-field nontriviality are essential; no reducedness shortcut introduced. |
| Stepanov pole-degree and norm arguments | coprime degrees, singular affine models, positive auxiliary dimensions and p-power multiplicities | Coordinate-ring subspace is distinguished from full normalization Riemann–Roch space. |
| Artin–Schreier/Kummer curves and sheaves | trivial AS phases, scaled additive characters, perfect vs imperfect residues, order-one characters | Scaling bf before pole reduction and geometric local conductor hypotheses retained. |
| Deligne estimates, universal families, hyper-Kloosterman | d=1, n=1, k=1, zero/nonzero product parameter, trivial-character exclusions | Clean duality, actual coefficient schemes and zero-stalk conventions remain explicit; requested geometric extensions are not supplied by naming them. |
| Betti, Lang–Weil, Albanese and Chebotarev | dimension 0/1, singular/nonreduced fibers, bounded presentations, constant-field coset and r-th Frobenius | Genus bound is not used in higher dimension; twists must be formed separately over each extension. Closure gaps below remain. |
| Trace correlations and Möbius stabilizers | trivial/geometrically constant factors, Jordan blocks, boundary stalks | Full Frobenius action on coinvariants retained; arithmetic semisimplicity is not assumed. |
| SFD/DDF/IPT, EDF/B2 and certificates | f=1, degree one, single irreducible factor, even q, all coefficient-vector draws | Correctness and probability statements retain their separate domains; generic cost semantics remain missing. |
| Hensel lifts | unit ideal, k=1, nilpotent quotient, general adic ring vs local ring | Degree/monicity guards retained; source generalization clarified. |
| Schoof and point-count certificates | small q, excluded primes 2,p, nonsquare auxiliary, singular vs elliptic model, projective boundary | CRT uniqueness uses product greater than 4√q; current Hasse theorem is imported. |
| Galois rings and principal units | length 0/1, residue degree 1, p=2, n=3, k=0 and k≥n−1 | Zero-ring exceptions and binary unit decomposition retained; factorial coefficients are reduced only after p-integrality. |
| Permutations and recurrences | zero polynomial, f=X, constant polynomial, nonzero solution, reciprocal characteristic convention | Root/order and period guards retained. |
| Walsh, Gold/Kasami, GMW and d-forms | trivial ψ, zero word, period-three shifts, h a Frobenius power vs general coprime exponent, scalar zero | Existing explicit conjugation witness retained; direct shift/trace/feed examples added. General GMW autocorrelation does not assert general shift-and-add. |
| MDS/RS/GRS/BCH, cyclic and AG codes | zero code, k=0/1/n, repeated points, degree-zero divisors, cyclic shift and dual reciprocity | Nonzero-code minimum-distance convention and injectivity/support guards retained; nonconstant and repetition tests added. |
| Hermitian code | l=0, l<p−1, p=2 and noninjective evaluation beyond the degree bound | Finite dimension sum retained; polynomial-to-native-place comparison still requires its exact supplier interface. |
| Norm torus, Hecke and Terras spectra | q=3, trivial characters, two exceptional parameters, diagonal at a=0 | Corrected actual adjacency defect; principal-series test equals 2 over F3. |
| Integer phases, quadratic counts, good-prime lifts, Shamir | bad/small primes, p=2, discriminant zero, zero gradient, t=1, zero/repeated labels | Distinct hypotheses prevent false square-root/privacy claims; existing F5 share witness (4,0,1) remains proved. |

## Current-library duplication and ownership

Inspected the current upstream roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including Completed and the nine
post-snapshot roadmaps named by WORKERS. Searches used mathematical carriers,
operators and hypotheses (quotient fields and q-Frobenius; character/Gauss
identities; torsion/point counts; Witt coordinates; recurrence operators;
code submodules/duality; homogeneous spaces), followed by reading matching
statements. IntegralLattices' finite-quadratic-module Gauss invariant is a
different object; PolynomialGaloisGroups' Rabin-paper probability lemma is not
the Rabin certificate criterion; generic AlgebraicCodingTheory explicitly
leaves the specialized code families here.

No additional exact current-library duplicate was found requiring removal in
this review. The author's seven deferrals were checked and retained solely as
boundaries: Artin–Schreier/Kummer fields (AlgebraicCurves Layer 10), point
Frobenius (EllipticCurves Layer 3 / Mathlib Point.map), naive elliptic count and
Hasse bound (Tau Ceti's pointCount and HasseBound APIs), cyclic logarithm
(Mathlib zmodMulEquivOfGenerator), and shared-key powering (pow_mul_comm).
The arbitrary finite-ring primitive Gauss theorem remains a proper extension
of Tau Ceti's primitive Dirichlet-character theorem over ZMod. Certified
normality, relative tensor coordinates and arbitrary-parameter Dickson laws
likewise state their additions to existing services.

The pinned APIs used by the Lean declarations were checked in the shared
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` sources. The current-library audit
supersedes AUDIT-19's old assertion that Hasse's bound is merely conditional.

## Remaining defects and handoff

The exact consumer contracts are already localized in the README; these are
not instructions to edit other jobs during this review.

| Gap | Evidence and affected target | Required resolution before acceptance |
| --- | --- | --- |
| Computational semantics and ownership/order | `contract-P-R21` / `contract-F3-R01` request unit-cost ring programs, uniform sampling, PMF tails and expectations. ComputationalNumberTheory §§0.1–0.7 provide an integer RAM/bit-cost model instead; CN.0/1 also plan the same Rabin presentations, finite-field factor certificates and Hensel algorithms. CaraianiNewton's opening excludes both roadmaps from its 88-roadmap order and moves elementary FF.1 services to AN.1. | Establish one owner for the overlapping algorithms, give a named generic ring-operation/randomness refinement target, and register a valid bottom-up order or bundle for the remaining CN.0/CN.5 uses. The existing CN.5 dataset replay title alone does not supply the requested generic finite-verification schema. |
| Geometric conductor extension | `contract-P-R11` / `contract-F2-R10` need complete DVRs with algebraically closed residue field, break decomposition, integrality and tensor bounds. AGR conventions and §§3.1–3.2 use the finite-residue local-field ramification supplier; AlgebraicCurves expressly excludes that upper-numbering import over infinite residue fields. | Supply the equal-characteristic complete-DVR extension or a proved unramified-base-change bridge, with named targets covering geometric AS breaks, Kloosterman monodromy and correlation conductors. Finite residue field results alone do not close it. |
| General Albanese–Weil comparison | `contract-F2-R15` requires the rational-map universal Alb_w of a general projective integral variety and normal-projective Picard/Tate/section comparisons. AbelianSchemesAndArithmeticModuli A2 and the current JacobianChallenge supply abelian-scheme/Picard and pointed-curve Albanese services, not that construction; the current IsAlbanese predicate is not its existence theorem. | Register/deliver the stated Part II extension with Ghorpade–Lachaud 9.4/9.6 hypotheses. It is needed by the top-weight spectrum and Bombieri–Sperber expansion, not replaced by the curve Jacobian. |
| Binary Dwork splitting | RD.1.64 includes p=2, but RD.6.46/6.48 explicitly assume odd p. `contract-F1-R02` consumes splitting for every prime. | Extend the actual native series/Teichmüller/trace identity and compatible-root statement to p=2; Robert (2001), Appendix 2, p.169 is now a checked source. Do not extend the odd-prime pi↦−pi dictionary unchanged. |
| Exact Gamma route source | The two FF.1 digit/product-completion targets cite unverified Cohen II multiplication locators. Conrad Appendix (A.6) checks the final product formula, not the exact L3 proof. | Verify the cleared source when available or replace with a directly checked public source for the exact Gamma multiplication quotient and its hypotheses; confirm the exact L3 exports used in the proof. Preserve the all-prime result. |

Other contracts remain delivery gates, not certified existing exports: SF.0's
bounded projective closures, SF.4's relative equivariant AS surface resolution,
LPV.0's general-base local acyclicity/global-local comparison, RD.6's explicit
Adolphson–Sperber Euler-degree comparison, and the native Hermitian
point/place/Riemann–Roch comparison. Their exact obligations are preserved;
the present review does not certify closure of these requested Part II
extensions. In particular AlgebraicCurves' general AS genus theorem and
Hermitian translation subgroup do not by themselves name the full native
coordinate/place comparison required here. General six-operation and weight
suppliers must also land with the stated coefficient and embedding conventions.

Resume with the supplier table above, rather than repeating the repaired
coefficient-source work. The package retains all 439 targets. There are no
ownership moves or target removals newly made by this review. The review report
is the handoff; no separate unlisted handoff file was edited. No suspicious
instruction-bearing text was encountered in the sources or claim thread;
external texts were used only as evidence.

## Validation

- Final `lean-check` exited 0 at the prescribed pins: 57 warnings, all
  `declaration uses sorry`; no other warning or error. The file has 1,032 lines,
  38 light real-bodied definitions/abbreviations, 57 milestone theorems and 40
  proved examples. No data carrier, data instance or example is admitted.
  Available memory before this compile was 80 GB. No language server, new Lake
  project or library build was used.
- Signature checks against the README included Rabin's monicity/positive
  degree, factorization over extensions, tensor-product coordinates, normality,
  Gauss census, Hasse–Davenport lifting/product, projective two-point fibers,
  arbitrary finite-ring primitivity, nonreduced quotient pairing,
  hyper-Kloosterman positivity/nonzero parameter, RS dimension/MDS,
  principal-two-unit ranges, GMW tower/coprime conditions, Hermitian finite
  dimension/degree range, Terras spectral exceptions, integer-polynomial bad
  primes, nonsingular lifts and Shamir reconstruction/fiber bounds. Heavy
  sheaves, schemes, algorithm constructions and native comparison targets
  remain in the README and the closing Lean comment.
- All five unchanged packets passed `scripts/check_blueprint.py` with zero
  errors and warnings. The four changed deliverables passed
  `research/blueprint/intake.py check-files` with zero problems.
- `git diff --check` passed. Only README.md, Suggested.lean, review.json and
  this report are changed. Metadata and all packet files are unchanged.
