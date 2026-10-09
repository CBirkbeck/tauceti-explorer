# Independent package review: effective residual comparisons, round 2

Job: `REV-PKG-EllipticCurveModularityPartII~2`, issue #7928. Reviewer: Codex,
session `codex-FKfhnp`. Date: 2026-10-09. This reviewer authored neither
`PKG-EllipticCurveModularityPartII` nor `PKG-EllipticCurveModularityPartII~2`.

**Verdict: accepted.** All six package requirements hold after the small
corrections below. The revised suggested file remedies the previous review's
missing definitions, APIs, examples and native target signatures. This is a
completed independent package review.

## The six requirements

| Requirement | Result and evidence |
| --- | --- |
| Upstream form | Pass. Read WORKERS, PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE; compared with current upstream JacobianChallenge, ModularForms and EllipticCurves. The README states motivation, scope, conventions, six ordered layers, precise targets, construction routes, sources, prerequisites and definition APIs with discriminating examples. Its final UTF-8 size is 64372 bytes, below 200 KB. |
| Fidelity to the accepted plan | Pass. Independently read all 31 target entries, all 66 imports and their supplying statements and hypotheses, and the two supplementary Mathlib references. Counts by layer remain 4, 2, 4, 5, 5 and 11. Target statements occur verbatim from the plan, except that the Chen target's ownership parenthesis is expressed as a separate prerequisite paragraph. This is fidelity to the plan, not quotation from a source. No target range or mathematical owner changed. |
| Own words and precise sources | Pass. The mathematical exposition is organized by dependencies and applications; it contains neither source passages nor a section-by-section source summary. Read the relevant source statements and arguments in the six editions listed below. Target and definition citations identify theorem/equation, section and page. |
| No programme process | Pass. The README contains no job IDs, review verdicts, checkpoints, packet paths or coverage statuses. Its supplier names and mathematical prerequisite explanations identify owners and inputs. |
| Suggested declarations and elaboration | Pass. All 31 target blocks have meaningful native signatures; all eight displayed definition families, their 27 API lemmas and 29 labelled examples are present. Final `lean-check` exited 0 with zero errors and 238 warnings, every one `declaration uses sorry`. |
| Metadata | Pass. The file is exactly `topic = "math.NT"` followed by a newline, fitting these arithmetic and modularity results. |

## Corrections made in this review

The minimal regular proper model was incorrectly attributed in a Lean comment
to EllipticCurves Layer 4.5b, whose scope is equation-level models. Corrected its
supplier to current upstream StableReduction Layer 5. Identified the projective
Weierstrass scheme and scheme group law as ModularCurves layers 1A and 1D,
including the native point comparison. The README now states these geometric
prerequisites alongside the existing conductor supplier
`ArithmeticGaloisRepresentations:R01.3`. These are clarifications of supplying
interfaces, not new local developments or a transfer of ownership.

Added the standing irreducibility hypothesis to the auxiliary
`weight_two_reduction_alternative`. Kraus §3.1, pp.1142–1143 sets that hypothesis
before identifying weight two with the local reduction alternative for primes
at least 11. The README's proof route now retains it. The adapter at primes 5
and 7 continues to require the explicit reduction alternative; its signature
was not strengthened or replaced by the weight calculation.

## Resolution of the previous signature rejection

Checked the earlier independent report and the revision handoff against the
actual declarations, rather than relying on the revision's inventory. F and H
now have their definitions, all seven formerly missing API signatures and all
six formerly missing example signatures. `newDimension` is the actual complex
finrank of the trivial-character part of the native weight-two newspace;
`dimension_comparison` identifies Martin's arithmetic expression with it.

The native elliptic interfaces use geometric Weierstrass torsion, coordinate
Galois actions, stable submodules and scalar extension for irreducibility,
native isogenies with their actual geometric kernels, and geometric
endomorphisms for non-CM. The newform interface uses normalized native
weight-two newforms, their Fourier coefficients, generated coefficient fields,
rings of integers and residual primes. Its coefficient congruences are not
substitutes for residual-representation isomorphisms.

The conductor preview specifies Ogg's formula on the minimal regular geometric
special fibre and the full residual Artin sum, including lower ramification
groups and Swan terms. The weight preview specifies finite flat group models
of the same geometric torsion. The deletion level, prime-to-ell conductor and
weight calculation remain separate notions.

The modular-curve targets use normalized scheme fibre products, the p-local
Atkin–Lehner involution, native abelian varieties and Jacobians, and actual
pullback/pushforward maps. The winding annihilator acts on rational singular
homology with a specified period pairing. Its full-new quotient and the
optimal mixed quotient have separate integral lattices and an isogeny
comparison. Nonzero dimension, finite rational points and formal immersion
are conclusions, not defining fields. Old-part vanishing is distinct from the
separately imported Chen isogeny on the new quotient.

Formal immersion specifies the real cyclotomic field, a prime above q, the
chosen cusp section, the smooth integral source and Néron target, the
generic-fibre comparison, and surjectivity of the actual completed-stalk map.
The torsion theorem retains its broader p-range. The j-formulas compare an
actual modular coordinate and j-morphism, and the finite-image certificates
quantify over every prime p>37. No empty admitted `Prop` definition, freely
chosen target proposition or phantom geometric carrier replaces a target.

## Target correspondence and boundaries checked

Names are in `TauCeti.EffectiveEllipticComparison`, except `norm_bound` in
`EllipticCurveModularityPartIIAcceptance`. Every row passes statement,
hypothesis, source, prerequisite and suggested-interface checks.

| Target | Suggested declaration(s) and checked boundary |
| --- | --- |
| `EC.1/krausF` | `krausF`: square root before the power; actual trivial-character dimension. |
| `EC.1/krausG` | `krausG`: index at lcm(N,4), real division, exponent two. |
| `EC.1/krausH` | `krausH`: maximum of F and G; strict comparisons. |
| `EC.1/martin-bound` | `martin_bound`: positive level, equality exactly at 35 or primes 11 modulo 12. |
| `EC.2/norm-bound` | `norm_bound`: nonzero integral element, prime above ell and all complex embeddings. |
| `EC.2/removed-prime-bound` | `removed_prime_bound`: ell at least 3, irreducibility, removed prime distinct from ell, valuation divisibility and deletion level. |
| `EC.3/finite-rationality` | `rationality_from_small_primes`: normalized weight two and trivial character; finite prime tests through the index bound. |
| `EC.3/small-prime-integrality` | `small_prime_integrality`: exact residual conductor, weight two, residual isomorphism and strict F. |
| `EC.3/rational-newform-curve` | `rational_form_elliptic_realization`: exact conductor and integral coefficients; irreducibility for the residual comparison. |
| `EC.3/kraus-rational` | `kraus_rational_realization`: ell at least 5, irreducibility, weight two and strict F at the residual conductor. |
| `EC.4/finite-mod-four` | `finite_mod_four`: point counts at odd good primes and the finite lcm(N,4) bound. |
| `EC.4/small-trace-transfer` | `mod_four_trace_transfer`: full rational two-torsion, exact conductor, residual isomorphism and strict G. |
| `EC.4/two-isogeny-repair` | `two_isogeny_repair`: degree one or two, unchanged conductor and odd-primary comparison. |
| `EC.4/kraus-full-two` | `kraus_full_two_realization`: full two-torsion, weight two, irreducibility and strict H. |
| `EC.4/quotient-conductor-adapter` | `deletion_conductor_away`, `deletion_level_exact_adapter`, `weight_two_reduction_alternative`: away-from-ell identity, explicit local alternative and the separate weight implication. |
| `EC.5/mazur-prime-isogenies` | `mazur_prime_isogeny_classification`: twelve prime degrees, eight non-CM degrees, geometric non-CM. |
| `EC.5/two-torsion-isogeny-exclusions` | `cyclic_two_prime_exclusion`, `cyclic_four_prime_exclusion`: separate composite classification, stated prime ranges. |
| `EC.5/two-torsion-kernel-transport` | `two_torsion_kernel_transport`: odd ell, stable cyclic kernel and dual two-isogeny construction. |
| `EC.5/irreducible-full-two` | `irreducible_full_two`: full rational two-torsion, ell at least 7 and the absolute-irreducibility conclusion. |
| `EC.5/irreducible-one-two` | `irreducible_one_two`: a nonzero rational two-point, ell at least 11 and absolute irreducibility. |
| `EC.6/nonsplit-potential-good` | `nonsplit_potential_good`: nonsplit normalizer and p at least 5; includes the place p. |
| `EC.6/chen-correspondence` | `chen_correspondence`: five r-levels, p outside that set, p-local involution and away-p Hecke action; new-quotient isogeny is separate. |
| `EC.6/rank-zero-quotient` | `finite_winding_quotient`: nonzero optimal quotient, finite rational points and Hecke-stable kernel. |
| `EC.6/cuspidal-formal-immersion` | `cartan_cusp_formal_immersion`, `cartan_point_torsion`: p>37 for formal immersion, broader torsion range, specified cusp and integral models. |
| `EC.6/j-prime-integrality` | `cartan_denominator_exclusion`: five r-levels, p>37, nonsplit image and integrality away from p. |
| `EC.6/j-integrality` | `integral_j_proper_image`: geometric non-CM, rational cyclic isogeny, p>37 and proper image. |
| `EC.6/integral-isogeny-j-values` | `integral_j_characterisation`: actual modular coordinate; nonzero rational parameter and signed constant-term divisors. |
| `EC.6/large-proper-image` | `proper_image_nonsplit`: geometric non-CM, p>37 and separate exceptional/split exclusion inputs. |
| `EC.6/surjectivity-twist` | `quadratic_twist_surjectivity`: actual quadratic twist and p at least 5; no p=3 export. |
| `EC.6/finite-image-certificates` | `finite_image_certificates`: six non-CM large-level j-values and the five integral sets; every prime p>37. |
| `EC.6/lemos-surjectivity` | `lemos_surjectivity`: geometric non-CM, nontrivial rational cyclic isogeny and every prime p>37. |

The eight definition families have API/example counts respectively 3/4,
3/4, 3/3, 3/3, 4/3, 4/4, 4/4 and 3/4: local factors, Martin's expression,
F, G, H, local mod-four filters, j-polynomials and finite integral j-sets.
Checked both the README statements and Lean declaration/example signatures.
An independent signed-divisor calculation gives cardinalities 25, 13, 8, 6
and 4 at r=2,3,5,7,13, and agrees with the displayed special values.

## Source and library evidence

Freshly read the freely available editions on 2026-10-09. Each of the six PDF
SHA-256 values matches the accepted input's source manifest. No restricted
book was needed and no source file or passage is committed.

- Kraus, §3.1–3.3, equations (7)–(11), Lemma 1 and Theorems 3–4,
  pp.1142–1146; Appendix II §8, Propositions 1–2, corollary and filter table,
  pp.1158–1160. Checked the original square-root thresholds, strict bounds,
  local hypotheses, integral mod-four comparison and isogeny repair.
- Bennett–Siksek, §2, Theorem 3 and Lemmas 2.1–2.2, pp.358–360; §3,
  Lemmas 3.3 and 3.5 and their proofs, pp.361–363. Checked the removed-prime
  estimate, deletion level and separate isogeny-classification input.
- Martin, Definitions 1A–1F and Theorems 1–2, pp.2–3; §4, Lemmas 16–22,
  pp.14–16 of v1. Checked local factors, convolution correction and the
  exact dimension-bound equality alternatives.
- Mazur, Theorem 1 and introductory table, pp.129–130; §7, Theorem 7.1 and
  proof, pp.153–155. Checked the prime-degree classification; the later
  composite-degree exclusions retain their distinct supplier.
- Lemos, Theorems 1.1–1.4, pp.1–3; §2, Propositions 2.1–2.2, Theorem 2.3
  and j-tables, pp.4–7; §3, Lemma 3.2 and Theorems 3.3–3.4, pp.8–10 of
  v2. Checked the nonsplit condition, place p, five-level extensions,
  p-local involution, six non-CM values and all-primes certificate obligation.
- Darmon–Merel, §7, Propositions 7.1–7.2, pp.18–21; §8, Theorem 8.1 and
  Lemmas 8.2–8.3, pp.21–23 of the author copy. Checked the winding projection,
  higher-dimensional rank-zero input, integral cotangent comparison and
  torsion specialization. The r=5,7,13 continuation remains a stated
  supplier requirement rather than a claim about the original r=2,3 proof.

Read the pinned statements of `Algebra.norm_eq_prod_embeddings` and
`AlgHom.card`, including their ambient hypotheses. The number-field norm
application has the required finite dimensionality, separability and
algebraically closed target. The shared Mathlib checkout is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Independently byte-compared all
11 direct Tau Ceti imports and their entire 22-module Tau Ceti import closure
in the shared build with their sources at
`f790474821cf4256814db967cb154e7af3d0c369`; all match.

For duplication and interface checks, inspected current upstream at
`cf91098b166b26ff011db851a2e091fd3f54029b` and the current library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the roadmaps absent
from the atlas snapshot. The newer `WeierstrassCurve.torsionGaloisAction`
uses the same actual geometric torsion and coordinate action; the pinned
preview is an adapter, not a second torsion development. Read the reviewed
library-coverage audit; absence of an entry was not used as proof of absence.
There is no dedicated link map for either effective-comparison roadmap.

## Validation and limits

- Final `lean-check research/blueprint/packages/EllipticCurveModularityPartII/Suggested.lean`:
  exit 0, zero errors, 238 sorry-only warnings. Available memory was 96 GB
  before this check. Checks ran sequentially; no compile remains running.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json --json`:
  zero errors and zero warnings. The accepted input is unchanged.
- Exact metadata, valid review JSON, target/API/example inventory, allowed
  paths, absence of private paths and `git diff --check` checked.

The accepted input deliberately owns zero nodes and asserts six planned
layers with zero closed layers. The effective-comparison supplier retains
nine substantive gaps. This package verdict certifies faithful, usable
roadmap statements and suggested signatures; it does not close those gaps,
claim formalisation, perform the proposed merger or authorize upstream
submission before the prerequisite roadmaps. No packet, supplier document,
link map, atlas data or mathematical owner was changed. No package-review
work remains.
