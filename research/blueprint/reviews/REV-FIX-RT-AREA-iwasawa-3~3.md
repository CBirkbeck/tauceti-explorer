# Independent checkpoint review: issue #5869

Refs #5869. Codex (GPT-6), session `codex-tpWtXb`, 11 October 2026.
Input commit `b88f5c327ce51cae963db4c5ff7edb373d7c8243`.
Claim [6107426554](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6107426554)
was confirmed by bot comment 6107427638. This session did none of the fixes
being reviewed and claims exactly one job.

**Motives verdict: needs_changes. Dispatch: blocked checkpoint.**
This is an independent bounded review of the eight assigned corrections and
the relevant Motives contracts, rather than a new audit of every node in the
182-node packet. The previous codex-OXZ9ou review is preserved intact below
and its packet verdict is appended unchanged to `reviewHistory`.
No mathematical field, Lean signature, source issue, gap, request, stage,
implementation status or owner review marker changes in this continuation.

## Fresh finding checks

The following conclusions come from freshly downloaded public source texts,
the owner statements and the existing third-round fix report.

| Finding | Verdict and evidence |
| --- | --- |
| /1: CM product model | **Partly repaired.** BDP §2.2, p.1060 defines the product over a field containing the CM curve's field of definition. Section 3.2, p.1067 independently requires finite unramified F/Q_p and smooth proper models of C and X_m over O_F. Its conductor application is separate. Conrad's appendix, pp.1139–1140 supplies W_m. GH.0/cm-product-good-model retains separate factor models and positive/bad-twist examples. GH.1/p-adic-abel-jacobi-map hypothesis 0 still places p∤cNd_K in parentheses after good reduction; separate that application condition from the model hypotheses. |
| /2: moment twist | **Selected repair holds.** Kato §8.4, p.182 identifies T_pE with H_p(1). The owner correctly uses Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2). Adding 2−r gives k−r; k=4,r=1 gives 3. |
| /3: Euler factors | **Operator repair holds; prerequisite normalization is still wrong.** Kato Proposition 8.7(2), p.184 and Theorem 9.5, p.188 retain ℓ^(−r) and p^(−r) in the nontrivial linear terms. The owner preserves the quadratic exponent k−1−2r and the p∣M identity branch. The page image of Lemma 8.8(1), p.185 explicitly has n^(r′−1), while the owner Hecke statement and acceptance use r−1. Inverse Hecke transport contributes −(r′−1) and the first diamond contributes r′−1−r; their sum is −r. At r=1,r′=2,ℓ=2 the correct scalar is 1/2 and the wrong one is 1. Five proved scratch Lean examples check these exponents and values. |
| /4: dual exponential | **Selected repair holds.** Kato (9.2.2), p.187 and §9.4, p.188 use filtration steps, with zero for i≥k. The owner distinguishes F¹=F² from gr¹=0 at k=4 and retains the endpoint. |
| /5: interpolation | **Selected repair holds.** Kato Theorem 12.5(1), p.221 first twists the Iwasawa class by k−r, then specializes and applies the local dual exponential. The owner keeps that order, the changed Iwasawa action, f*, the p-imprimitive value and the sign. The weight-two target is V(f)(1). |
| /6: integrality proof | **Selected repair holds.** Kato Lemma 8.5, pp.183–184 uses inertia-cohomology invariants, identifies them with the Pontryagin dual of residue-field H¹, and takes the direct restriction limit there. The owner preserves the dual and the correspondence with inverse corestriction; no undualized inverse-limit vanishing is used. |
| /7: theta proof | **Selected repair holds.** Kato §1.10, p.124 uses divisor pushforward and its norm compatibility. The owner rejects pullback: for c=5,a=2, the pulled-back divisor is 25E[2]−E[10], with coefficient 24 at a nonzero 2-torsion point. |
| /8: formal periods | **Localization repair holds; full torsor adapter remains absent.** HMS Definition 2.8, p.10 presents effective periods and inverts the Tate symbol. Theorem 2.10, p.11 compares the localized ring with the full diagram's comparison algebra. Lemma 3.2, p.12 needs the neutral Tannakian setting; Corollary 3.4, p.13 gives the full torsor. Current prototypes retain effective evaluation, explicit inverse identities, rank-one nonvanishing, both edge laws and conditional rigidity. `formalPeriods_eq_comparison` still concludes only an effective equivalence; `localizeComparison` only compares two localizations. Neither supplies the typed full Nori comparison/heap/action adapter recorded in the gap. |

These selected positive judgments do not replace the independent owner
reviews or certify the entire arithmetic packets. Their files are read-only
under the live issue's scope.

## Baseline and boundaries

Read the pinned Mathlib statements of `IsLocalization.Away.invSelf`,
`mul_invSelf`, `algebraMap_isUnit`, `lift`, `lift_eq`,
`IsLocalization.algEquivOfAlgEquiv` and `Polynomial.aeval`/`aeval_X`.
They supply the explicit inverse, evaluation extension, compatible ring
localization and the two proved ring-model regressions. They do not supply
Nori fibre functors or an effective/full torsor identification. These APIs
were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The packet's recorded Tau Ceti pin remains
`f790474821cf4256814db967cb154e7af3d0c369`; the checked file imports only
Mathlib, so this run does not claim a new Tau Ceti compilation or baseline
inventory audit.

The reviewed PS.2 library audit (AUDIT-27) records that formal-period
presentation, Nori comparison and evaluation are absent, and assigns the
categorical torsor supplier to MC.6. Read current upstream ReductiveGroups
README layer 1, its Suggested.lean (which contains only layer-0
signatures), and Completed/HodgeStructures README. Their known-Hopf reconstruction and structural Hodge targets are
existing work, not new targets here. Current upstream commit:
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`.
Current Tau Ceti library commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The actual `TauCeti.Tannaka.fgPointTensorIsoEquiv` statement starts with a
commutative Hopf algebra and compares its points with automorphisms of its
comodule fibre functor. It does not discharge the missing full Nori adapter.
No build or edit was performed in either current upstream tree.

## Source receipts and validation

Public PDFs accessed 11 October 2026; no restricted source was needed.
All mathematical statements above are authored descriptions.

| Version read | Locators | SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv v5](https://arxiv.org/pdf/1105.0865v5) | Definition 2.8; Theorems 2.6/2.10; Lemma 3.2; Corollary 3.4; Definition B.18; Lemma B.21; Proposition B.22; pp.10–13,24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10; §8.4, Lemma 8.5, Proposition 8.7, Lemma 8.8; §§9.2–9.5; Theorem 12.5(1); pp.124,182–185,187–188,221; p.185 also rendered and inspected | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [BDP, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §2.2, p.1060; §3.2, p.1067; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

- Packet check: exit 0, zero errors and warnings; 182 nodes, 463 API items,
  261 tests, 47 planets, 113 baseline entries, 24 gaps and 16 requests.
- Full `lean-check`: exit 0, 817 warnings, every one `declaration uses sorry`;
  no errors or other warnings. Suggested-file SHA-256:
  `c006c8a68ebf5bc6ed2acb6c924670d40e656e3f2869e6f9271571f95296b902`.
- Five scalar/exponent regressions: `lean-check` exit 0, no diagnostics.
- No excerpt field is present in the edited packet.
- The mathematical packet and suggested file remain unchanged. The prior
  verdict is archived exactly, and the new verdict retains needs_changes.

## Completion blocker and exact remedy

Freshly re-read the entire live issue after bot confirmation. It authorizes
only this report and the Motives packet/suggested pair. The queue lists two
additional owner pairs, and `issues.py:deliverables_complete` requires this
review's marker in all three packets. The current predicate returns false.
It accepts a finished needs_changes review; the mathematical negative
verdict is not itself the dispatch blocker.

WORKERS.md's file-scope rule prevents silently extending a review to the
omitted owner files. An explicit extension was requested while the permitted
checks proceeded; no authorization has arrived. No owner review marker or
queue output was changed. Before another continuation, the maintainer should
authorize the four owner paths, or align the queue with a Motives-only review.
The previous exact owner correction instructions remain below and in the
handoff. Then perform the bounded owner reviews, check the two full suggested
files and record genuine verdicts. Do not change markers merely to satisfy
the predicate. The reader synchronization remains separate work because the
reader is also absent from this issue's deliverables.

---

## Preserved preceding checkpoint report

# Independent review: third Iwasawa fix round

Refs #5869. Codex (GPT-6), session `codex-OXZ9ou`, 11 October 2026.
Claim confirmed for [comment 6106928178](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6106928178).
Input: `001b8e8a977259a9b71681d54eb865d91b29b26c`.
Branch: `codex-OXZ9ou-review-5869`. Exactly one job claimed.

**Motives verdict: `needs_changes`. Blocked checkpoint for the dispatched job.**
I independently checked the eight findings, the verifier and third-round
fix report, the affected owner statements, and the Motives supplier
contracts. I did none of the fixes being reviewed. The entire preceding
codex-dM5x45 review is archived unchanged in `reviewHistory`; older exhaustive
blueprint and abstract-reconstruction audits remain attributed to their
authors. This is a bounded review of the assigned corrections.

The permitted review found a further prototype error: generic comparison
algebras were asserted to represent tensor **isomorphisms** without the
neutral Tannakian hypotheses. Their heap signatures had the same omission.
The effective good-pair period point consequently used a representability
claim that does not apply before Tate localization. The corrections below
remove those unsupported claims and record the missing full adapter.

## Disposition of the eight findings

All source results are described in my own words. Public versions and exact
locators are recorded below. Arithmetic owner files were inspected read-only;
their existing accepted markers remain their earlier reviewers' verdicts.

| Finding | Independent disposition |
| --- | --- |
| RT-AREA-iwasawa-3/1 — CM product model | **Partly repaired.** BDP §2.2, pp.1060–1061 places the product over a field defining the CM factor. Section 3.2, p.1067 requires a finite unramified local extension and models of both C and X_r. Conrad's appendix, pp.1139–1140 constructs the Kuga–Sato factor, not an arbitrary CM product. GH.0/cm-product-good-model now supplies both factor models and discriminating good/bad CM examples. GH.1/p-adic-abel-jacobi-map still attaches p∤cNd_K parenthetically to good reduction. That application condition must be separated from the independently supplied models. |
| /2 — symmetric-power twist | **Selected correction adequate.** Kato §8.4, pp.182–183 gives T_pE=H_p(1). Therefore Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2), and 2−r+(k−2)=k−r. The owner statement, proof and weight-four regression now retain this orientation. At k=4,r=1 the twist is 3, not −1. |
| /3 — Euler multipliers | **Euler operators repaired; their Hecke supplier still wrong.** Kato Prop.8.7(2), p.184 and Thm.9.5, p.188 have linear factors ℓ^(−r) and p^(−r) and quadratic exponent k−1−2r. Current nodes retain the nontrivial branches and the trivial p∣M branch. Lemma 8.8(1), p.185 instead uses r′ in n^(r′−1); the owner Hecke statement and acceptance still use r−1. The fresh page image and scalar regression confirm the discrepancy. Under prime(M)⊆prime(N), the current p∤MN condition is equivalent to the source's p∤N branch. |
| /4 — filtration target | **Selected correction adequate.** Kato (9.2.2), p.187 and §9.4, p.188 concern decreasing filtration steps, zero for i≥k. At k=4 the steps F¹,F²,F³ coincide, so gr¹ and gr² vanish. Current contracts and tests distinguish the step from its graded quotient and preserve the endpoint. |
| /5 — interpolation twist | **Selected correction adequate.** Kato Thm.12.5(1), p.221 twists the Iwasawa class by k−r before specialization and local dual exponential. The current contract does this, distinguishes the twisted action, and keeps f*, the p-imprimitive value and the sign (−1)^(k−r−1)χ(−1). A finite-level root does not supply the representation isomorphism. |
| /6 — duality and limits | **Selected correction adequate.** Kato Lemma 8.5, pp.183–184 identifies the local cokernel with inertia-cohomology invariants and then the Pontryagin dual of residue H¹ with dual-twisted inertia-invariant coefficients. Inverse corestriction corresponds to direct restriction after duality. The current proof preserves those directions. The μ_p example away from p distinguishes the vanishing direct restriction limit from a nonzero undualized inverse corestriction limit. |
| /7 — theta divisor | **Selected correction adequate.** Kato §1.10, p.124 uses divisor pushforward: multiplication by a prime to c fixes the zero section and permutes E[c]. This matches the norm-divisor identity. At c=5,a=2 the pullback instead has divisor 25E[2]−E[10], with coefficient 24 at nonzero 2-torsion; the owner non-example rejects the false pullback identity. |
| /8 — effective/full periods | **Presentation/localization supplied; the torsor prototype still needed correction and a full adapter remains missing.** HMS Def.0.1, p.2 and Def.2.8/Thm.2.10, pp.10–11 first present effective periods and then invert the Tate symbol. Lemma 3.2, p.12 additionally requires the neutral Tannakian setting for isomorphism representability. Cor.3.4, p.13 concerns the full localized algebra. The packet's mathematical hypotheses already distinguish these settings; the Lean signatures did not. The corrections below align those hypotheses and preserve the separate MC.6/PS.2 ownership. |

The third-round fix correctly delegated the arithmetic owner work; that
handoff does not independently certify later owner revisions.

## Corrections in the permitted Motives files

### Restore the hypotheses of isomorphism representability

`TensorIsoScheme.represents` previously took only two multiplicative
representations, claiming that every algebra point gives an invertible
tensor family. `ComparisonAlgebra.heap` also took only those representations,
although its formula requires inversion. HMS Lemma 3.2, p.12 and the packet's
own tensor-iso-scheme node require a neutral Tannakian category and the
second tensor fibre functor. Multiplicativity alone cannot give an inverse.

The new `Diagram.Rep.TannakianPair` is a typed package of those existing
hypotheses: both unitality witnesses, rank-one unit fibre, rigidity of
C(T_1), a specified extension field with its field/algebra structures, and
a tensor comparison over that field. The existing fibre-extension target
supplies the second fibre functor. It neither assumes representability nor
starts from a representing Hopf algebra. These are supporting hypotheses of
the existing target, not another reconstruction roadmap.

`represents`, `heap`, `iso_torsor`, the points-are-isomorphisms tests and the
inverse-composition test now take this context explicitly. Comparison-algebra
acceptance no longer asserts isomorphism representability for arbitrary
effective multiplicative diagrams. The packet's APIs and acceptance explain
the same restriction.

Two new **proved** ring-model checks discriminate the omission:

- `TensorIsoScheme.effective_zero_point`: the unital Q-algebra map Q[t]→Q
  evaluating at zero sends the effective Tate coordinate to zero. It cannot
  act as an isomorphism on a rank-one Tate fibre.
- `TensorIsoScheme.localized_excludes_zero`: every ring map from
  Localization.Away(t) to Q sends t to a nonzero scalar, because t is a unit.

These are models of the obstruction, not a computation of all Nori Tate
motives. They reuse pinned `Polynomial.aeval` and
`IsLocalization.Away.algebraMap_isUnit`, whose exact statements were read
and added to the baseline and prerequisites.

### Separate effective evaluation from the full torsor point

`periodPoint` no longer constructs its effective good-pair evaluation by
inverting an inapplicable `TensorIsoScheme.represents`. Its admitted
prototype instead states the valid effective algebra evaluation from the
unital multiplicative comparison and the effective presentation theorem.
The generator formula remains explicit. `periodPoint.formal` is its
Tate-localized extension; agreement on effective generators is not an
identification of the effective spectrum with the full torsor.

The effective heap/action prototypes and heap example now explicitly require
the separate Tannakian context. No such context is supplied for the effective
good-pair category; these conditional statements do not establish the
intended Nori application. The packet records a precise additional gap and
MC.6 remaining item: type the identification of the localized effective
comparison ring with the comparison algebra on the full Nori diagram, and
thread the extended de Rham fibre functor, comparison, heap and actions
through it. Use the existing localization and Nori rigidity suppliers.
Do not silently assume effective rigidity.

The previous canonical finite-dual coefficient-map repair, shared inverse
Künneth signs, rank-one Tate nonvanishing, both comparison edge laws,
unit/product compatibility and conjectural injectivity distinction remain.
The independent relative Beck adapter and abstract reconstruction carrier,
fifteen API and four theorem obligations also remain. No stage, proof or
implementation is closed by this review.

## Arithmetic repairs requiring additional scope

In Kato L1/hecke-and-diamond-equivariance-of-the-moment-map, change r−1 to
r′−1 in the Hecke statement and acceptance item 0. Keep the central diamond
exponent k−2−2r. From Lemma 8.8, inverse Hecke and first-diamond transport
contribute −(r′−1) and r′−1−r, summing to −r. At k=4,r=1,r′=2,ℓ=2 the
linear coefficient is 1/2; the current incorrect exponent gives 1. These
integer-exponent and rational numerical checks were freshly elaborated in
scratch, exit 0 with no diagnostics. A generic scalar parameter in
`chernHeckeDiamond` does not validate the source-specific instance.

In GH.1/p-adic-abel-jacobi-map, hypothesis 0 must independently require
finite unramified F/Q_p and supplied smooth proper models of C and X_m.
State p∤cNd_K separately for BDP's canonical conductor application. It
cannot guarantee good reduction for an arbitrary CM twist. Preserve the
positive and bad-twist tests and Conrad's attribution for the W_m factor.

## Sources, baseline and checks

| Public version freshly read | Selected locators | PDF SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv v5](https://arxiv.org/pdf/1105.0865v5) | Defs.0.1,2.8; Thms.1.6,2.6,2.10; Lemma3.2/Cor.3.4; B.14,B.18–B.22; printed pp.2,5,10–13,20–21,24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10 p.124; §8.4–8.8 pp.182–185; §9.2–9.5 pp.187–188; Thm.12.5(1) p.221; page images checked at pp.184,185,188,221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §2.2 p.1060; §3.2 p.1067; Conrad appendix pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

The reviewed PS.2 library audit (AUDIT-27/REV-AUDIT-27) records no Nori
formal-period/torsor construction and identifies MC.6 ownership. Fresh pinned
Mathlib reads include the Away inverse/lift/unit API, localization algebra
isomorphism and canonical-map bijectivity, and polynomial evaluation.
The shared build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`.
The unchanged Tau Ceti baseline citations retain `f790474`; the current
read-only library is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Its `TauCeti.Tannaka.fgPointTensorIsoEquiv` was read: it starts with a
commutative Hopf algebra. It does not supply the missing Nori comparison
adapter. Current upstream `070dc2becd74419e76303ede84b465ed4a69461f`
ReductiveGroups layer 1 and Completed/HodgeStructures boundaries were checked
read-only. Known-Hopf reconstruction and abstract Hodge structures remain
existing infrastructure; no upstream target was replanned or built.

- `check_blueprint.py` with the configured pinned declaration index: exit 0,
  **zero errors and warnings**; 182 nodes, 463 counted API items, 261 tests,
  47 planets, 113 baseline declarations, 24 gaps and 16 requests; no stage closed.
- Full `lean-check` on the final suggested file: exit 0, **817 warnings, all
  admitted-proof warnings**, no other diagnostics. SHA-256:
  `c006c8a68ebf5bc6ed2acb6c924670d40e656e3f2869e6f9271571f95296b902`.
  The two new ring-model checks have proofs; the supplier statements remain
  admitted prototypes.
- Parsed preservation and submission/whitespace checks are recorded in the
  handoff. No link map or restructure proposal is an output of this review.

## Dispatch blocker

The live issue still names only this report and the Motives packet/Lean pair,
while the queue requires the GH.0 and Kato pairs too. Its completion predicate
requires this job's verdict in all three packets. A `needs_changes` review is
a valid finished review; the omitted authorized paths block this dispatch.

[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names,
plus your own scratch space.” I requested authorization for the four owner
paths while finishing the permitted work; no reply has been received.
Consequently those files and their review markers remain unchanged. Align the
live issue and queue, or authorize the owner pairs, before another continuation.
The reader is also outside the live issue's scope and still needs synchronization.
