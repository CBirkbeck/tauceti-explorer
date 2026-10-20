# Independent review: cyclotomic completions and classical Habiro rings

**Verdict: accepted with the corrections below.** Codex, session
`codex-D6Racp`, reviewed issue #11436 on 2026-10-20. This is an independent
package review after FIX-PKG-HabiroCyclotomicCompletions~adv2, not that fix
worker's assessment and not a checkpoint. No mathematical defect remains
open in the package reviewed here. The Lean file records proposed theorem
statements; its successful elaboration is not a proof of those theorems.

## Corrections in this review

1. In §3.3 the obstruction to a unit being topologically nilpotent now
   explicitly uses the **p-adic ideal topology** and p-adic separatedness.
   The previous assertion for an arbitrary nonzero separated topological
   ring was false: 2 is a topologically nilpotent unit in the valuation
   topology of ℚ₂. For the stated ideal topology, a unit power in pB forces
   pB=B, contradicting separatedness of a nonzero ring. Added this negative
   control to the Checks.
2. Specified the topology for the continuous re-expansion map on B[[X]]:
   coefficientwise p-adic, equivalently (p,X)-adic. The coefficient formula
   and general complete separated coefficient-ring contract are retained.
   With B=ℤ₂ and c=−2, translating Xⁿ gives constant coefficient (−2)ⁿ;
   these converge p-adically but are not eventually zero. Added this test
   to exclude the topology with discrete coefficients.
3. Separated the bundled §6.3 Checks into individual tests of compatibility,
   idempotency, residues, Taylor kernels and coefficient reduction. Corrected
   subject/verb agreement in the exported Taylor contract.

Suggested.lean and metadata.toml needed no changes.

## Required ownership and ordinary-completion checks

| Requirement | Independent finding |
| --- | --- |
| Derived comparison removed from §5.5 | There is no `ordinaryDerivedComparison`, derived construction, or derived Check. §5.5 constructs ordinary factorial completion and gives an ordinary non-exactness example. |
| Correct owner | Scope, Downstream consumers and the Lean closing comment identify HabiroRings §2.4 as the receiver that constructs its derived comparison. |
| No incoming HR.2 edge | Enumerated the supplier contracts, each layer's Needs/Dependencies, §6.4 and the Lean closing comment. Inputs are pinned library contracts or earlier layers here. No incoming edge to HabiroRings derived material, RefinedTraceMethods or HabiroCohomologyFoundationsPartII remains. |
| Classical inputs preserved | §1.4 factorial topology, §2.3 Laurent comparison and §5.1 ordinary coefficient-module exactness are retained with their general contracts. They are outgoing inputs to HabiroRings §2.4. |
| Correct diagonal and family | Both use P_k, with k≥1. The counterexample fails exactness at the middle term for arbitrary ℤ[q]-modules. |
| No false exactness contradiction | §5.1 concerns M[q] for arbitrary coefficient modules M. §5.5 concerns all ℤ[q]-modules; its cokernel is not asserted to be a polynomial coefficient module. |

Here is the mathematical check of the last two rows. For
B=⊕_{k≥1}ℤ[q], reduction modulo P_N commutes with the direct sum. Thus its
completion is the submodule of ∏_{k≥1}H_ℤ consisting of families with finite
support modulo each P_N; the finite support can depend on N. Multiplication
by P_k in coordinate k is injective on ℤ[q], with cokernel
C=⊕_{k≥1}ℤ[q]/(P_k). The family x_k=P_k lies in the completed B because
k≥N makes its residue modulo P_N vanish. Its image in completed C is zero.
Regularity of P_k on H_ℤ makes the only possible coordinatewise preimage
equal to one in every coordinate. Modulo P₁=1−q this has infinitely many
nonzero entries in ℤ, so it is not a completed direct-sum family. In
contrast, ((q−1)^k) is not small in the full topology: its residues modulo
Φ₂ are (−2)^k, all nonzero. This confirms the replacement required by the
maintainer, rather than reusing the single-order adic example.

## Form, coverage and prerequisite closure

Read WORKERS.md, PROTOCOL.md, the expansion protocol, UPSTREAM_GUIDE.md and
PACKAGE_REVIEW.md. Compared the package with the AdicSpaces README and the
current ProfiniteArithmetic README, and read the corresponding representative
Lean files. The package has the opening Summary, scope, conventions, exact
contracts, six ordered layers, worked examples, downstream interfaces and
versioned bibliography. Every definition has an API and at least three
discriminating checks, sometimes together with its later worked example.
No source passage or section-by-section source synopsis has been introduced.
There is no queue, packet, job or review narrative in the roadmap.

The final README has 2,966 lines and 164,036 bytes, below the issue's 200 KB
limit. metadata.toml is exactly `topic = "math.NT"` with a trailing newline.

Read all three input packets: 48 parent nodes and 59 HC.4 nodes; HC.6 adds
no nodes and imports three parent interfaces. Checked the following coverage,
including the changes in ownership required by the present issue:

| Input target group | Package contract |
| --- | --- |
| HC.1 completion systems | §§1.2–1.5: actual polynomial indices, compatible families, finite quotients and regularity, complete topology, universal extension, mutually cofinal presentations, factorial and qᵐ−1 towers, coefficient/order maps. |
| Elementary q-toolkit | §1.1: integral finite definitions and identities; infinite series/products with explicit coefficient topologies; Jackson calculus and elementary plethystic operations. HC owns these and exports them to q-series consumers. |
| HC.2 coordinates and arithmetic | §§2.1–2.3: convergent factorial sums, unique bounded-degree digits, finite arithmetic with carries, the executable digit algorithm, q-inverse and Laurent comparison. |
| HC.3 roots and translation | §§3.1–3.3: actual cyclotomic root equations, Hasse coefficients, coefficient/order/Galois/power naturality, close-root criteria and convergent re-expansion. |
| HC.4 rigidity | §§4.1–4.4: adjacency and resultants, monic radical and chain arguments, finite-domain separation transfer, rootwise Taylor injectivity, domain/evaluation theorems and proper embeddings. |
| HC.4 finite Taylor comparison | §§4.5–4.8: universal root algebras, finite bases and filtrations, leading factors, graded and finite maps, determinants, signed adjugates, global reconstruction and local divisibility. |
| HC.5 ordinary modules and components | §§5.1–5.5: exact coefficient-module completion, products and finite-presentation comparison, comaximal components, localized coefficients and domains, actual completed-ring localization, ordinary diagonal counterexample. The former derived-comparison target is now explicitly owned downstream. |
| HC.6 applications/interfaces | Layer 6: integral values and coefficients, finite Taylor recovery and failed perturbation, localized/rational/characteristic-two projectors, and consumer contracts. |

The parent packet still lists two historical gaps. Its finite-domain
separation gap is closed in §4.3 by embedding a finite domain extension
into Rʳ after choosing a fraction-field basis and clearing denominators;
coordinatewise separation then transfers without Noetherianity. Its
individual-root evaluation warning is respected in §4.4: the theorem
requires the relevant cyclotomic irreducibility over Frac(R). The package
does not assert the unsound unrestricted printed form. The Z[2i] example
detects that distinction. The old elementary-toolkit and derived ownership
wording in the packets is superseded by the current ownership requirements;
no packet was changed in this review.

The issue's referenced report ending `~codex.md` is absent from this clone.
Read the available original and `~2` independent package reports and the
merged `~adv2` fix handoff instead. The original report's requests for
heavy Lean carriers predate the binding compact-file rule: all of their
mathematical contracts remain in the README and its closing omission list;
there are no fabricated carriers in the current Lean file.

## Current-upstream duplication and pinned-library audit

Screened all current TauCetiRoadmap and Completed roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the roadmaps added
after the atlas snapshot, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used objects and
hypotheses as well as names: polynomial quotient limits and monic
transitions, cyclotomic/factorial ideals and digits, q-binomial/Pochhammer
and Jackson operators, rootwise Hasse/Taylor maps, resultants, adjacency,
module completion and re-expansion. No additional owned target duplicates
were found; **no target was removed in this review**.

Read the generic inputs where there was a possible overlap. Current
ProfiniteArithmetic builds integer residue-ring limits, not the polynomial
cyclotomic systems here. Tau Ceti's PowerSeries/Evaluation module supplies
generic evaluation/division, not the new cyclotomic re-expansion target.
The existing complete separated ring category, polynomial coefficient-list
division and additive Pochhammer theory are correctly reused. Laurent
dilation is the existing `HahnSeries.embDomainRingHom`, not a new map
construction. These deferrals are already recorded in the boundaries and
supplier contracts. The Habiro family has no incoming roadmap dependency
requiring an upward-tier exception.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, read the actual statements for
cyclotomic factorization/base change/prime-power reduction/values at one;
monic division, AdjoinRoot and CRT; Hasse derivatives and Taylor coefficients;
continuous power-series evaluation; adic completion and separation;
resultants; Laurent localization; Tau Ceti complete separated products and
closed subobjects; and coefficient-list synthetic division. In particular:

- Monic division uses the monic associate of P_N. The list algorithm divides
  by qⁿ⁺¹−1 and negates the next residual quotient.
- AdjoinRoot root selection needs the cyclotomic equation; exact order in
  a ring with torsion is insufficient.
- The Noetherian-domain intersection theorem is not silently applied to an
  arbitrary domain. The explicit finite-domain transfer fills that use.
- `PowerSeries.eval₂Hom` has convergence and continuity hypotheses. §3.3
  now also specifies the topology of its target.
- Generic completion categories and Hahn embeddings remain supplied objects.
  Their cyclotomic specialization and the new arithmetic statements remain
  targets here.

## Fresh source checks

Fetched the six publicly accessible PDFs linked in the bibliography and
read the relevant passages directly. No restricted book was needed. The
public Louboutin theorem and its value-at-one lemma supply the resultant
statement; there is no claim to have freshly read an inaccessible Apostol
article. Prior source warnings about finite-extension separation,
single-root irreducibility, universal root coefficients, infinite tensor
products, determinant precision and q-series normalization were checked
against the mathematics rather than accepted from the previous verdict.

The 15 randomly sampled `Source:` clauses were selected before edits using
the seed `codex-D6Racp`; line numbers below refer to the input README.
All locators matched. Where a source supplies an argument rather than the
exact extended API, the README explicitly identifies the extra construction.

| Input line | Source locator checked | Contract checked |
| --- | --- | --- |
| 510 | H §3.1, (3.1), p. 1130 | Compatible quotient completion and its standard universal property. |
| 525 | H §3.1, (3.2), p. 1131 | Reconstruction from finite order subsets. |
| 663 | H §1 p. 1128; §4 p. 1136; H₀ §1 p. 3 | Full completion and factorial presentation. |
| 850 | H₀ proof of Lemma 3.1 p. 7; §1 p. 3 | Recursive monic digit expansion. |
| 897 | H₀ proof of Lemma 3.1 p. 7 | Finite division algorithm derived from that recursion. |
| 1051 | H §1 pp. 1128–1129; pinned Hasse/Taylor API | Integral Taylor coefficients without factorial division. |
| 1173 | H proof of Proposition 3.1 p. 1132; G §1.3 (9) p. 5 | Convergent translation and its topology correction above. |
| 1364 | H Proposition 3.1 p. 1132, Theorem 3.1 p. 1133, Corollary 3.1/Lemma 4.1 p. 1134, Theorem 4.1/Corollary 4.1 pp. 1135–1136 | Monic steps, chains and connected-order restriction. |
| 1487 | H Theorem 6.1 pp. 1139–1140; Conjecture 6.1 p. 1141 | Infinite-adjacency uniqueness, keeping the conjecture distinct. |
| 1502 | H Theorem 6.2 and proof pp. 1140–1141; §1 p. 1128 | Single-root evaluation with the required irreducibility repair. |
| 1523 | H Proposition 7.4 pp. 1144–1145 | Proper restriction and Taylor images. |
| 1748 | G §5.1 before (304) and (306), pp. 60–61 | Filtered finite Taylor maps. |
| 1927 | G §5.1 Proposition 5.2, (319), p. 63 | Finite image congruences and compatible reconstruction. |
| 2140 | H §7.3 Theorem 7.1 and proof p. 1144 | Polynomial modules; exactness is justified separately by the block argument. |
| 2254 | H §7.5 pp. 1145–1146; §1 p. 1128 | Rational and localized component behavior. |

Also checked H's remaining rigidity/localization arguments; G §5.1
(296)–(319), pp. 59–63, and Examples 5.6–5.7 (334)–(341), p. 66;
O Proposition 1.5 p. 3, Table 1/Proposition 2.1 p. 7, Propositions 2.2/2.5
and Corollary 2.6 p. 8, Proposition 2.7 p. 9, Definitions 5.4–5.5
pp. 26–27; L's theorem p. 75 and Lemma 1 p. 76; and W §2.1 Lemma 2.1
p. 8. The README already corrects the raw Nahm-series prefactor, distinguishes
finite from infinite coefficient change, uses n<N in the determinant product,
and excludes equal orders from the prime-power pair quotient formula.

Source SHA-256 receipts, in the bibliography's notation:

| Source | SHA-256 |
| --- | --- |
| H | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| H₀ v1 | `ae2ea5024a0a45e8eaf16b1bcaaf1c139cd7437aaa5a6ea9ff596e98b47e69d0` |
| G v2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| O | `6e1757b177f62808ef6ce3241dfe90de3831eb19d93a39c5afb7b41a43615955` |
| L | `dd47d31757c7097a03a64b26814db6795a70cdb7cfd6a767145eb16ff1b254d6` |
| W v5 | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |

## Adversarial mathematics and generality

Walked every subsection, including its identities, maps, conventions and
Checks. The following records the principal failure modes tested; unchanged
means the existing hypotheses or construction already exclude the defect.

| Statements/definitions | Instances or failure mode tested | Result |
| --- | --- | --- |
| q-integers, factorials, Gaussian/multinomial polynomials | n=0, k>n, q=0 and q=1, empty multinomial list | Integral recurrences and denominator-free factorial identities agree. |
| Finite/infinite Pochhammer and q-binomial/Euler identities | Empty products, nonzero constant, inverse factors and coefficient convergence | Separate coefficient topologies and inverses retained; no analytic convergence inferred. |
| Jackson operators and plethystic operations | Constants, q=0, q=1, twisted product rule; simultaneous q,t Adams change | No division by q−1 in the integral operator; rational denominators and positive substitution exponents are explicit. |
| Cyclotomic indices and topology | Empty S, zero ring, order zero, Φ₁=Φ₂ in characteristic two | Actual polynomial indices and correct zero completion; map directions and additive uniformity agree. |
| Factorial systems | N=0, leading sign, divisibility at order one, large powers | Monic associate used; positive orders stated; no false ideal-adic identification. |
| Normalized digits and finite arithmetic | Zero, P₁, degree boundary n, F² carries | Recursion uses the negative quotient; naive convolution is excluded. |
| q inverse/Laurent map | Empty telescope, first two factors, root value | q·Σ_{n<N}qⁿP_n=1−P_N; completion precedes Laurent extension. |
| Root evaluation and Hasse coefficients | Product coefficient rings, characteristic p, derivative factorial zero | Cyclotomic equation is explicit; Hasse coefficients retain torsion information. |
| Power substitution and naturality | Exponent zero; square map at order two; transported root algebra | Continuity needs positive exponent and the correct order set; no implicit equality of root rings. |
| Close roots and unit obstruction | Same root, p-power ratio, two cubic/sixth-root choices, ℚ₂ | Corrected ideal-topology hypothesis; adjacency of orders alone does not imply closeness. |
| Re-expansion | c=0, polynomial binomial expansion, c=−2 over ℤ₂, inverse/composed shifts | Corrected target topology; all evaluations retain convergence assumptions. |
| Cyclotomic resultants and adjacency | Equal orders, n=1, prime-power/non-prime-power ratios, p=2 | Distinct-order boundary and absolute resultant convention retained. |
| Monic relations/chains | Zero and unit witnesses, finitely generated ideal, disconnected S | Separation/completeness and chains inside S are required; no hidden Noetherianity. |
| Finite-domain separation and rigidity | Non-Noetherian domain, root already in coefficients, n divisible by 4 | Coordinate embedding transfers separation; odd-prime and 2-adic hypotheses remain explicit. |
| Evaluation uniqueness | Z[2i], cyclotomic splitting, arbitrary infinite order set | Frac(R)-irreducibility and infinite adjacency retained; conjectural claims not exported. |
| Proper Taylor image | (2−q)⁻¹ and (3−2q)⁻¹, re-expansion at −1 | Values 1/3 and 1/5 violate the required integral value; target is the actual embedded root algebra. |
| Universal Taylor collections | Root already in R, torsion R, zero ring, N=1 | Universal A_m(R) retained; ranks need nontriviality; zero-dimensional precision is handled. |
| Filtrations and graded comparison | Strict ml<N; exponent l−1; first nonzero leading term | Map direction and coefficient m^(2l−1)(l−1)! agree; vanishing is not upgraded to exact order in torsion rings. |
| Finite matrices, determinant and adjugate | N=1 through 7; signed determinant; both multiplication orders | Absolute determinant positive; signed adjugate gives δI on both sides; product ends at n<N. |
| Integral/rational image | ℤ-torsion, ℚ-algebra, incompatible finite preimages | Integral injectivity needs torsion-freeness; finite uniqueness supplies compatibility; rational isomorphism does not imply infinite tensor base change. |
| Local divisibility detection | Δ=±1, Δ=3, b=0, primes dividing Δ | Integer denominator clearing and nonzero Δ justify local tests; no general-DVR claim substituted. |
| Polynomial coefficient modules | Zero module, integer torsion, finite presentation, products/direct sums | Exactness follows compatible finite free block coordinates; unrestricted tensor/direct-sum identities are not asserted. |
| Component decomposition | Empty S, Δ=1, Δ=6, all orders invertible, ℤ×ℚ | Non-comaximality classes used over arbitrary rings; domain adjacency is not substituted for that equivalence relation. |
| Localized component domains | Root orders involving inverted primes; Galois action on factors | Domain argument uses the explicit finite étale/Galois bridge, not p-adic separation at an inverted prime. |
| Restriction versus localization | Union of components, singleton factor, excluded nonunit denominator | Actual localization at the projector is stated; fraction-ring equalities specify embeddings. |
| Arbitrary-module completion | P_k diagonal, P_k null family, ones modulo P₁, old (q−1)^k family | Correct non-exactness at the middle term, as proved above. |
| Reference examples | Orders 1–6; q−1 versus 1−q; altered ten jets; odd/companion projectors; characteristic two | Finite residues, signs, matrix inverses and idempotents agree; expanded §6.3 Checks distinguish values from Taylor series. |

An independent exact-rational polynomial calculation passed **324 assertions**.
It constructed the finite Taylor matrices from polynomial Hasse coefficients,
rather than from the displayed matrices, and checked their absolute
determinants against the independent graded resultant/leading-factor product.
For N=1,…,7 these are
1, 1, 4, 216, 1327104, 99532800000 and 1444408272617472000000.
It also checked Gaussian factorial identities, Jackson's twisted product
rule, cyclotomic resultants including order one, leading Taylor factors,
the telescope, factorial carries, root values through order six, the ten
Fishburn coefficients, the seven coefficients at −1 and three at a cubic
root, the perturbed precision-five inverse, both projector digit vectors,
finite idempotents and the factorial null-family residues. These bounded
calculations support the convention checks; the infinite statements were
checked by the arguments and hypotheses above.

## Lean and final validation

Suggested.lean has 332 lines, 11 light definitions with real bodies,
15 sorry-proved theorem targets and 22 proved examples, two per definition.
It imports Mathlib once, uses the roadmap namespace and layer comments,
and contains no sorry-defined data, fabricated carrier, auxiliary development,
admitted example or meaningless proposition. Every README definition is
represented by a declaration or grouped in the closing comment. Heavy
completion/filtration/category targets stay in the README.

Compared all 15 theorem signatures, not just the required sample of ten:

| Lean targets | README comparison |
| --- | --- |
| `qFactorial_pochhammer`, `qBinomial_factorial`, `qMultinomial_factorial`, `finite_qBinomial` | Integral polynomial identities, empty cases and k≤n boundary; the finite product uses the correct minus sign. |
| `jackson_leibniz`, `jackson_at_one` | Correct q-twisted factor, arbitrary commutative coefficient ring and ordinary derivative at q=1. |
| `factorialPoly_cyclotomic_factorization`, `cyclotomic_pow_dvd_factorial`, `factorial_cofinal` | Leading sign and positive order, actual polynomial-generated monoid and full cofinality. |
| `factorial_root_power_dvd`, `factorial_telescope` | Positive root order, N≥mk and k=0 allowed; telescope includes N=0. |
| `factorial_taylor_vanishing`, `factorialSum_taylor_stable` | Root equation ζᵈ=1, d>0, N≥d(k+1), and N≤M where needed. |
| `factorial_taylor_leading` | Positive m,l, universal AdjoinRoot coefficients, stated coefficient and lower vanishing over any commutative ring. |
| `factorialPoly_smul_injective` | Arbitrary R-module, including torsion and zero; unit leading coefficient gives polynomial-module regularity. |

Validation completed:

- `lean-check` on the package Suggested.lean: exit 0, zero errors,
  exactly 15 warnings, all `declaration uses sorry`.
- `python3 scripts/check_blueprint.py` on each of the parent, HC.4 and HC.6
  packets: exit 0, zero errors and zero warnings. Packets were not edited.
- `python3 research/blueprint/intake.py check-files` on the four package
  files, this report and the handoff: zero problems.
- JSON and TOML parse, file-size/shape checks and `git diff --check`: pass.

No unfinished package repair or checkpoint continuation is requested. The
historical packet reconciliation is outside this review's authorized paths.
