# DESIGN-SymplecticReidemeisterTorsionModSquares

Issue #3427; author Codex, session codex-yzPdpu. This is a completed target-level
design pass for independent review, under PROTOCOL §0. It is not a checkpoint or
a claim of formalisation. The packet status is `complete`; RT.0 through RT.8 are
all `planned`, with none closed. Every node remains `unchecked`.

The four deliverables define nine layers and cover exactly the 41 extraction
items routed here by PAPER-ABDURRAHMAN-VENKATESH-25. The packet contains 63 nodes:
9 definitions, 14 constructions, 33 theorems and 7 comparisons. There are 90 API
items, 69 discrimination tests for definitions/constructions, three additional
circle-theorem regressions, 41 planets, 13 baseline declarations, 16 supplier
requests and one explicit gap. The reader gives every statement, proof contract,
API item and test, with a route table and source-version register.

## Mathematical scope and checks

The design imports the generic graded determinant theory from KTheoryLowDegrees,
finite-field rank-sensitive homology/Chern comparisons from
KTheoryFiniteLocalFields, K₃/Hurewicz comparisons from K3BlochGroups, and universal
étale Chern inputs from MotivicEtaleKTheory. It uses the existing square-class and
spinor-norm APIs. It does not re-plan those developments.

Conventions distinguish integral H₃ modulo two from full mod-two homology,
ordinary fixed spaces from generalized eigenspaces, and unsigned discriminants
from signed discriminants. The geometric targets concern compact smooth
manifolds. The source's boundary dimension and coefficient half-rank are
independent parameters. The reader contains detailed proof contracts for:

- normalized specialization through even strict models and determinant root
  lines, retaining the failure of arbitrary base change for raw torsion;
- an all-odd-characteristic circle computation using the strict cross pairing
  and generalized minus-one block, supplying the finite-coefficient
  mapping-class statement needed by SymplecticLFunctionsModSquares;
- the genus-two Gaussian witness, with explicit twist order and intertwiner;
- controlling extensions with zero **upper** weighted-density exceptions, the
  compositum restriction condition, and the cubic density improvement;
- the separate real Bockstein argument on full mod-two homology.

Both Gaussian examples were recomputed from free-group words and the cocycle
rule with exact rational-complex arithmetic. The surface relator, all four
intertwining equations, and T̃ι=ιM⁻¹ were checked before passing to the quotient.
The first quotient has characteristic polynomial x⁴+1 and determinant ratio
4/2=2; the second has polynomial (x²+1)² and ratio 8/2=4. The reader records the
algorithm and full input data, so the scratch computation is not needed to
reproduce these checks.

`python3 scripts/check_blueprint.py` passed with zero errors and zero warnings.
It also passed with a declaration index produced by the submission check's
scanner from the actual cited Lean source files. All reader statements, API
statements and tests were checked for agreement with the packet; the extraction
route was checked for exact set equality. `check_sorry_data.py` passed.

The 172-line suggested file **compiled successfully with `lean-check`**, exit
zero, at the shared pinned build. Available memory exceeded the required
threshold. Its only warnings were 20 permitted proof-placeholder warnings. The
four lightweight definitions have actual bodies over existing carriers. The
reader lists every carrier family omitted from Lean and the corresponding
required targets. Elaboration checks suggested forms; it proves no roadmap
result. No build, cache download or language server was started.

## Baseline and ownership evidence

The recorded pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau
Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Relevant reviewed library-coverage
audits, including AUDIT-29 and AUDIT-30, were read. Cited declaration statements
were inspected. The square-class Basic and Multiplicative files and spinor-norm
Basic file used by the prototype were compared byte for byte with the pinned
GitHub files. In particular, the pin's orthogonal star-norm convention requires
the SO comparison in RT.4; the current upstream reverse-norm description is not
silently substituted for the pinned declaration.

The current upstream AlgebraicTopology and OrthogonalSpinGroups documents and
relevant Suggested files were read, together with geometric, Chebotarev and Lie
group supplier scopes. The nine newer upstream roadmap directories and current
Tau Ceti sources were searched for overlap. The Zassenhaus determinant and
torsion targets were not found there. No upstream tree or other packet was
edited. No definition was moved from a higher tier: generic lower-tier owners
are retained, and the new topological targets live here.

## Sources and limits

The source metadata gives URLs, SHA-256 values, access dates and precise reading
scope. Statements and source findings are in our own words.

- Abdurrahman–Venkatesh, arXiv:2303.13436v1: §§1.1, 1.3.3, 2 and Appendices A–C.
  TeX was consulted for signs and matrices. All AV locators are for this 98-page
  preprint. The author copy was compared at the relevant B.9/B.10 passages.
- Jouve–Rodriguez Villegas, arXiv:1004.4208v3, *On the bilinear structure
  associated to Bezoutians*: Theorem 5.1 and proof, pp. 16–17, and Lemma 6.1,
  p. 18. Only the Zassenhaus formula is imported, not the preliminary
  unrestricted spinor-surjectivity assertion.
- Thom, *Quelques propriétés globales des variétés différentiables*, Chapter IV
  §8, Theorem IV.13, p. 81: point bordism coefficients. The labelled comparison
  is an explicit skeletal-induction target, not attributed to this coefficient
  calculation alone.

The published AV full text (Inventiones 241, 717–839) was **not** read. Published
metadata and correction searches do not establish which preprint findings
persist in that version. The same version limit applies to the JRV finding.
Twenty source findings are recorded without an independent-review verdict.
The primary real Chern comparison arguments cited by AV were not inspected;
their exact mathematical obligation is in the M.8 request. Serre's
*Lectures on N_X(p)* is not cleared by the supplied library index and was not
read or used from another copy. No restricted-library material was copied.

## Remaining work and resume point

The one genuine unresolved leaf is RT.5/quadratic-cover-detection. The extraction
assigned arithmetic-scheme Chebotarev to AnalyticNumberTheory AN.4, but that
layer does not supply the required theorem for normal finite-type arithmetic
schemes. The packet proposes **AnalyticNumberTheory, Part II** with closed-point
Frobenius detection and the quantitative characteristic-zero nonsplit-cover
lower bound. Supply an accessible primary proof, correct counting normalization
and exact producer IDs. The Spec Z[t] test rules out the source's claimed unit
normalization of its weighted total count. Number-field Chebotarev is not a
replacement for this gap.

The 16 requests are consumer contracts, not edits to their suppliers. They cover
AlgebraicTopology stages 2/4/5/6; GeometricTopology layers 6/11; Kummer line-pair
and normal-domain gluing in M.1; universal normal-ring finite-coefficient Chern
classes and the real comparison in M.8; the dyadic number-field rank/surjection
in M.7; unstable Hurewicz in V.4; Witt congruence lifting in L.1; the specific
symplectic universal-cover kernel in LieGroups layer 5; and Chebotarev layers
7/11/13. Each request names its consumers and exact statement. The packet's
`upstreamNotes` distinguish the missing smooth triangulation comparison and
π₁(Sp)=ℤ calculation from the existing general upstream targets.

For the next independent reviewer and any accepted follow-up:

| Layers | Required work before closure |
| --- | --- |
| RT.0 | Discharge local-coefficient, chain-level duality and smooth finite-cell contracts. |
| RT.1 | Check reverse-wedge, shift and Lagrangian determinant diagrams against the imported determinant nodes. |
| RT.2 | Discharge simple cellular and boundary-cone comparisons; verify boundary signs. |
| RT.3 | Check even stabilization and normalized root-line gluing; discharge labelled geometric, Kummer and Chern contracts. |
| RT.4 | Review the characteristic-free circle proof and discharge the topology contracts. |
| RT.5 | Resolve the arithmetic-scheme leaf, dyadic Chern rank input and unstable Hurewicz request. |
| RT.6 | Discharge RT.5 inputs and check the finite-group count and density induction. |
| RT.7 | Resolve the detection leaf and Witt lift contract; check passage to all fields. |
| RT.8 | Discharge the real Chern/metaplectic, Bockstein and specific universal-cover inputs. |

Start with the reader's two sign calculations and the explicit open-leaf
register, then the RT.5 arithmetic-scheme contract. All targets are planned, so
the next step is independent review and the protocol's follow-up process,
rather than adding more targets in this design job.
