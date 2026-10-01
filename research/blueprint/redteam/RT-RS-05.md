# RT-RS-05 — adic spaces, perfectoid spaces and diamonds

**Status: complete. One high-severity finding.** Agent: Codex, session
`codex-rtOQ9t`; 1 October 2026. Refs #4393.

The accepted proposal changes the retained VS4 target into a false compactness
criterion. Perfect compact-open invariants characterize ULA in the stated
regime. Compact induction supplies a compact object whose invariants are not
perfect. The rest of the audit found no additional evidenced error, omission
or duplication in this restructuring.

The author of RS-05 was Codex, session `codex-c83e7a`; the reviewer was
Claude Code, session `cc-442dc5`. This worker did neither job. Issue #4393
confirmed this session's claim before work began.

## Finding RT-RS-05/1: VS4 excludes its own compact generators

**Kind:** error. **Severity:** high.

**Where:** `RS-05.result.json`, the `keeps` field for
`VStackSheavesAndLisseCategories:VS4` (line 246), and `RS-05.md`, the
retained-layer table's VS4 row (line 65). Both require compact objects to have
finite HN support and perfect compact-open invariants.

The decisive sources are Fargues–Scholze,
[Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
Theorems V.4.1 and V.7.1 (printed pp. 177 and 183). Their lisse counterparts
are Propositions VII.7.4 and VII.7.9 (printed pp. 273 and 275). Read on
1 October 2026. The quotation and exact locators are in the JSON evidence.

Here is a counterexample within the permitted torsion-coefficient regime.
Set

$$
E=\mathbf Q_5,\quad G=\mathrm{GL}_1,\quad
H=E^\times,\quad K=1+5\mathbf Z_5,\quad
\Lambda=\mathbf F_3.
$$

The subgroup $K$ is compact, open and pro-$5$. Let

$$
V=\mathrm{c\!\operatorname{-}Ind}_K^H\Lambda
  =\Lambda[H/K]
  \cong\mathbf F_3[\mathbf Z\times\mathbf F_5^\times].
$$

Smooth Frobenius reciprocity gives

$$
\operatorname{Hom}_H(V,M)\cong M^K.
$$

The right-hand functor is exact: for a smooth vector, averaging takes place
in a finite $5$-group quotient, whose order is invertible in $\mathbf F_3$.
It also commutes with arbitrary direct sums. Thus $V$ is a projective compact
object of the derived smooth representation category, concentrated in degree
zero.

Because $H$ is abelian, $K$ fixes every coset in $H/K$, so it acts trivially
on $V$. Consequently

$$
R\Gamma(K,V)=V[0],\qquad V^K=V.
$$

The cosets of $5^n$, $n\in\mathbf Z$, already give infinitely many linearly
independent basis vectors. Thus $V$ is infinite dimensional over
$\mathbf F_3$. A vector space in degree zero is a perfect complex over this
field only when it is finite dimensional. The required invariants are
therefore not perfect.

For $G=\mathrm{GL}_1$, transport $V$ through the degree-zero stratum
equivalence with $[*/\mathbf Q_5^\times]$. This component is open and
closed. Extension by zero to $\mathrm{Bun}_{\mathrm{GL}_1}$ has one
nonzero compact stratum restriction and is compact. It has finite HN support
and fails the proposal's perfect-invariants condition.

This also conflicts with the already correct accepted node
`VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`.
The original roadmap and AUDIT-21's VS4 compactness target agree with that
node; VS5 separately owns its ULA criterion. The error is introduced by the
restructuring's retained-scope wording.

**Required correction:** change both restructuring deliverables to retain
finite HN support and compact stratum restrictions, with the applicable
thick closure of compact inductions. Preserve the existing compactness
node and the SR.2 import. Keep the perfect derived $K$-invariants theorem
under VS5's ULA/admissibility contract and its coefficient hypotheses. Adding
admissibility to compact-induction generators would preserve the error.

## Scope and conservation checks

The audited repository revision is
`844ce3da495ebb0cbd425ae6cf423c05e2afb614`. I read the two accepted
deliverables, the independent review, all nine member roadmap documents,
the unchanged AdicSpaces anchor, all 71 layer dispositions and all 62
ownership entries. The 227 family evidence records reduce to 116 unordered
pairs; the report has a disposition for every pair.

| Family component | Boundary checked |
| --- | --- |
| AdicEtaleGeometry / AdicSpacesPartII | R0 owns tensors and ordinary analytic morphisms; A1 owns analytic sites, R4 their early reexport; F0 retains formal geometry, R2 adds models/generic fibres, R3 coherent geometry; A3/A4 retain their analytic work before D6 diamondification. |
| PerfectoidSpaces | P0 general almost algebra and DD.0 classical cotangent theory remain distinct; P1/P2 add general perfectoid and almost conclusions beyond the anchor; P3's early comparison precedes P5's limit descent; P7/P8/P9 keep their representability, quotient and torsor-descent proofs. |
| DiamondsAndVStacks | The ordinary D0 interfaces, Perf topologies, quotient diamonds, small v-stacks and D6 comparison have separate carriers and suppliers. |
| ClassicalAdicEtaleCohomology | H0's analytic instance and continuity, the independent H1 substages, and H2-H5 field/curve/trace/comparison inputs are retained. H1:henselian supplies the corresponding C5 application. |
| DiamondEtaleCohomology / DiamondSixOperations | Relative sites, enhancements, compactifications, operations, dimension bounds and smoothness/duality retain their spatiality, compactifiability and coefficient restrictions. |
| PerfectoidShimuraVarieties | General limits and group actions do not replace the anticanonical/Frobenius tower proof, Hodge-type closed-locus argument or pre-abelian quotient construction. |
| VStackSheavesAndLisseCategories | Artin eligibility, ULA geometry, qualified solid theory, generated lisse categories and smooth-representation imports remain distinct. The false VS4 compactness wording is the finding above. |

The target retains or supplies every changed layer's other roadmap targets.
No roadmap or layer is dropped, and no Tau Ceti roadmap or layer is mutated.
In particular, the anchor's fixed characteristic-$p$ field example does
not supply general perfectoid rings, tilting or relative curves. Its
structure-sheaf acyclicity is distinguished from étale and almost
cohomological statements.

Proper GAGA was checked as a possible late-dependency problem. The current
AdicSpacesPartII packet already has the canonical R3 nodes
`R3/proper-gaga` and `R3/proper-gaga-coherent-equivalence`, each also
realizing R1. The early analytification carrier remains in R1. Multiple
`realises` entries do not imply two constructions, and I found no basis
for a second finding here.

## Dependency checks and accepted exceptions

Every endpoint of the 454 links, every owner stage and every narrowing
supplier resolves in the browser atlas. I checked the full directed graph
with exact stage IDs, before and after adjoining all proposal links. Both
graphs are acyclic. Collapsing independently usable substages to their
parents creates misleading apparent cycles and is not the atlas's graph.

Checking suppliers against the existing consumers reproduces the fifteen
absent forwarding links identified in REV-RS-05:

- R0-R3 to R09.6, R13.1 and R11.1, except the already present R3-to-R09.6
  edge: eleven pairs;
- R3 to R2 and H1:formal-adic-comparison: two pairs;
- P9 to O0 and RF0:integral-Y: two pairs.

I read those consumer descriptions and the report's exception table.
Their retained formal or ambient product inputs do not require the
relocated late analytic or continuous-torsor-descent theorem. R3-to-R2
would reverse the existing R2-to-R3 order. The accepted exceptions are not
reported again as errors; no additional omitted forwarding link was found.

## Library and source checks

The pinned revisions are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Actual declaration statements
were read at those revisions:

- `Condensed/Solid.lean`: profinite constructions and the explicit
  general-ring caveat on `CondensedMod.IsSolid`;
- the Grothendieck-abelian sheaf-module and general sheaf instances, with
  their smallness/sheafification assumptions;
- `Sheaf.H` as Ext and `cechComplexFunctor` as an existing complex
  construction, distinguished from comparison and geometric theorems;
- `PreTilt.untilt` and `surjective_fontaineTheta`, including every
  section hypothesis and the additional Frobenius-surjectivity assumption;
- `HenselianRing` and the naive `Algebra.Extension.cotangentComplex`;
- Tau Ceti's `IsSmoothDiscrete`, its continuity criterion and
  `discreteRepEquivSmoothTopRep`, distinguished from Bun_G geometry and
  enhanced smooth-representation theory.

All sixteen reviewed family entries in `data/library-coverage.json`
were read (AUDIT-18 and AUDIT-21). No new broad absence assertion is made
from a failed name search. The older VS4 audit wording about smooth
representations does not override the actual pinned dictionary.

Additional primary-source checks used
[Scholze's Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf)
for the analytic/diamond site comparison and comparison/operation inputs,
and [the p-adic Hodge erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf)
for the transfinite covering convention. The corrected cover condition
survives the A1/D2 distinction. These are targeted checks of a restructuring;
this report does not independently re-certify every proof in later,
much larger blueprint packets.

## Validation

Passed:
```text
python3 scripts/check_restructure.py research/blueprint/restructure/RS-05.result.json
python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-05.result.json
python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-RS-05.result.json research/blueprint/redteam/RT-RS-05.md
git diff --cached --check
```

Independent JavaScript checks during the browser portion verified the result
schema and exact-stage graph. After local access was restored, the official
Python validators were run on the recovered deliverables. This job has no
Lean deliverable and no Lean compilation.
