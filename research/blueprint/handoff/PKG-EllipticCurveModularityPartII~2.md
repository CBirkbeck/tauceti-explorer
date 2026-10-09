# PKG-EllipticCurveModularityPartII~2: completed package revision

Issue: #7900. Agent: Codex, session `codex-Wr6S41`. Date: 2026-10-09.
Claim confirmed by the swarm bot after `/claim Codex — codex-Wr6S41`.
Branch: `codex-Wr6S41-effective-residual-comparisons`.

This completes the revision requested by the independent package review
`REV-PKG-EllipticCurveModularityPartII` (#7515). It is ready for independent
package review, not a checkpoint. The existing `review.json` is unchanged;
only the next independent reviewer should replace its verdict.

## What changed

The suggested file now presents all eight displayed definition families, their
27 specified API lemmas and 29 named examples. Added `krausF` and `krausH`,
their seven API signatures and six examples. `newDimension` is the native
complex finrank of the trivial-character part of `TauCeti.cuspFormsNew N 2`;
`dimension_comparison` identifies Martin's arithmetic expression with this
space, and `martin_bound` states the exact equality alternatives. F uses the
square root before exponentiation; G still uses the index at lcm(N,4).

Added meaningful signatures for every target block. The `Native` namespace
previews supplying interfaces on actual library carriers, with separate
specifying APIs. It uses geometric Weierstrass torsion, coordinate Galois
actions, finite-field bases, scalar extension for absolute irreducibility,
native elliptic isogenies and their geometric kernels, and endomorphisms over
the algebraic closure for non-CM. A normalized native weight-two newform has
its actual Fourier coefficients, the field they generate, its own ring of
integers and a residual prime in that ring.

The local comparison uses minimal integral equations, the actual finite
Galois splitting field, all lower ramification groups and the full Artin sum,
including Swan terms. The elliptic conductor is tied to Ogg's formula on the
minimal regular geometric special fibre. The weight-two predicate is tied
to a finite flat group model of actual geometric torsion. The deletion level
remains distinct from the prime-to-residual-characteristic conductor; the
explicit local reduction alternative remains necessary at 5 and 7.

The Cartan construction uses multiplication in the actual quadratic finite
field, normalizers in GL₂, normalized scheme fibre products and native
abelian varieties. The correspondence is pullback followed by pushforward;
its old-part map is the corresponding degeneracy pullback and quotient
pushforward. Its two identities are distinct from the imported Chen
isogeny on the p-new quotient. The full-new annihilator quotient and optimal
mixed winding quotient have separate integral lattices and an isogeny
transfer. The annihilator acts on genuine rational singular homology; its
winding period is an integral of a native newform along the imaginary axis.
Nonzero dimension, finite rational points and formal immersion are theorem
conclusions, not defining fields.

The formal-immersion target specifies the real cyclotomic field, the
localization at a prime above q, the chosen cusp and its integral section,
the canonical smooth integral source, a separated smooth Néron group model
with its mapping property, the generic-fibre comparison and a surjective map
of actual completed local rings. The point-torsion target retains its broader
p-range. The genus-zero formulas compare the actual j-morphism and coordinate.
Image certificates quantify over every prime p>37 and every non-CM curve
with a listed j-invariant.

The README now describes this scope accurately. The original proved arithmetic
checks, all source locators, layer targets and supplier ownership are preserved.
Metadata is still exactly `topic = "math.NT"` followed by a newline.

## Target correspondence

Names below are in `TauCeti.EffectiveEllipticComparison`, except `norm_bound`
in `EllipticCurveModularityPartIIAcceptance`. The count by layer remains
4, 2, 4, 5, 5 and 11; compound blocks have separate declarations where needed.

| Target block | Suggested declaration(s) |
| --- | --- |
| `EC.1/krausF` | `krausF` |
| `EC.1/krausG` | `krausG` |
| `EC.1/krausH` | `krausH` |
| `EC.1/martin-bound` | `martin_bound` |
| `EC.2/norm-bound` | `norm_bound` |
| `EC.2/removed-prime-bound` | `removed_prime_bound` |
| `EC.3/finite-rationality` | `rationality_from_small_primes` |
| `EC.3/small-prime-integrality` | `small_prime_integrality` |
| `EC.3/rational-newform-curve` | `rational_form_elliptic_realization` |
| `EC.3/kraus-rational` | `kraus_rational_realization` |
| `EC.4/finite-mod-four` | `finite_mod_four` |
| `EC.4/small-trace-transfer` | `mod_four_trace_transfer` |
| `EC.4/two-isogeny-repair` | `two_isogeny_repair` |
| `EC.4/kraus-full-two` | `kraus_full_two_realization` |
| `EC.4/quotient-conductor-adapter` | `deletion_conductor_away`, `deletion_level_exact_adapter`, `weight_two_reduction_alternative` |
| `EC.5/mazur-prime-isogenies` | `mazur_prime_isogeny_classification` |
| `EC.5/two-torsion-isogeny-exclusions` | `cyclic_two_prime_exclusion`, `cyclic_four_prime_exclusion` |
| `EC.5/two-torsion-kernel-transport` | `two_torsion_kernel_transport` |
| `EC.5/irreducible-full-two` | `irreducible_full_two` |
| `EC.5/irreducible-one-two` | `irreducible_one_two` |
| `EC.6/nonsplit-potential-good` | `nonsplit_potential_good` |
| `EC.6/chen-correspondence` | `chen_correspondence` |
| `EC.6/rank-zero-quotient` | `finite_winding_quotient` |
| `EC.6/cuspidal-formal-immersion` | `cartan_cusp_formal_immersion`, `cartan_point_torsion` |
| `EC.6/j-prime-integrality` | `cartan_denominator_exclusion` |
| `EC.6/j-integrality` | `integral_j_proper_image` |
| `EC.6/integral-isogeny-j-values` | `integral_j_characterisation` |
| `EC.6/large-proper-image` | `proper_image_nonsplit` |
| `EC.6/surjectivity-twist` | `quadratic_twist_surjectivity` |
| `EC.6/finite-image-certificates` | `finite_image_certificates` |
| `EC.6/lemos-surjectivity` | `lemos_surjectivity` |

## Library and ownership audit

Read WORKERS, PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE. Read the current
upstream EllipticCurves and ModularForms READMEs in full, checked their suggested
interfaces and inspected the current Tau Ceti library. The current-roadmap
checkout was read only, including the directions absent from the atlas snapshot;
no library build, update, cache download or language server was started.

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared
Mathlib checkout has exactly that HEAD. Tau Ceti is pinned at
`f790474821cf4256814db967cb154e7af3d0c369`. All 11 direct Tau Ceti imports and
their entire 22-module Tau Ceti import closure in the shared build were
byte-compared with the sources at that commit. Their sources match.
The current read-only Tau Ceti checkout inspected for duplication has HEAD
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The newer library already has `WeierstrassCurve.torsionGaloisAction` and Tate
module material beyond the pinned build. The preview is an adapter on the same
geometric torsion carrier, with a coordinate-action specification; it does not
plan another torsion or Tate module development. The reviewed library-coverage
data has no direct entry for this import roadmap or its effective-comparison
supplier; this absence was not used as evidence that a library result is missing.

No packet, reader, supplier file, link map, queue or atlas data was changed.
The accepted input still owns zero nodes and has six planned layers and zero
closed layers. Its proposed merge into EllipticModularityEffectiveComparisons
was not performed. The supplier's nine substantive gaps remain recorded there;
typed previews and admitted proofs do not close them or claim formalisation.
No mathematical notion moved between owners.

## Source audit

Read the freely available editions below on 2026-10-09. Every PDF SHA-256
matches the accepted input's recorded hash. No restricted library book was
needed, and no source file or passage is included in the repository.

- Kraus: §3.1–3.3, pp.1142–1146, equations (7)–(11), Lemma 1 and Theorems 3–4;
  Appendix II §8, Propositions 1–2 and Corollary, pp.1158–1159, and filter table,
  p.1160. Retained the original square-root thresholds; the later BS displays
  are not used to redefine them.
- Bennett–Siksek: §2, Theorem 3 and Lemmas 2.1–2.2, pp.358–360; §3, proofs of
  Lemmas 3.3 and 3.5, pp.361–363. Deletion level, exact residual conductor,
  weight and the separate composite-isogeny classification remain distinct.
- Martin: Definitions 1A–1F and Theorems 1–2, pp.2–3; §4, Lemmas 16–22 and
  proof of Theorem 2, pp.14–16 of v1. The arithmetic expression is compared
  with the actual newspace, rather than substituted for its dimension.
- Mazur: Theorem 1 and introduction table, pp.129–130; §7, Theorem 7.1 and
  its proof, pp.153–155. Prime-degree classification does not supply the
  separate Mazur–Kenku composite-degree exclusions.
- Lemos: Theorems 1.1–1.4, pp.1–3; §2, Propositions 2.1–2.2, Theorem 2.3,
  polynomial table and finite lists, pp.4–7; §3, Lemma 3.2 and Theorems 3.3–3.4,
  pp.8–10 of v2. The all-primes certificate obligation is not replaced by
  finite trace sampling or the cited database lookup.
- Darmon–Merel: §7, Propositions 7.1–7.2, pp.18–21; §8, Theorem 8.1 and
  Lemmas 8.2–8.3, pp.21–23 of the author copy. The r=5,7,13 continuation,
  higher-dimensional rank-zero input and integral cotangent comparison remain
  the supplier obligations already described in the README.

| Source | Edition URL | SHA-256 |
| --- | --- | --- |
| BS | [PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) | `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf` |
| Kraus | [PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf) | `d235ed8bba1c21618ade20f3e4a387846c641e730c3e981936056b10cfdc4ab6` |
| Martin | [PDF](https://arxiv.org/pdf/math/0306128) | `844017dec299d575ee49f731b7ae6ec27be03d76bf6463bc428b9e9b49c0a8d4` |
| Mazur | [PDF](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf) | `f3da9ef0d3d184225c4799951897be7b90d8b25050c5d508b69aeff70fd2ead3` |
| Lemos | [PDF](https://arxiv.org/pdf/1702.01985v2) | `ce889428aa4d6cbe1f30fcb504591063927fdaa96baa1bdf598596bbc02bd043` |
| DarmonMerel | [PDF](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf) | `89c4a7a8563c35f6124279b883075c40b7aa8fcb485385098896e003d80e9aa7` |

## Validation and next step

- `lean-check research/blueprint/packages/EllipticCurveModularityPartII/Suggested.lean`:
  final exit 0, zero errors, 238 warnings, every warning exactly
  `declaration uses sorry`. This includes the native elliptic, modular-form,
  scheme, abelian-variety, integral-model and completed-stalk signatures.
  Memory available before checks exceeded 20 GB. All checks ran sequentially;
  none remains running.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json`:
  zero errors, zero warnings. Accepted input is unchanged.
- Checked all 31 target blocks and exact presence of the eight definition
  families, 27 API signatures and 29 labelled example signatures against the
  supplier specifications. There is no admitted `Prop` definition, freely
  supplied target proposition or phantom geometric type.
- `git diff --check`: clean. README is 64032 bytes,
  below 200 KB. Exact metadata and unchanged review file were checked. Only
  the issue's deliverables and this handoff are edited; no private paths or
  source passages are added.

No package-revision work remains. The next step is independent package review,
including rerunning Lean and checking the new target signatures against the
README's preserved mathematical targets and accepted import plan. The reviewer should update
`review.json`; the inherited mathematical prerequisites remain explicit.
