# Independent review: Hilbert varieties and quaternionic curves, H0–H6/R18.1

**Verdict: accepted as a target-level planning pass.** Reviewer: Codex, session
`codex-aizIKS`; job `REV-HilbertModularVarietiesAndShimuraCurves--H0`, issue #430;
2026-10-07. The original blueprint handoff names session `codex-J66Pjc`, so this
is independent of the author.

Reviewed the [packet](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json),
[suggested file](../suggested/HilbertModularVarietiesAndShimuraCurves--H0.lean),
and [reader document](../readmes/HilbertModularVarietiesAndShimuraCurves--H0.md),
against the campaign targets, accepted RS-23 keeps, library audit AUDIT-15,
and confirmed RT-AREA-padic-1/26. Only the packet and suggested file were edited;
the reader document is outside this review's authorized deliverables. Its
synchronization needs are listed below.

There are **75 nodes: 63 verified, 12 corrected, none added, none unverifiable**.
The packet contains 24 definitions, 12 constructions, 24 theorems, 2 lemmas,
10 comparisons and 3 applications; **141 API items, 108 tests, 38 planets and
16 confirmed baseline declarations**. Every definition/construction has three
specified tests. No declaration is represented as implemented.

All eight stages remain `planned`, with precise `remaining` lists; none is
`closed`. The eight named gaps and 18 producer requests are honest prerequisite
endpoints under PROTOCOL §0. Acceptance does not turn those endpoints into
proved theorems, identify an arbitrary-prime algebraic space with a scheme,
or supply missing geometric Lean carriers.

## Corrections made

1. Added `integralTraceFamily_balance`: multiplication in the O-parameter can
   be moved to either lattice argument. This specifies the intended O-action
   on the family of Z-valued bilinear forms; multiplying their outputs by an
   arbitrary O-element would not make sense. Added its native Lean signature.
2. Added section extensionality to the symmetric polarization sheaf and the
   simultaneous Isom torsor. Added the homomorphism factorization universal
   property `tameDelta_lift` to the tame quotient, with a native signature.
   The two geometric extensionality contracts remain explicitly omitted
   signatures until their suppliers provide the carriers.
3. Replaced the executable `squareImage_positive` example. Previously it
   merely concluded that a subtype element belonged to its ambient subgroup.
   It now asserts strict positivity of an arithmetic unit square under every
   real field embedding, matching the packet's actual mathematical test.
4. Distinguished the retained Hilbert tame marking from Allen's torsion-only
   elliptic fine marking. Allen's Y_i records D and the two symplectic torsion
   isomorphisms, without an extra independent mu_N datum. The two full odd
   torsion levels already eliminate elliptic automorphisms. The shared twist
   now states both marking conventions and directly imports M1's
   characteristic-zero moduli, M2 representability and M3 algebraization for
   this distinction. It no longer silently specializes to an extra tame
   cover of Y_i.
5. Replaced the copied Weil-restriction steps in `allen-elliptic-twists` with
   the dualized paired torsion construction, fine modular component, and
   finite descent argument. Weil restriction belongs to the next node.
6. Made the C6 tame-ideal hypotheses explicit in `quadratic-domain-boundary`:
   n is coprime to the field discriminant and does not divide 2 or 3, and c is prime to n; use the supplier’s actual torsion-free moduli input.
   The supplier does not establish its integral cusp scheme at arbitrary
   tame levels. The geometric dimension comparison is retained in that range.
7. Added Taylor's actual complex connectedness passage to
   `twisted-component-descent`; DP Corollary 2.4 alone does not build the
   torsion twist or its component descent. Changed all four Allen node
   locators to pages of the linked published PDF, including Lemma 7.2.2 on
   pp.1098–1099.
8. Corrected E2's `printed` field from an English paraphrase to the actual
   displayed stabilization assertion. Independently confirmed all five
   source findings and added the required reviewer verdicts and reasons.
9. Recorded individual review verdicts for all 75 nodes and independent
   confirmations for all baseline entries. No baseline citation was removed
   or replaced. No mathematical node was added or removed.

## Source verification

Downloaded the public source PDFs, checked their hashes against the packet,
and read the relevant statements and proof interiors. Every node's literal
anchor was located; anchors such as a definition number identify a passage,
not the whole mathematical assertion. The assertions were checked separately
against the passage, supplier statements and the stated gap boundaries.

| Source read | Passages checked | Use in this part |
| --- | --- | --- |
| [Birkbeck–Heuer–Williams, published AIF 73 (2023)](https://www.numdam.org/item/10.5802/aif.3560.pdf) | §§5.1–5.2, 8.1–8.4; downstream conventions in §§8.5, 9.1–9.2 | Integral lattice, polarization/tame conventions, pairings, finite levels, unit quotients and counterexamples |
| [Deligne–Pappas, Compositio 90 (1994)](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf) | §§1–2 and §§3–4, including the deformation argument and ramified local-model equations | Evaluation condition, algebraic-space model, flatness, normal fibres, Rapoport and determinant comparisons |
| [Andreatta–Iovita–Pilloni, author version 16 May 2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | §§3.1–3.2, 5.2.4 | Rapoport/Hasse convention and arbitrary-prime qualification; formal domains imported from R2 |
| [Hida, Astérisque 298 (2005)](https://numdam.org/item/AST_2005__298__147_0.pdf) | §9.1, especially pp.232–234 | Context for the ordinary comparison; its unramified base restrictions are not used to prove the all-prime H2 result |
| [Taylor, author PDF of the 2002 paper](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf) | §1, pp.9–13, Lemmas 1.2–1.4 and fine simultaneous moduli | Ordered modules, structured local constructions, real points and the complex component argument |
| [Allen et al., published Annals 197 (2023), author-hosted journal PDF](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Lemma 7.1.8; §7.2.1/Lemma 7.2.2; §7.2.5, pp.1103–1106 | Finite-flat residual types, extension-class lifting, elliptic twists, CM Weil restriction and local input export |
| [Yuan–Zhang, published Annals 187 (2018)](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | §3.1, pp.550–552; §4.1, pp.561–564; §5.1, pp.571–573 | One-real-split datum, central closures, weighted reflex field, PEL/connected and torus bridges |
| [Campaign document](../../../content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md) and accepted RS-23 | H0–H6 and R18.1 | Target coverage and ownership, including the rational/quadratic/nonprincipal tests |

The bibliography context is not a claim to have proved unread Carayol,
Kisin–Lai or Honda existence arguments. Those remain precisely named gaps.
Quaternionic integral models, p-divisible extensions and height results are
outside this part.

## Five independently checked source findings

All findings are confirmed against the published versions recorded in
`sourceVersions`; E4 is a proof gap, not a counterexample to the main theorem.

- **E1, BHW Lemma 8.20 proof.** In Z[sqrt(2)], epsilon=1+sqrt(2) and
  eta=epsilon^4=17+12sqrt(2) have eta=1 mod4, eta=-1 mod3 and Norm(eta)=1.
  Eta squared represents a nonzero connected class killed in Delta(4),
  since neither of its only roots ±eta is 1 mod12. The printed injection
  is false. Independently recomputed the residues and square 577+408sqrt(2).
- **E2, BHW Lemma 8.20 statement.** For p=2, N=5, n≥2, the congruence
  subgroups are generated by epsilon^(2^n) and epsilon^(3·2^n).
  Thus Delta_n is Z/6 with transition multiplication by 2, and its inverse
  limit is Z/3 with proper image at every level. This is not just numerical
  evidence: epsilon^(2^m)=a_m+b_m sqrt(2) has a_m odd and
  b_(m+1)=2a_m b_m, so v_2(b_m)=m. The mod4 calculation excludes a negative
  unit congruent to 1; the mod5 order is 12. Computation through n=10
  independently agreed with these formulas.
- **Replacement argument for E1/E2.** Write A_n=U+∩U_(p^n) and
  B_n=U_(p^nN)=U_(p^n)∩U_N, using p coprime to N. Then
  [A_n:B_n²]≤[U:U_N]·2^g: the first factor bounds
  [A_n:A_n∩B_n], and [A_n∩B_n:B_n²]≤[B_n:B_n²]≤2^g by the unit
  theorem and subgroup rank/torsion bound. A uniformly bounded tower of
  finite groups has a finite inverse limit: more distinct compatible
  sequences than the bound would be separated at one common level.
  Finitely many distinct limit elements are all separated at a sufficiently
  high level, yielding eventual injectivity onto the images. None of this
  gives eventual surjectivity onto the original groups.
- **E3, BHW §8.3.1.** For the allowed F=Q, N≥4, U+ and U_N are trivial.
  E=Gamma_0=P-Gamma_0 and both polarization quotients are trivial. Both
  exact sequences split, contradicting blanket nonsplitting.
- **E4, Allen §7.2.5, p.1105.** For a trace-zero supersingular curve over
  F_l, pi²=-l. Over a residue field of degree h its Frobenius squares to
  (-l)^h. The matching equation needs the residue degree and an appropriate
  choice of curve/power, together with the local finite-flat type check.
  A sufficiently divisible unramified degree addresses the prime-to-l
  matching; the packet correctly records the remaining paired local gap.
- **E5, the following ordinary paragraph.** The residual extension and
  Lemma 7.2.2 have coefficient field F_l2; the later k(w) coefficient is a
  misprint unless an unstated scalar extension is inserted. Retain F_l2
  and the negative extension-class lift.

Independent correction searches opened the publisher article pages and arXiv
histories ([BHW v4](https://arxiv.org/abs/1902.03985),
[Allen v2](https://arxiv.org/abs/1812.09999)), and searched publisher/author
correction notices. No correction to these passages was located. The `new`
labels mean this bounded search found none, not an exhaustive novelty claim.

## Pinned baseline

Every name and complete statement, including surrounding variable hypotheses,
was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The 16 confirmations are recorded
in `baseline.declarations[].checked`.

| Declaration | Verified provision and limits |
| --- | --- |
| `Algebra.trace` | The algebra trace linear map; finite number-field extension satisfies its module assumptions. |
| `Submodule.mem_traceDual` | Trace-form integrality in the image of Z→Q, with the stated Dedekind/separable setup. |
| `FractionalIdeal.dual` | Nonzero ideal trace dual; zero is handled separately, not interpreted as the full field dual. |
| `FractionalIdeal.dual_eq_mul_inv` | D(I)=D(1)I^-1 in the separable integral-closure setup. |
| `FractionalIdeal.dual_dual` | Involutive trace dual in that setup; supports D(c^-1 d^-1)=c. |
| `Matrix.adjugate_mul_distrib` | Product order reverses; supports the selected left frame action. |
| `Matrix.det_adjugate` | Exponent card(n)-1; for 2×2 matrices the determinant is unchanged. |
| `QuotientGroup.mk'` | Normal-subgroup quotient homomorphism, using the native quotient carrier. |
| `NumberField.IsTotallyPositive` | Strict positivity at real infinite places. |
| `NumberField.totallyPositiveIntegerUnits` | Actual arithmetic-unit preimage subgroup; no new positivity definition. |
| `NumberField.sq_mem_totallyPositiveIntegerUnits` | Every arithmetic unit square lies in that subgroup. |
| `NumberField.units_sq_index_eq` | Exact index 2^(rank+1); does not already define Delta(N). |
| `NumberField.unitsMulEquivTorsionProdMultiplicative` | Torsion/free unit decomposition, with finite rank and the actual arithmetic unit carrier. |
| `NumberField.NarrowClassGroup.instFinite` | Finite narrow class group, not wide-class indexing. |
| `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm` | Integral representative coprime to a nonzero integer modulus. |
| `AlgebraicGeometry.Scheme` | Existing scheme carrier; does not supply relative abelian schemes or moduli. |

The reviewed audit's partial native ingredients are reused. D5 owns rational
Hilbert groups/data/embedding, M0–M3 the generic PEL engine, A1–A6 abelian
structures and Weil restriction, RG the algebraic group operations, R2 formal
section domains, B4 weights/descent, and V8/R12.2 canonical modular
comparisons. The packet plans their Hilbert/quaternionic specializations,
not replacements for those owners.

## Closure, tests and ownership

Read all **43 distinct named cross-roadmap supplier nodes** used by the packet.
There are 59 such prerequisite occurrences after correction. Stage-level
contracts that do not yet provide the required relative structure are covered
by the 18 precise producer requests, rather than treated as completed
libraries. In particular:

- M2 good-prime smoothness does not establish the arbitrary-prime DP scheme.
  H2 uses the DP local model and requests the polarized deformation package;
  scheme-only adic consumers need the documented chart/descent refinement.
- F3's Honda–Tate node supplies the underlying simple isogeny classification
  with its own existence proof gap, not the O-action/polarized witness in
  Taylor. R09.4's commutative twist is insufficient for the simultaneous
  symplectic Isom torsor; the request is to R09.3.
- R07.2 owns generic BT1 Ha, ordinarity, Fargues LF and intrinsic Hodge–Tate.
  Both packet and reader obey confirmed RT-AREA-padic-1/26: H2 specializes
  the Hasse ideal, and T0 only owns its boundary extension. There is no
  reverse T0 or Moret–Bailly prerequisite proving the finite-level inputs.
- V8 datum/level maps assume actual canonical models; the quaternionic
  endpoint and central-weight coverage are separately requested. The YZ
  finite-level comparison is geometric with its prime-to-d_B condition;
  the unexplained descent field K remains a gap.

The three-test outlines were checked for convention, degeneration and plausible
wrong definitions, including nonprincipal ideals, inverse different, bad-prime
nonfree local modules, zero subgroup scheme rank, component/pairing mismatches,
coarse/fine distinction, noncommutative descent, and noncompact split curves.
The 38 planet names designate mathematical objects/constructions/theorems,
not paper locators. This is target-level review; no proof was split into a
new lemma-level development.

## Validation and prototype limits

- `python3 scripts/check_blueprint.py` on the final packet: **0 errors,
  0 warnings**; source-finding schema validation is included.
- The source-version metadata was checked with the errata validator's
  `versions_checked` function; standalone errata-file CLI rules are not the
  packet format.
- `lean-check` on the suggested file: **exit 0**, **84 warnings, all
  declaration-uses-sorry warnings**, no errors or other warnings. The shared
  Mathlib build is at the exact pinned commit. Memory was checked before
  each compilation and exceeded the required 20 GB available threshold.
- Native portion: **68 named declarations and 25 examples**, comprising
  22 named test examples and three arithmetic countercalculations. All
  packet API/test names appear in either executable code or the explicit
  omission ledger. Four added API names were synchronized with that ledger.
- The positive-unit Tau Ceti source was checked at its pin, but its compiled
  module is absent from the shared build. The native group signatures
  therefore keep P explicit, with square containment where necessary.
  No Tau Ceti rebuild was performed. Geometric omission entries are
  mathematical contracts, not elaborated signatures; they use no dummy
  Prop fields or replacement moduli carriers.
- `git diff --check`: clean. Individual per-node decisions are in the
  packet's top-level `review.checked` list.

## Orchestrator follow-up and reader synchronization

These are follow-ups to the accepted planning pass, not unresolved contrary
assertions within it:

1. Route E1/E2 to the existing S5/O4 consumer jobs. Their geometric finite
   quotient arguments must use stable images or provide a separate
   replacement; Delta_infinity cannot simply be identified with every
   sufficiently high Delta_n at p=2. Do not infer that the main perfectoid
   existence theorem is false from this failed group argument.
2. Keep the eight recorded refinement gaps assigned to their stated
   owners, especially structured Honda–Tate realization, paired local
   conditions, integral Gamma0 closure, arbitrary-prime scheme
   representability, and the Carayol finite-level descent field.
3. Synchronize the reader document with this review's authorized packet
   edits: add the four API outlines; update the H6 fine-marking distinction,
   M1/M2/M3 direct suppliers and Allen elliptic proof; state C6's tame
   hypotheses in the H5 boundary item; add the Taylor component citation;
   update published Allen locators and E2's literal anchor. The reader's
   existing source-error conclusions and RT ownership are already correct.
   Its old Allen proof currently contains the copied Weil-restriction
   steps, and its Isom-torsor paragraph still requires an extra tame marking.

No campaign/data files, supplier packets or other workers' deliverables were
changed. No further job was claimed.
