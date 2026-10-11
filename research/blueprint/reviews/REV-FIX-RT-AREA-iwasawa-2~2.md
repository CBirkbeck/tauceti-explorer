# Independent correction review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-zcNnM2`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6107393765).
Input commit: `b88f5c327ce51cae963db4c5ff7edb373d7c8243`.
I did none of the fixes under review. This run holds one claim.

## Disposition

**Scope-blocked checkpoint.** The six correction decisions are established
below. The issue-named L3 and PMIA packets carry this session's verdicts;
their complete prior records are appended to `reviewHistory`. The mathematical
fields and all Suggested files are unchanged. PMIA remains `needs_changes`
because five generic targets are already implemented in current Tau Ceti.

The live issue lists two packets. The queue additionally lists L3-2 and D.1,
whose top reviews name earlier layer-review jobs. Consequently the unchanged
`issues.deliverables_complete` predicate is false. Substituting only the two
prepared review candidates in a read-only overlay makes it true. A negative
PMIA verdict is a completed review and does not cause this blockage.

[WORKERS.md](../WORKERS.md), Doing the work, explicitly says: “Edit only the
files the issue names, plus your own scratch space.” I requested authorization
for the two omitted packet paths in the worker conversation. No reply has
arrived. The candidates remain uninstalled, and the
[handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) gives their exact review
records, byte guards and installation procedure. Reconcile the live deliverable
list with the queue, or authorize those two paths, before another dispatch.

## Findings and changes

This is a bounded review of verified red-team corrections, rather than another
exhaustive audit of all packet nodes. I read the original findings, verifier
decisions, round-two fix report, relevant statements, prerequisites, APIs and
distinguishing tests. The full 79-node L3-2 and 72-node D.1 ledgers remain
attributed to their earlier reviewers; my candidates archive them intact and
describe this session's narrower checks.

| Finding | Verdict | Boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Accept L3 correction | RD.6, dyadic comparison and exponent-zero endpoint remain separate obligations. |
| /2 Ferrero–Greenberg | Accept L3-2 correction; metadata prepared | Convergence and arithmetic nonvanishing remain independent inputs. |
| /3 Classical log-syntomic comparison | Accept D.1 correction; metadata prepared | Shared CS.0–CS.3 producers remain requests. |
| /4 Character orders, Fitting ideals and transpose | PMIA needs changes | Arithmetic repairs pass; five generic targets must reuse current implementations. |
| /5 Finite slope for complexes | Retain LAD correction | Representative dependence and the stronger Stein/solid hypotheses are explicit. |
| /6 Main-conjecture proof routes | Retain verifier's rejection | Accepted RS-16 I.5 retains independent Hecke/congruence and Euler-system routes. |

No mathematical correction was necessary within the permitted packets. I
corrected the inherited report’s pinned transpose declaration name from the
nonexistent `.transpose` suffix to `TauCeti.AuslanderReitenTranspose`; the
packet already cites the correct name. Changes
are fresh review metadata, preservation of prior attribution, this report and
its handoff. LAD and RS-16 were read-only context. The
[input report](https://github.com/CBirkbeck/tauceti-explorer/blob/b88f5c327ce51cae963db4c5ff7edb373d7c8243/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
and [input handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/b88f5c327ce51cae963db4c5ff7edb373d7c8243/research/blueprint/handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
retain the preceding checkpoint and its historical evidence.

## Fresh source checks

I retrieved nine public PDFs and reproduced their SHA-256 receipts, recorded
in the handoff. I inspected the scanned Morita and Gross–Koblitz pages visually.
No book was used. These are my own statements of the relevant contracts.

**/1.** [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1, Lemma 1 and Theorem 1, pp.255–256, distinguishes the signed continuous
extension from the unsigned natural product. Both unit and nonunit
recurrences are required. The dyadic modulus-four exception must survive the
passage to continuity; the buffered congruence handles it. Signed values at
1 and 5 are 3 and 1 modulo 4, so period four fails there.
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1, equations (1.2), (1.5), (1.6) and Theorem 1.7, pp.570–571, uses a
negative Gauss sum and the root convention π^(p−1)=−p,
π≡ζ−1 modulo (ζ−1)^2. Its setup excludes p dividing 2N and its theorem
uses nonzero exponent. Separate dyadic and zero-exponent arguments remain
necessary. Sixteen gaps and thirteen requests, including RD.6, stay open.

**/2.** [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461 and §4, equations (4.1)–(4.6), Theorem 4.1, pp.471–473, supports
primitive odd χ of conductor N>1 prime to p, compatible embeddings and the
even χω branch. At p=2, ω has conductor four. With log_p(p)=0,

`L_p′(χω,0) = Σ χ(a) log_p Γ_p(a/N) + (1−χ(p)) B₁,χ log_p(N)`.

The Gamma weights are χ(a). The conductor term can also be expressed using
L(χ,0)=−B₁,χ, and disappears under χ(p)=1. The contracts retain this range,
the independent nonvanishing request and the convergence majorant. Appendix B
p.474 requires the strict-endpoint repair E37. The finite permutation checks
below test the repaired inequality. Five gaps and eight requests remain.

**/3.** [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2
pp.4–8, Theorems 2.2–2.3 pp.7–8, requires the undivided fiber of p^r−φ
on J^[r] and divided fiber of 1−φ_r on the lifted divisible ideal J^<r>.
The map ω from undivided to divided has legs (p^r,id); τ in reverse has
(id,p^r). Both composites are p^r; only ω generally preserves products.
For r=(p−1)a+b, the modified twist includes (p^a a!)^−1. Exact divided
integral comparison has i≤r≤p−2 and fine, saturated, log-smooth hypotheses.
Undivided integral comparison retains bounded torsion error.

[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37,
gives the rational exponential as an isomorphism for i<r and injection at i=r
under its quasi-compact formal semistable hypotheses. Theorem 5.4 p.54 gives
integral bounded-error period comparison with semistable/base-change
restrictions and its stated constants. The packet preserves this distinction.
[Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14 and
Proposition 4.13 pp.53–54, supplies the boundary-sign comparison. Inverting ω
and applying p^−r normalization is rational. Shared CS.0–CS.3 producers remain
requests; nine gaps and twenty requests remain, with no integral inverse.

**/4.** [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3
pp.15–17, Lemma 3.9 pp.25–26 and §6.1, Lemma 6.1 p.40, requires the
character-evaluation image order R_Ψ, generally smaller than the full product.
Sharp transports to R_(Ψ^−1) and is an endomorphism only for inverse-stable Ψ.
Finite-index/cardinality claims retain nonzerodivisor and finiteness
assumptions. Transpose is presentation dependent over the opposite ring.
Appendix B.2 p.93 equation (171) is the excess-generator higher-Fitting formula,
distinct from (175). The compound-image repair uses

`det(A_J)x = C_r(A) i_J(adj_r(A_J)x)`.

It supplies an actual preimage; left multiplication alone does not establish
image preservation. A nontrivial 3×4, r=2 numerical example checks this
identity. The arithmetic repairs stand; newer generic implementations keep
PMIA negative. Eighteen gaps and three requests remain.

**/5.** [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 p.139,
uses a bounded projective Banach representative with degreewise compact action.
The nonalternating degreewise Fredholm product depends on the representative;
cohomological support gives the invariant. LAD's representative/Fredholm
contracts and inclusive ≤h complement retain this distinction.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 p.21 and
§4.6.46, Remark 4.6.47 pp.93–94, imposes Stein conditions including a countable
affinoid cover, dense restrictions and relative compactness. Finite slope is
the f_*f^* localization in the solid derived setting. LAD retains these
stronger hypotheses, foundation requests and restricted comparison.

**/6.** I read the accepted RS-16 result's `IntegralIwasawaTheory:I.5` decision.
It retains Mazur–Wiles and totally-real Wiles Hecke methods independently of
the Euler-system route. The verifier's rejection of the alleged conflation
remains supported; no route is deleted.

## Library and ownership boundary

Programme pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read relevant
library-coverage entries and these exact pinned statements:

- `ContinuousMap.unitsOfForallIsUnit` uses existing continuity and pointwise
  unit proofs; it does not establish Gamma continuity
  (`Topology/ContinuousMap/Units.lean:82`).
- Mathlib `gaussSum` is the positive finite sum, requiring the source-sign
  adapter (`NumberTheory/GaussSum.lean:72`).
- Tau Ceti's Teichmüller construction lifts residue units into integer units
  (`NumberTheory/LocalField/Teichmuller.lean:100`).
- `TauCeti.AuslanderReitenTranspose` is the opposite-linear dual cokernel
  of an arbitrary map, without minimality to construct it
  (`Algebra/Module/AuslanderReiten/Transpose.lean:94`).

Separately, current TauCetiRoadmap is
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read ProfiniteArithmetic and
StableReduction as upstream models. PMIA must reuse these current suppliers:

| PMIA L6 target | Current supplier and boundary |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal` for finite modules over a commutative ring (`RingTheory/FittingIdeal/Basic.lean:343`). |
| `higher-fitting-independence` | `Submodule.minorsIdeal_ker_eq_of_surjective`, comparing finite free surjections (`Basic.lean:304`), and `fittingIdeal_eq_minorsIdeal_ker` (`Basic.lean:349`). |
| `relation-minors-add-generator` | The same independence handles generating families; arbitrary families still need a span/image adapter. |
| `higher-fitting-base-change` | `fittingIdeal_baseChange` for any commutative algebra, without flatness (`RingTheory/FittingIdeal/BaseChange.lean:134`). |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` for exact surjective projective presentations over arbitrary rings, without finiteness (`Algebra/Module/AuslanderReiten/StableTranspose.lean:91`). |

The opposite-ring stable-transpose dual factors are P₀×Q₁ and P₁×Q₀.
Preserve these factors, arbitrary-family adapters, arithmetic image orders,
sharp transport, contragredient conventions and nonflat tests. The coordinated
revision covers packet, reader, Suggested and consumers; reader and consumers
are outside this job's live list. StableReduction's sheaf targets are not
supplied merely by the ring-module API. None of these newer declarations is
attributed to the older programme pin.

## Verification and review coverage

All four actual packets pass `scripts/check_blueprint.py` with zero errors.
L3 retains 26 short-API warnings; the others have none. The two candidates pass
under a read-only overlay at their intended paths. Preservation checks retain
all non-review fields, full preceding reviews and histories. No packet or
candidate has an `excerpt` field. Intake's changed-file check and
`git diff --check` pass.

Four fresh sequential `lean-check` runs used the shared pinned build:

| Suggested file | Result |
| --- | --- |
| L3 | Exit 1 at unresolved module prefix `research`, before body elaboration. |
| L3-2 | Exit 0; 111 `sorry` warnings, no other diagnostics. |
| D.1 | Exit 0; 307 `sorry` warnings, no other diagnostics. |
| PMIA | Exit 0; 1,075 `sorry` warnings, no other diagnostics. |

Available memory exceeded the required 20 GB threshold beforehand. No build, dependency update, language
server or Lean edit occurred. L3's import failure remains a limitation;
whole-file elaboration is not claimed.

Fresh finite checks give G₃(4)=2, G₃(5)=−8 and the dyadic modulus-four failure.
Sampled periods for p∈{2,3,5,7}, r∈{1,2,3,4} pass outside (2,2). FG
permutation bijectivity, congruence and strict filtration pass for
(p,N,B)=(5,3,25),(2,3,4),(2,3,16),(3,1,9). The compound example has
matrix rows (1,2,0,3), (0,3,1,2), (0,0,3,1), first-three-column
determinant 9 and r=2. Its explicit preimage (7,−9,0,3,0,0), in
lexicographic two-subset order, produces (18,−9,27)=9(2,−1,3). These are finite example
checks, not theorem proofs or claims of implementation.

Reviewed L3 suffixes: `morita-natural-values`, `morita-natural-recurrence`,
`morita-natural-unit-norm`, `morita-natural-prime-power`, `morita-natural-block`,
`morita-natural-congruence`, `morita-natural-buffered-congruence`,
`morita-gamma-functional-equation`, `morita-natural-shift-disc`,
`morita-natural-inverse-norm-bound`, `robert-gross-koblitz-comparison`,
`gross-koblitz-gamma-source-product`.

Reviewed L3-2 suffixes: `rjw2-gk-root-ideals`, `rjw2-gk-root-congruence`,
`rjw2-fg-count` and its `-apply`, `-nat`, `-step` API;
`rjw2-fg-permutation` and its `-apply`, `-congruence`, `-filtration`, `-range`,
`-injective` API; `rjw2-fg-differentiation`, `rjw2-fg-count-character-sum`,
`rjw2-ferrero-greenberg`, `rjw2-fg-exceptional-zero`,
`rjw2-fg-exceptional-derivative`, `rjw2-fg-nonvanishing`.

Reviewed D.2 suffixes: `log-syntomic-complex`,
`fontaine-messing-kato-period-map`, `syntomic-exponential`.
The source-sensitive PMIA L6 character-order, sharp, cardinality,
compound/adjugate and transpose contracts and the five current-library
duplication decisions were rechecked. The preceding report retains its
original fifty-contract audit; this run does not claim to repeat it.
