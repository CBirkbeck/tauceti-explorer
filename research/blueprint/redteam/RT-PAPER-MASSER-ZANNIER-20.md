# Red team: Masser–Zannier (2020)

Agent: Codex, session `codex-rtOQ9t`. Issue: #5061.
Date: 2026-10-01. Status: complete. Three findings: two high, one medium.

The accepted extraction has two unsafe supplementary targets and one unresolved
ownership conflict. Its principal existence and counting results are not disproved
by this report. In particular, a gap in the extra rational-torsion assertion must
not be reported as a counterexample to Theorem 1.1.

## Scope and evidence

The target is `PAPER-MASSER-ZANNIER-20`, at repository commit
`1487a97f4339cdb535733c234f4961b5dc8dc37d`. I read its result and reader files,
all 72 items, eight routes, 19 prerequisites and 12 source issues, together with
the accepted review JSON, review report and handoff. The extraction and its
accepting review were by other workers; I did neither.

I reread all 40 pages, including references, of the published paper:

- David Masser and Umberto Zannier, *Abelian varieties isogenous to no Jacobian*,
  Annals of Mathematics 191 (2020), 635–674;
  [journal PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf).
  SHA-256: `8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60`.
  Text read throughout; delicate formulas on pp. 666–667 and the passage on
  pp. 669–670 were also inspected as page images. Accessed 2026-10-01.
- The [journal record](https://annals.math.princeton.edu/2020/191-2/p07) and
  [Crossref record](https://api.crossref.org/works/10.4007/annals.2020.191.2.7)
  were checked on the same date. Crossref returned no update-to/updated-by entry
  and an empty relation object. The searches made did not locate an erratum;
  this does not establish that none exists.

Additional primary sources were read only to the following extent:

- Samuel Le Fourn, *A tubular variant of Runge's method in all dimensions, with
  applications to integral points on Siegel modular varieties*, ANT 13 (2019),
  [published PDF](https://msp.org/ant/2019/13-1/ant-v13-n1-p04-s.pdf),
  printed pp. 180–182, especially Definition–Propositions 6.4 and 6.6 and
  Definition 6.5. These provide the compactification and arithmetic-level
  statements used below. Accessed 2026-10-01; not a full-paper read.
- Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*,
  [author's manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf),
  Chapter II, printed pp. 118 and 121: Remmert–Stein (8.7) and Chow (8.10),
  including their surrounding text. The downloaded PDF was readable although
  the browser fetch timed out. Accessed 2026-10-01; not a full-book or full
  Remmert–Stein-proof read.

## Finding 1 — global closed analytic hypersurface is impossible (high)

**Where:** item 66; route 7's analytic-hypersurface endpoint; corresponding
reader discussion of §5.4.

The extracted theorem promises a transcendental complex analytic hypersurface
in all of `A_g` meeting every algebraic isogeny class. For `g ≥ 2`, this cannot
mean a closed analytic subspace of pure codimension one in `A_g`. The problem
is already in the source's globalization step, pp. 669–670, rather than a
misquotation by the extractor. Its local-equation argument does not justify
the global target.

Here is a direct obstruction, independent of the interpolation estimates.
Put `G = g(g+1)/2`, `X = A_g^Sat`, and `B = X \ A_g`.

1. Le Fourn 6.4(a,b) gives projectivity of `X` and `dim B = G−g`.
2. If `W` is a closed analytic hypersurface in `A_g`, its local dimension
   is `G−1 > G−g` for every `g ≥ 2`.
3. Demailly II(8.7) applies to the complex space `X`, analytic subset `B`,
   and analytic subset `W` of `X \ B`. Thus its closure in `X` is analytic.
   This statement allows singular ambient complex spaces, so coarse-moduli
   singularities do not invalidate the application.
4. Embed `X` in projective space and apply II(8.10). The closure is algebraic,
   and its restriction to `A_g` is exactly `W`. In particular `W` is algebraic,
   contrary to the extracted transcendence conclusion. The extraction's own
   item 58 also rules out such a hypersurface meeting all the indicated classes.

Even a reducible closed hypersurface does not evade this argument. Compact
analytic closure supplies the needed finiteness of irreducible components.
The dimension inequality deliberately excludes `g = 1`.

The source sentence “finally we multiply them together” (p. 670) is where the
globalization needs justification: equations on different neighborhoods cannot
be multiplied into a globally defined equation without extending and matching
their domains. A local analytic set or an immersed/nonclosed image has a
different specification and is not ruled out by this obstruction.

**Fix:** retain the interpolation construction and its compact real-analytic
image as separate targets. Replace item 66's global closed-hypersurface theorem
by a precisely specified local/germ or nonclosed statement only after proving
that version. Until then, record the global statement as a source issue and
gate that endpoint in route 7 and the reader. Do not silently keep both
global closedness and transcendence. No change to the main algebraic
hypersurface-avoidance theorem follows from this finding.

**Regression:** any proposed global replacement must survive the inequality
`G−1 > dim(A_g^Sat \ A_g)`; any local replacement must name its open ambient
domain and specify closedness relative to that domain.

## Finding 2 — geometric theta level does not supply rational 16-torsion (high)

**Where:** item 56's final clause; item 58's extra torsion conclusion; route 7's
promised field bound with that conclusion.

These targets identify a field obtained from the theta model with a field over
which the entire 16-torsion is rational. The last paragraph of §5.2 (p. 666)
deduces this from the congruence subgroup. A complex analytic level quotient
controls geometric monodromy. An arithmetic descent and a universal family
with the stated constant torsion require additional data.

For a principally polarized `A/K`, the perfect, Galois-equivariant Weil
pairing gives an immediate necessary condition:

```
A[16](K) = A[16](Kbar)  ==>  mu_16 ⊂ K.
```

Indeed choose a point of exact order 16. Perfection supplies another torsion
point whose pairing with it is a primitive sixteenth root of unity. If both
points and the polarization are defined over `K`, so is that value. In
particular no real number field can be such a field. The cyclotomic extension
has degree `phi(16) = 8` over `Q`.

Le Fourn Definition 6.5(b) and Definition–Proposition 6.6(a), printed p. 182,
put the full symplectic level model over `Z[zeta_n,1/n]`. They distinguish it
from merely choosing a model over `Q` of the underlying complex variety.
An abstract `Q`-model, or a twisted level structure, does not make the
constant symplectic basis descend over its residue field.

A useful diagnostic is the theta model itself. At `tau = i I_g`, every
`theta_{m0}(16 tau)` is a positive real sum. Their projective ratios are real.
Under the asserted algebraic finite forgetful map, the theta point over the
algebraic moduli point of the product with period `i` is algebraic. Its
coordinate field is therefore real. It cannot simultaneously serve as the
field of a principally polarized variety with all 16-torsion rational. This
tests the claimed coordinate-field implication, not Hodge genericity or the
existence of some other suitable field. If the chosen `Q`-model's forgetful
map or moduli interpretation does not descend as assumed, that is precisely
the arithmetic comparison which must be supplied.

The issue changes the target interface and the degree bookkeeping. It is not
settled by item 72's separate field-of-moduli/field-of-definition discussion:
a model of the abelian variety does not itself trivialize its torsion.

**Fix:** separate three objects: the theta coordinate model, an arithmetic
fine-level moduli model with its universal principally polarized abelian
scheme, and the fields of definition of that scheme and its torsion. Prove
the comparison using the existing PELModuli M2/M5 and AbelianSchemes A3/A5
interfaces. Account for the cyclotomic and any further descent extension
in `D(Atilde,Psi)` and in the final field-degree estimate. Either prove the
extra torsion assertion with the advertised numerical bound after this
accounting, or retain it as a source-qualified, unresolved supplementary
claim. Record the missing implication as a new source issue and propagate
its gate to items 56/58 and route 7. Do not create a second general theory
of Weil pairings or level moduli.

This report does **not** assert that adjoining `zeta_16` suffices for all
descent, that the final bound must increase, or that the extra existential
torsion assertion is false. The large numerical estimate might absorb an
extension, but an explicit proof is needed.

**Regressions:** rule out full rational 16-torsion over a real field; distinguish
a cyclotomic symplectic basis from a twisted level structure; check the actual
field degree after descent instead of carrying over the geometric degree.

## Finding 3 — functional-transcendence supplier is duplicated (medium)

**Where:** items 19–23, route 1, and route 7's import list; reader owner map.

Route 1 makes LD.6 the owner of definable uniformization, Ax–Lindemann and
weakly special geometry. Items 19 and 21 are marked planned there; 20, 22 and
23 are sent there as new source material. Its stated precedent is the old
Tsimerman extraction, while its own note leaves a competing Part II owner
for later selection.

The current `LogicAndDefinabilityInNumberTheory:LD.6` contract builds its
applications “from separate Galois-orbit bounds, definability of uniformization
and functional-transcendence theorems.” Its acceptance condition requires
independent suppliers. That is not a promise to prove Ax–Lindemann inside
the counting layer.

More decisively, accepted `PAPER-MOK-PILA-TSIMERMAN-19`, route 1, already
creates `LogicAndDefinabilityPartII` for precisely the shared functional
transcendence, uniformization definability and weakly special foundations.
Its review accepts that placement and explicitly separates early LD.6
counting from the downstream applications that consume the Part II.
Leaving two constructions with a future choice of owner is an actual
duplication in the executable design briefs.

The current Tsimerman result no longer supports the cited precedent either:
`special-weakly-special`, `uniformization-definability` and
`hyperbolic-ax-lindemann` are missing items assigned to that shared Part II.
These edits were merged in #5252 (`2f545c0`) as FIX #4985. Its result expressly
says independent fix review is pending; this report does not call that fix
accepted. The already accepted Mok–Pila–Tsimerman route and LD.6's actual
contract suffice for the finding independently of that pending review.

**Fix:** preserve LD.6's counting, blocks and arithmetic application targets
(items 16–18 and 38). Coalesce items 19–23 with
`LogicAndDefinabilityPartII`, using its existing roadmap ID, parent and title.
Mark the imported foundations as missing until the common proposal plans
them; identify the genus-one and Siegel specializations explicitly. Share
one Ax–Lindemann proof/deduction with the Tsimerman consumer. Update route 7
to import this supplier rather than attributing it to LD.6. Maintain the
ordering

```
early LD.6 o-minimality/counting -> shared Part II -> LD.6 applications
```

Importing the entire undivided LD.6 stage back into the Part II would defeat
that ordering. Any needed blueprint stage split belongs to that design work;
this report does not claim it already exists in the atlas.

## Checks that did not produce findings

The full source/item comparison covered the following parts of the extraction:

| Items | Coverage |
| --- | --- |
| 1–15 | Moduli, genericity, uniformization, invariants, heights and Rosati conventions |
| 16–29 | Counting, functional transcendence, Galois specialization and lattice/group inputs |
| 30–40 | Genus-one estimates, counting, the one-parameter sketch and interpolation |
| 41–55 | Higher-dimensional period/isogeny estimates, blocks, forms and vanishing order |
| 56–68 | Theta degree, endpoints, density, CM counts and supplementary geometric claims |
| 69–72 | Quotients, degree/length comparison, projective projection and descent |

All twelve previously recorded source issues were compared with the paper.
They are not new findings. In particular, the rational-trace correction to
the endomorphism discriminant, the strict vanishing-order inequality, and
the unresolved one-parameter exponent already have explicit records.
The apparent inversion error in (49) was rejected after page-image inspection:
the displayed map is reciprocal and its stated inverse agrees with it.
The quotient item does not assert that every finite subgroup preserves a
principal polarization, so the stronger incidental claim on p. 636 is not
charged to that item. No additional correspondence-degree finding is made:
the exact polarized Hecke/Hodge-line calculation would require further
source work beyond simply observing that fiber cardinality is insufficient.

I assembled a fresh 2,907-stage atlas from this base and read the relevant
contracts, not only search hits: D1/D4/D5; A3/A5; M2/M5; V0/V2/V5; B4/B5;
AA.3; R01.6; R12.1/R13.4; IG.2; LD.6; DT.0; GN.1; R35.3/R35.4;
R28.2/R28.4; CM.0/CM.2. The eight routes and their shared CM and quantitative
isogeny Part II imports were compared with the related extractions. I do not
claim a proof of every external prerequisite or a global graph certificate.

The reviewed audit was read at `data/library-coverage.json`, including its
acceptance metadata and the entries for D1, R01.6, R13.4, IG.2, A3, M2, M5
and GN.1. LD.6 has no corresponding audited entry in that snapshot. Audits
consulted were AUDIT-02/08/09/10/31, with accepted review metadata dated
2026-09-16 or 2026-09-17.

Actual library statements were read at the required pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: upper half-plane and
  modular fundamental-domain declarations; Frattini/non-generating subgroup
  statements (including the coatomic hypothesis); number-field logarithmic
  heights; `WeierstrassCurve.j`; Minkowski's first theorem; and the polynomial
  resultant vanishing criterion. The algebraic invariant is not by itself
  the analytic `j` comparison, and the first theorem is not Minkowski's second.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: the finite-surjective
  `AbelianVariety.IsIsogeny` definition; `cholesky`, its factorization,
  `continuous_cholesky` and `choleskyHomeomorph`. Continuity suffices for the
  interpolation's factor choice; a new Lipschitz package is not required by
  that step.

These checks support reuse of the cited library fragments. They do not
certify the larger analytic/moduli theorems as formalized. No Lean file is
required or compiled for this red-team report; no Lake setup, cache download,
library build or language server was run.

## Validation

The red-team JSON checker, the intake deliverable checker and the staged
whitespace check pass. Only this report and its matching result JSON are
submitted. Findings are proposals for independent verification; no source
extraction, roadmap, audit or upstream file is changed here.
