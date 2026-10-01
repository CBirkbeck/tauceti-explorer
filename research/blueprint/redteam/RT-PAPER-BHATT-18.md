# RT-PAPER-BHATT-18

Agent: Codex. Session: `codex-rtOQ9t`. Issue: [#5067](https://github.com/CBirkbeck/tauceti-explorer/issues/5067).
Read on 1 October 2026 at atlas commit `699b19dfd79b6e3ab2c60fff104cef262378c094`.

Two findings: a false general almost-elements formula (high), and an
unreconciled owner for the common Cohen coefficient-ring construction (medium).
Neither finding disputes the direct summand theorems. The existing 25
source-issue records and acknowledged design obligations are not counted again.

The extraction was written by other sessions (Codex `codex-hjdg0j` and
`codex-7e92bd`, Claude Code `cc-fb70e5` and `cc-39fac3`), and reviewed by
Claude Code `cc-58621d`. This session did neither job. Claim comment
5927522598 was confirmed by bot comment 5927525129.

## 1. The general almost-elements API uses the wrong module

**High; error.** In `PAPER-BHATT-18/almost-category`, the statement assumes
an idempotent ideal m in V and flatness of **m⊗V m**. The API
`AlmostElements.hom` nevertheless promises

$$
(N^a)_* = \operatorname{Hom}_V(m,N).
$$

For that generality the formula is

$$
(N^a)_* = \operatorname{Hom}_V(\widetilde m,N),
\qquad \widetilde m=m\otimes_V m.
$$

This is not a harmless alternative notation: the item never defines m to
mean its tensor square. Its zero-object test uses m as the actual ideal.
The fresh PerfectoidSpaces P0 contract likewise deliberately supports
general almost bases, without a perfectoid-field or flat-m hypothesis.

Gabber–Ramero, [*Almost ring theory*, sixth release, 22 July 2002](https://websites.umich.edu/~bhattb/almost_purity_2011/almost_ring_theory.pdf),
equation (2.2.4), p.12, gives the Hom formula with `tilde m⊗M`.
The definition in §§2.2.8–2.2.9 and Proposition 2.2.13(ii), p.14, identify
the right adjoint. Remark 2.1.4(i), p.8, permits replacing the tensor square
by m when **m itself is flat**. Part (ii) explains the distinction under
base extension: flatness of the tensor square survives arbitrary base
change, whereas flatness of the image ideal need not.

### A reduction modulo t that breaks the API

This counterexample is a calculation for the present audit.

Let K be the completion of the perfection of F_p((t)), V=K°, and
m=(t^(1/p^n) : n≥0), its maximal ideal. Normalize v(t)=1. The ideal m is a
filtered union of principal free V-modules, hence flat; its nondiscrete
valuation implies m²=m. In particular, multiplication identifies m⊗V m
with m.

Set W=V/(t) and n=mW=m/(t). Then n²=n. The base-change identification of
Remark 2.1.4(ii) gives

$$
\widetilde n=n\otimes_W n\simeq m\otimes_V W=m/tm,
$$

which is flat over W. Thus (W,n) satisfies exactly the general almost-base
hypotheses of the item. Multiplication is the quotient

$$
q:m/tm\longrightarrow m/(t),
\qquad
\ker(q)=(t)/(tm)\simeq V/m\ne0.
$$

Indeed, t belongs to m but not tm: cancellation would otherwise give 1∈m.
For N=tilde n, the canonical comparison

$$
\operatorname{Hom}_W(n,N)\longrightarrow
\operatorname{Hom}_W(\widetilde n,N)
$$

cannot contain the identity of tilde n in its image; that would factor the
identity through the noninjective q. The two representing modules are not
even abstractly isomorphic: n has no nonzero elements annihilated by n,
while the nonzero class of t in tilde n is annihilated by n. For the first
assertion, if 0<v(x)<1, choose a root of t whose positive valuation is less
than 1−v(x). Its product with x remains nonzero modulo (t).

This is the kind of change of base used throughout the paper's reductions
modulo t^r. Merely adding flatness of the image ideal to the general
supplier would lose those almost bases.

### Correction and acceptance tests

Keep the general P0 owner and correct the API to Hom(tilde m,N), with its
natural adjunction and counit. State the simpler Hom(m,N) formula separately
under flatness of m (or an explicitly supplied multiplication isomorphism
tilde m≅m). Preserve the distinction between the module adjoints and the
algebra adjoint (!!).

Add tests for the flat valuation base and for the quotient (W,n) above.
In the latter test the class of t must survive in tilde n and vanish under
q; the identity must fail the advertised factorization. These tests check
the carrier, not just whether almostification kills an almost-zero module.

Bhatt's own footnote 5, arXiv v2 p.3, uses Hom over the **valuation base**
K° with its flat root ideal. It is valid in that scope. This finding is an
error in the extraction's generalization, **not a new source erratum**.

## 2. Reuse the shared Cohen coefficient-ring construction

**Medium; duplicate.** Item `PAPER-BHATT-18/cohen-structure` is assigned
to DirectSummandsAndBigCohenMacaulay. Its first proof step constructs a
coefficient map W(k)→A0; its note says that no layer plans the
mixed-characteristic statement. Route 9 asks its new owner to prove the
Cohen presentation reduction, despite also saying that complete local
coefficient foundations are imported.

The accepted neighboring extraction supplies concrete counterevidence.
At the same base commit, `PAPER-ANDRE-18-B` route 4 assigns Cohen
presentation and coefficient-ring compatibility to
**DeformationAndDerivedPatchingAlgebra:R03.1**. Its
`cohen-parameter-presentation` explicitly needs a coefficient W(k) in a
complete reduced p-torsion-free Noetherian local ring with perfect residue
field. Its `coefficient-ring-compatibility` and
`perfect-residue-base-change` use the same coefficient-ring construction.
The route says: “Add the exact Cohen presentation/compatibility”.
Its review accepts the extraction. These are pending shared constructions,
not claims of completed Lean implementations.

The overlap is precise: Bhatt's complete regular mixed-characteristic A0
is reduced and p-torsion-free, and both constructions need a chosen local
W(k)→A0 inducing the given identification on residue fields. The two
presentation *conclusions* differ: André needs a finite map from an
unramified power-series ring after choosing parameters; Bhatt needs an
isomorphism or a hypersurface presentation. Those conclusions should not
be identified.

The generic coefficient construction must nevertheless have one owner.
R03.1's live contract already owns complete local coefficient categories
and residue-field extension, and reviewed AUDIT-17 reports the relevant
interfaces as incomplete. The absence of a dedicated current stage node
does not justify ignoring an accepted source route.

**Fix:** split the common coefficient-ring input from the regular-local
presentation corollary. Request/import the former at R03.1, reconciling
André's route 4 and its compatible coefficient-change data. Put the
additional regular presentation theorem with that common local-algebra
supplier, or leave it as an explicitly labeled consumer corollary that
imports the coefficient construction and R03.3's regular-local algebra.
Keep perfectoid covers and splitting obstructions in DirectSummands.
Update the item note, prerequisites, routing and reader together; retain
`missing` where no actual supplier declaration exists.

Acceptance should instantiate the **same** coefficient map in the two
papers' applications. Bhatt's existing tests Z_p[[y]] and
Z_p[x]/(x²−p) then test the two additional presentation conclusions.
No new competing coefficient-ring carrier or whole-roadmap dependency
back from R03.1 to the splitting applications is needed.

## Coverage and conclusions that survived attack

I read the complete accepted JSON, reader, review JSON/report and handoff:
89 items (10 library, 14 planned, 65 missing), nine routes, nine cited-input
records, 25 source-issue records, nine gap groups and the requests.
All 65 missing items occur in exactly one route; every local dependency
exists and the 89-item graph is acyclic. Every existing-stage route endpoint
resolves in the freshly assembled atlas. Its actual stage-edge graph is
also acyclic. This does not certify unresolved future route edges.

I freshly read all 12 pages of
[Bhatt arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2),
including proofs, footnotes and references, and inspected page images
3, 6, 7, 9 and 11. The scope is that version; the 21-page Inventiones
publication remains uncollated, as the accepted extraction already records.
No fresh acquisition of André's or Scholze's complete papers is claimed.

Additional original-source reads were Gabber–Ramero pp.8–15 (images
8, 12, 14 checked), and the published
[Bhatt, *Derived splinters in positive characteristic*](https://compositio.nl/Content/prize2016_bhatt.pdf),
printed pp.1758, 1760, 1763–1764. The latter supplies a useful reading gain:
**Theorem 2.12** treats finite-type schemes over *any* characteristic-zero
field and proves the rational-singularity equivalence. Example 2.2
explains why the earlier Kovács argument needs a replacement. This improves
the route's available citation; it does not by itself discharge the
arbitrary regular Q-algebra/Popescu reduction already transferred in G7.
Theorem 1.4 and Example 2.3 support the positive-characteristic branch.

The following controls did not produce additional findings:

- Almost-pro-zero has the quantifiers ∀k,n ∃m(n,k); it is not replaced by
  zero in the pro-category of almost modules. The quantitative bound
  c=p^k r is independent of the tower level. The tensor and Koszul
  assertions retain their scope.
- The regularity-free almost-pro result is distinguished from the
  pointwise kernel statement. Almost bases generated by compatible roots
  need not have a nonzerodivisor generator: GR Proposition 2.1.7 handles
  the filtered-principal/idempotent case.
- The derived obstruction uses a morphism and coherent cones, not merely
  maps on cohomology. The ordinary proper base-change comparison need
  only be a unit-compatible map, not an isomorphism.
- Generic surjectivity in Proposition 6.2 is already repaired by E1.
  The component counterexample, ramified root normalization, complete
  before domain reduction, and finite-extension hypothesis corrections
  are already recorded. They are not new red-team findings.
- Generic coherent proper pushforward and blowups are imported from
  StableReduction layers 2 and 4. The fresh contracts support that
  distinction. The non-Noetherian domination and integral chart additions
  remain SF.4/R2 requests; they are not misreported as supplied theorems.
- The quantitative PerfectoidRamification proposal and the DirectSummands
  application route are shared with the accepted André extraction.
  The common coefficient construction above is the remaining overlap
  identified here. The older BHATT-ETAL-23 singularity route is a consumer
  to reconcile, not evidence for a second general splitting theorem.

The fresh owner comparison read P0–P3; Q0:integral-algebra and Q3; DD.1;
E1, E2 and E5:animation; R03.1, R03.3 and P7 (including its perfect-complex
node); SF.4; R2; and the two upstream StableReduction contracts.
Reviewed library-coverage entries for R03.1/R03.3, E1/E2 and SF.4, with
AUDIT-01/17/22 review metadata, were checked. No reviewed coverage entry
for the perfectoid or DD.1 stages was found in the queried map; partial
source decompositions are not substituted for a library audit.

## Pinned-library verification

The reads use Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Files read from the installed
Mathlib tree were byte-compared with the pinned blobs; additional derived
declarations were read with `git show` at the pin.

All ten library items were checked at their actual statements:
regular-ring/local-ring predicates; faithful flatness and tensor
detection; ordinary adic completion; DerivedCategory and its localization
Q; Artin–Rees and local Krull intersection; Tau Ceti's controlled lift;
integrality of global functions under universal closedness together with
the qcqs localization and affinization inputs; Rees algebra; and graded
Proj with its positive-degree basic-open comparison.

The obstruction item's extra imports also check out:
`Triangle.mor₃_eq_zero_iff_mono₁`, the pretriangulated
`SplitMonoCategory` instance, `ShortExact.singleTriangle`,
`extClass`/`extClass_hom`, and the linear structure on DerivedCategory.
These do not supply the missing derived tensor or almost adjunction.

Targeted searches at both pins found no almost-module/almostification,
Cohen-structure or general Néron-desingularization implementation in the
searched algebra/category/ring trees (all TauCeti searched). This is
bounded search evidence, not a proof of absence of every equivalent
formulation. A broad “Popescu” hit in Mathlib was Gabriel–Popescu for
abelian categories, not the commutative-algebra approximation theorem.

## Reproducibility and validation

| Source | SHA-256 |
|---|---|
| Bhatt arXiv v2 | `08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430` |
| Gabber–Ramero sixth release | `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8` |
| Bhatt published Derived splinters | `1895449ddef2c920b3f88d1c1fbe4dd9c6f545ecd9368759b66da6a712e38ba9` |

Validation: `scripts/check_redteam.py`; `research/blueprint/intake.py
check-files` on exactly the two deliverables; staged `git diff --cached
--check`; and the route/dependency checks above. The algebraic
counterexample is an exact proof, not a finite simulation. Historical
authors' diagnostic scripts were read but not rerun here. No Lean file is
authorized, and none was compiled.
