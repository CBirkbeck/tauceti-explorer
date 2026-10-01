# RT-PAPER-DELIGNE-74

Complete independent red team of `PAPER-DELIGNE-74`, by Codex,
session `codex-rtOQ9t`, 1 October 2026. Refs #4596.
Base: `5c5f074dba31f27ee7f6f9d69d7fce0300a12ff8`.

Five findings: three high, two medium. Two concern corrections already
confirmed by the extraction's review but omitted from the extracted planning
statements. They are propagation failures, not new source errata.

| Finding | Severity | Required repair |
| --- | --- | --- |
| /1 | High | Use the projective-line closed-point estimate in 3.8 |
| /2 | High | Use the corrected multiplier in every fiber in 6.12 |
| /3 | High | Supply the constant-sheaf P1 computation before Weil I |
| /4 | Medium | Reconcile GOS routing with the confirmed common-owner request |
| /5 | Medium | Remove the insufficient elementary equivalence argument in 8.2 |

## Scope and evidence

I read the complete 208-item extraction, its reader, all five routes, eight
prerequisite records, 16 source-issue records and accepted review. The extraction
was written by Claude Code `cc-f805bf` and reviewed by Claude Code
`cc-fb70e5`; this session did neither job. The claim on #4596 was confirmed by
the bot.

I reread all published pages 273–307, including the proofs and bibliography, on
images of the [Numdam publication](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf).
The PDF has 36 pages including its cover. Its SHA-256 is
`8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.
The OCR is especially unreliable for exponents and primes.

The [Goncharov translation v2](https://arxiv.org/pdf/1807.10810v2)
was a targeted secondary check of 3.8, 6.10–6.13 and 8.2; I did not reread all
31 pages of that translation. Its SHA-256 is
`44bb5bd09dde3037ca9c12da1b9d7c2f3763281e3230301d6120caf1d8d75c78`.
The Numdam/publisher listing, [author listing](https://publications.ias.edu/deligne/paper/368),
[arXiv history](https://arxiv.org/abs/1807.10810), and bounded public
erratum/corrigendum searches revealed no additional correction. The Springer
copy and the eight prerequisite works were not independently read in full.
The findings below do not claim full prerequisite-proof closure.

The frontier remains 165 planned, 1 library and 42 missing at the audited
snapshot. Every missing item is routed exactly once; all 30 distinct planned
and route endpoints resolve. I read their current full stage descriptions and
the relevant reviewed library-audit rows, including the early/late DWP boundary.
The FF packet comparison below is explicitly a **partial** packet, not an
accepted implementation.

Fresh assembly has 2,907 actual stages and 8,246 edges between those stages,
and this graph is acyclic. There are 8,322 stage-edge records in all; 76 touch
external UPSTREAM proxies outside the actual stage list. Those records are
distinguished from actual-stage edges in the graph check.

## /1 — E16 was not propagated into the convergence statement

**Where:** `s3-3.8-euler-product-convergence`, companion
`s3-3.8-closed-point-count`, route 2 and its reader explanation.

The published proof of 3.8, p.286, begins its count
“Sur la droite affine”. The input in 3.1 is an open of P1; making it affine
does not put it inside the affine line over the original finite field.
Existing accepted E16 records exactly this problem.

Nevertheless the theorem item still asserts

```text
Σ_x q_x^(−1−ε) ≤ Σ_{n≥1} q^n q^(−n(1+ε)).
```

Take q=2 and remove the closed point defined by X²+X+1 from P1.
All three rational points survive. For ε=5, their contribution alone is
3/64, whereas the right side is 1/31. Since 3/64 > 1/31, the displayed
intermediate inequality is false. This is E16's already accepted example,
checked again with exact rational arithmetic.

Use instead

```text
Σ_x q_x^(−1−ε)
  ≤ Σ_{n≥1}(q^n+1)q^(−n(1+ε))
  = Σ_{n≥1}q^(−nε) + Σ_{n≥1}q^(−n(1+ε)) < ∞.
```

Both geometric series converge. Thus the same convergence radius and final
3.8 theorem survive. Update the actual item and route explanation, rather
than relying on a separate errata record to override the statement.
The A1 count itself is true; it simply does not cover every allowed U0.
Do not shrink away a rational point and silently change H1_c(U,F).

## /2 — E8 was propagated to H but not to its fibers

**Where:** `s6-6.12-measure-zero`, compared with
`s6-6.10-arithmetic-monodromy-CSp`.

Use d for the fixed odd dimension of the pencil fibers and a for the
Z-hat coordinate. The Q_l(−d)-valued pairing gives

```text
H = {(a,g) : μ(g)=q^(−da)}.
```

Item 150 uses this corrected equation. Item 153, however, still defines the
fiber with μ(g)=q^(−a). E8 explicitly says to correct 6.12 as well as 6.10.
For d=3, a=1 the two multipliers are q^(−3) and q^(−1), respectively.
They differ in Q_l. The surjectivity in 6.11 means the actual a=1 fiber
is present, so this is not an empty-case convention.

The proof must set

```text
CSp_a = {g : μ(g)=q^(−da)}
Z_a   = {g ∈ CSp_a : δ^a is an eigenvalue of g}.
```

Then apply the proper-algebraic-locus nullity statement on this Sp-torsor,
intersect with the actual fiber of H1, and apply Fubini over Z-hat.
Keep geometric Frobenius over −deg(x), including the δ^(-1) substitution
when passing to the exceptional eigenvalues δ^(deg(x)) in 6.13.
No new source-issue entry is needed: this completes the accepted E8 repair.

## /3 — A Weil I input is assigned to a dependent Weil II stage

**Where:** `s7-H1-P1-constant-vanishes`, currently planned only at DWP.6.

The source p.300 uses H1(P1,constant)=0 in the middle Leray term of 7.1,
including 7.1.2', 7.1.4' and 7.1.5'. This belongs before the Weil I
dimension induction in DWP.4. The item instead selects a mention of the
same elementary fact inside the later Weil II argument at DWP.6.
Its note notices the problem but leaves the routing unresolved.

The fresh assembled graph contains

```text
DWP.4 → DWP.5 → DWP.6.
```

Thus adding the advertised supplier DWP.6 → DWP.4 would create a cycle.
There is no such reverse edge today: the finding is an invalid promised
supplier, not a claim that the current atlas is cyclic. DWP.4's contract
explicitly excludes DWP.5–9 as inputs.

EDC.4 already plans the projective-bundle decomposition independently of
Weil bounds. Specializing to P1 over an algebraically closed point supplies
Q_l in degree 0, Q_l(−1) in degree 2, and zero in degree 1. Tensor with a
constant finite-dimensional coefficient space to obtain the needed result.
Assign the item there, or to an exact existing earlier supplier if identified.
DWP.4 and DWP.6 are consumers of that computation.

## /4 — GOS routing conflicts with the confirmed shared-owner request

**Where:** `s8-GOS-formula`, route 4 and its reader.

Weil I 8.11, p.306, imports the Euler-characteristic formula by citation to
Raynaud, Bourbaki 286. The general statement is

```text
χ_c(U,F) = rank(F)(2−2g−|D|) − Σ_{x∈D} Swan_x(F),
U = C \ D,
```

for a smooth projective connected curve C over an algebraically closed field,
a finite boundary D and lisse l-adic coefficients with l different from the
characteristic. The polynomial-sum application is a specialization.

The extraction's route 4 sends the whole general theorem to FF.2 as part of
the proof of its character-sum bound. Its review permits FF.2 either to build
it or propose another owner. But
[RT-AREA-finitefields/3](RT-AREA-finitefields.result.json) and its
[confirmed verification](RT-AREA-finitefields.review.json) already request
one general owner in the étale-duality direction, after EDC.2.

The current partial
[FiniteFieldsAndCharacterSums packet](../packets/FiniteFieldsAndCharacterSums.json)
also requests this theorem from EDC.2, for three separate consumers:
`h1c-conductor-bound`, `artin-schreier-sum-on-curve-bound`, and
`deligne-cohomology-of-polynomial-sheaf`. Its gap and rescope proposal
preserve that common ownership. This is not a new discovery that GOS is
missing; it is a contradictory instruction about who should construct it.

Reconcile the extraction with that request. Keep the general theorem with
the shared étale-cohomology supplier and FF.2's specialization in FF.2.
Retain the separate R01.3 local-conductor input. A proposed
`EDC.2:euler-characteristic` is not a registered stage in the current graph:
do not change the item to `planned` at that nonexistent endpoint.
If registration needs a new layer, supply the corresponding proposal/brief
under §16, reusing the existing request and confirmed finding.

## /5 — The 8.2 note omits a hypothesis for its claimed equivalence

**Where:** the note of `s8-8.2-ramanujan-petersson`.

The note says equivalence of the trace inequality and root purity uses only
α+β=a_p, αβ=ε(p)p^(k−1) and |ε(p)|=1. Those relations do not give the reverse
implication for arbitrary complex roots.

Put r=p^((k−1)/2)>0, ε=1, α=2ir and β=−ir/2. Then

```text
αβ = r²,  |α+β| = 3r/2 ≤ 2r,
|α| = 2r, |β| = r/2.
```

This is a counterexample to the stated elementary justification, not to the
modular-form theorem. The paper's argument on p.302 obtains both root
moduli directly from geometric Frobenius purity.

The minimal repair is to state that proof direction: root purity implies
the trace bound by the triangle inequality. If an equivalence lemma is
wanted, include the normalized-reality relation
a_p/sqrt(ε(p)) real, with a unit square root and its mathematical
justification, before using the real quadratic discriminant criterion.
Do not promote an unsupported generic quadratic implication into the API.

## Checks that produced no finding

The library-status item is supported by the four declarations read at
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- `cuspFormCharSpace` and `mem_cuspFormCharSpace_iff_nebentypus`,
  `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean`;
- `TauCeti.cuspFormsNew`,
  `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`;
- `HeckeRing.GL2.IsEigenformAwayFromLevel`,
  `TauCeti/NumberTheory/ModularForms/Eigenform.lean`.

The separate new/eigen/normalization requirements are retained. The eigenform
definition alone can include zero, but a1=1 excludes it. Mathlib's
`Gamma0Map` at `082e2d37e8b0463410cdb532e111cd43d5a66174`
uses the lower-right entry, consistent with ε(a)^(-1)=ε(d).

Bounded pinned searches did not find implementations of the specialized
weight, pencil, GOS or geometric-density theorems. This does not certify
every inline absence remark in the extraction. The actual Riemann-zeta
Euler-product declarations were read; they provide only the numerical
Spec Z specialization. The broader mixed-characteristic zeta definition in
route 1 must retain its own convergence obligation; this audit does not
infer it from a finite-field trace formula.

The source's radical quotient, zero-vanishing-cycle case, coefficient
conventions, finite-field descent and tensor-power limit remain essential.
The existing E5 rejection is not reopened. No new source erratum is claimed.
The full prerequisite sources, future blueprint proof closure, and
unimplemented stage contracts remain outside any claim of formal verification.

## Validation

Passed:

```text
python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DELIGNE-74.result.json
python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-DELIGNE-74.result.json research/blueprint/redteam/RT-PAPER-DELIGNE-74.md
git diff --cached --check
```

The route-cardinality and graph checks were read-only, using fresh assembly.
Input hashes are in the result JSON. Only the two permitted red-team files
are delivered. No Lean file is requested or compiled.

