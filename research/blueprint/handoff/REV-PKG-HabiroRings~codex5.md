# Handoff: independent HabiroRings package review

Issue #11499; Codex session `codex-3ZlRas`; 2026-10-20.
**Complete; accepted; no remaining finding.** No second job was claimed.

## Result and scope

Independently reviewed #11490/#11498 against codex4 R1, the accepted packets,
and the current binding package shape. The issue's inherited Mordell title and
missing original codex report are template residue: the relevant predecessor
is [codex4](../reviews/REV-PKG-HabiroRings~codex4.md). The inherited 200 KB
limit is superseded by PACKAGE_REVIEW.md's binding shape rule. No target,
hypothesis, test or locator was removed for size.

R1 is closed through the ownership alternative explicitly authorized in
#11490. HR §§0.1–0.6 owns the six general deformation targets, all ten
`EtaleDeformation` and fourteen `CompletedEtaleLift` operations and seven
named tests. Arbitrary-ideal object existence, locally nilpotent rigidity,
finitely generated ordinary completion, complete-target maps, and regular
principal derived universality keep their separate hypotheses. The derived
target requires the actual derived marking and gives a contractible marked
comparison fibre without a connectivity bound on the proposed complete
algebra. Section 3.5 owns finite monoidal-localization descent with specified
coherent overlaps, exactness, tensor compatibility and joint conservativity;
it retains maps, algebras, refinement and sheaf descent.

Read HCF §§0.1–0.3: the specialized cyclotomic reflection, descent and lifts
are proved there independently, with no HR back-edge. The family order stays
HC → QW → HCF I → HR → RT → HCF II; QW.0–QW.4 are the QW suppliers.
Previously accepted generic enhanced, homotopy, conditional solid and HB
arithmetic contracts remain explicit. No ownership move or higher-tier input
was introduced by this review.

Compared the accepted codex4 baseline `366b816be` with the fix `610dad1b0`.
Every old numbered subsection is byte-identical except the expanded §3.5;
all old anchors survive. The fix adds Layer 0 and updates boundary/supplier
prose. All earlier Lean declarations retain their signatures. The preservation
check covers the Laurent/scalar restriction, ordinary/derived/spherical
distinctions, full Taylor coefficient algebras, denominator cofinality,
zero-algebra map direction, conditional solid hypotheses, and actual
arithmetic lines with integral evaluation certificates.

The only package edit in this review restores the closing Suggested.lean
inventory of definitions specified in the README, deleted by the fix, and
extends it for the general targets. No declaration or mathematical statement
changed. README.md and metadata.toml required no edits. The independent
review.json replaces the fix worker's self-assessment.

## Mathematical checks

The [review report](../reviews/REV-PKG-HabiroRings~codex5.md) records the
adversarial instances and their outcomes. In particular:

- Marked reduction conjugates by both markings; the split swap moves `(1,0)`.
  Étale object lifting does not impose module finiteness. The infinite
  square-zero-variable ideal over 𝔽₂ tests local nilpotence without a uniform
  nilpotence exponent; localization over ℤ[t] prevents arbitrary-ideal rigidity.
- Ordinary completion uses all quotient levels. For a given étale lift,
  formal smoothness supplies maps to an ordinary complete algebra and formal
  unramifiedness supplies uniqueness. The target need not be flat or étale.
  ℤ₂→𝔽₂ and ℤ[1/2][[t]] distinguish the map and localization claims.
- For regular f, flatness of the étale lift and the quotient tower give the
  ordinary completed model. An arbitrary derived complete algebra with static
  derived reduction has static successive reductions with surjective
  transitions; the Milnor sequence then removes higher homotopy without a
  connectivity assumption. Static 𝔽₂ fails the derived marking for f=2.
- Finite descent uses the coherent localization cube, not conservativity
  alone. Identity restrictions with zero overlap fail its hypotheses. Empty,
  singleton, repeated and disjoint covers have the expected reconstructions.

Ten Lean signatures were matched against the README: `EtaleDeformation.reduceMap`,
`EtaleDeformation.exists_lift`, `CompletedEtaleLift.mapUnique`,
`OrdinaryDerivedComparison.laurent_regular`,
`CountableSolidHabiroTensor.factorial_mul_dvd`,
`etale_localization_away_discr`, `etale_localization_away_of_prime_dvd`,
`OrderOneFibre.trivialization`, `OrderOneFibre.zeroEvaluation`, and
`completedRegulatorTriviality`. This checks arbitrary coefficients, positive
Laurent order, divisibility direction, the discriminant/support distinction,
actual tensor evaluators and general coefficient rings, including ℤ×ℤ.

## Sources and locators

Read the new general suppliers directly: Stacks [04D1](https://stacks.math.columbia.edu/tag/04D1),
Lemma 10.143.10, §10.143, algebra chapter p.385;
[0ALI](https://stacks.math.columbia.edu/tag/0ALI), Lemma 15.11.2, §15.11,
more-algebra chapter pp.28–29; and [0920](https://stacks.math.columbia.edu/tag/0920),
Lemma 15.93.18, §15.93, more-algebra chapter p.267. Also read Q Theorem 2.9,
pp.16–17; Q Setup 2.1(c), p.13 and Lemma 2.2, pp.13–14; HA Proposition
7.1.3.18, p.1219, Proposition 2.2.1.9, p.197 and Corollaries 3.2.2.4–5,
pp.358–359. The README keeps the overlap and static/derived hypotheses these
applications need. No flagged unverified locator was found.

Random sample: fifteen legacy subsection blocks, seed 11499. All checked
against the public PDFs; none required correction. Abbreviations are those
of the package references. The table records locators, not source excerpts.

| README block | Checked locators |
| --- | --- |
| §4.1 | Q Definition 2.7/Remark 2.8, pp.15–16, Theorem 2.9, pp.16–17; W Lemma 2.46, pp.31–32 |
| §7.3 | Q Remarks 2.8/2.11, pp.16–17; cubic calculation checked independently |
| §3.4 | Q Corollary 2.4, pp.14–15 |
| §2.5 | Q Proposition B.1, p.77, Setup 2.1(c), p.13; HA Proposition 2.2.1.9, p.197 |
| §6.5 | Q Theorem 1.4, p.4; G Proposition 1.5(f), p.11, §3.3, p.45; general Nakayama step is the roadmap's argument |
| §2.4 | Q Lemma B.2(c), p.77; Habiro §7.1, Proposition 7.1, pp.1141–42 and §7.3, p.1144 |
| §3.1 | W Lemma 2.1, p.8; Q Corollary 2.4/Remark 2.5, pp.14–15 |
| §3.6 | Q Corollary 2.4 proof, p.15, Lemma 2.2, p.14 |
| §2.12 | Q Proposition B.8, pp.79–80; explicit solid contract remains conditional |
| §2.9 | Q Proposition B.8, pp.79–80; T §5.3, printed p.86/PDF p.90; same condition retained |
| §5.7 | Q Remark 2.14, p.19, Theorem 1.1, p.3 |
| §6.2 | Q Theorem 1.4, p.4; G Theorem 2, p.10, proof p.43; global arithmetic certificates retained |
| §6.7 | G Definition 1.1(13), pp.6–7, Definition 1.4, pp.9–10; Q Corollary 2.13, p.19; HB certificate explicit |
| §2.1 | Q Proposition B.1, p.77, Theorem 3.11(a), p.25 |
| §5.1 | Q Definition 2.7, equation (2.1), p.16, Theorem 2.9, pp.16–17, Lemma 2.12 proof, p.18 |

Public source receipts, accessed 2026-10-20, SHA-256 of the PDF bytes:

| Source | SHA-256 |
| --- | --- |
| [Q v2](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [W v5](https://arxiv.org/pdf/2410.23078v5) | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| [G v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [HA](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| [Habiro](https://ems.press/content/serial-article-files/40881) | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| [T](https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf) | `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c` |
| [Stacks algebra](https://stacks.math.columbia.edu/download/algebra.pdf) | `b035a1f02104906a1820636cd332a0d7962fef3318d207a056634cb14dc86947` |
| [Stacks more-algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf) | `ab69179738e642603ddbde651f2838e1cb5d8711e8bcd7c447cbf02a8bb6a5d2` |

Only public sources were needed. No restricted source or passage was copied.
No suspicious external instruction was acted on or identified.

## Library audit and validation

Read the HabiroRings library-coverage audit and actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, read the étale
base-change definitions, formally smooth adic lifting, formally unramified
separated-target uniqueness, adic quotient/completeness and algebra lift
maps, Picard equivalence criterion, discriminant criterion, and Tau Ceti's
cyclotomic residue lifting. These are suppliers, not replanned targets.

Screened current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`
and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read-only,
by mathematical objects, operators and hypotheses. Included the nine newer
roadmaps and Completed roadmaps. No additional duplicate target was found;
no removal was needed. Read AdicSpaces and DGAInfinity README/Suggested pairs
for current form. No Lake command was run in those read-only checkouts.

Final validation:

- `lean-check` exited 0 after the comment edit: exactly seven expected
  `declaration uses sorry` warnings, no errors or other warnings. No admitted
  examples, sorry'd data, auxiliary theory development or background server.
- All six unchanged packets passed `scripts/check_blueprint.py`: parent,
  HR.1, HR.2, HR.3, HR.4 and HR.6; zero errors and zero warnings.
- Sorry-data check, six-file intake check, JSON/TOML parsing, relative
  links/anchors and whitespace checks passed. Metadata remains `math.NT`.

Nothing remains for this review. The maintainer can use the accepted package
for its upstream draft; the conditional solid supplier remains an explicitly
stated mathematical condition, as accepted previously.
