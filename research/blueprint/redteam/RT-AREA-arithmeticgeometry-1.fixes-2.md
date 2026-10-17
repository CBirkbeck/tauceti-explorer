# Round-2 fix: all-degree cohomology of abelian schemes

Job `FIX-RT-AREA-arithmeticgeometry-1~2`, issue #8921. Codex, session
`codex-pxMEXH`, 2026-10-17. This is a finished planning fix, submitted for the
independent `REV-FIX-RT-AREA-arithmeticgeometry-1~2` review; it does not supply
that review's verdict or claim formal proof closure.

## Finding RT-AREA-arithmeticgeometry-1/1

**Applied to the packet, reader and suggested file.** The current packet already
contained `A4/all-degree-exterior-cohomology`. This fix preserves its identifier
and its prime-to-characteristic étale clause, and replaces its broad de Rham
proof obligation with the following explicit target chain:

| New A4 target | Purpose |
| --- | --- |
| `ordinary-de-rham-interface` | Base-linear differential complex, stupid filtration, perfect derived pushforward/base change and coherent/de Rham product formulas |
| `hopf-algebra-exterior-criterion` | Bounded connected graded Hopf criterion, including square-zero generators in characteristic two |
| `cohomology-of-the-structure-sheaf` | R^if_*O = ∧^i R¹f_*O, rank binomial(g,i), universal base change |
| `hodge-cohomology-of-an-abelian-scheme` | R^if_*Ω^j = ∧^i R¹f_*O ⊗ ∧^jω, all degrees and ranks |
| `hodge-to-de-rham-degeneration` | Finite locally free H^n_dR, E₁ degeneration, filtered-piece injections, locally free quotients and universal base change |
| `de-rham-cohomology-is-an-exterior-algebra` | Canonical filtered graded-algebra isomorphism from ∧•H¹_dR |
| `de-rham-cohomology-of-the-p-adic-completion` | Continuous level-limit calculation and the precise completed source application |

Every target has hypotheses, source locators, prerequisites, proof steps and
checks. The one new construction has five API items and four definition tests.
The packet now has 96 nodes, 126 API items, 101 definition tests and
28 planets (the stable exterior-cohomology milestone is now visible in A4). All implementation statuses remain unchecked.

The statement over an arbitrary, possibly nonaffine S concerns **higher direct
image sheaves**, not finite projectivity of their global sections. The reader
spells out ordinary pullback along every T→S, including nonflat and nonreduced
maps, separately from derived base change. It states ranks
binomial(g,i)binomial(g,j) and binomial(2g,n), the Hodge filtration, its graded
pieces and the absence of a chosen canonical splitting.

The proof plan first establishes the field Hopf computation, then uses lifted
products of degree-one classes to obtain the surjectivity required by Stacks
0A1U for the relative perfect complexes. Its filtered variant uses closed
invariant differentials to lift the field filtered generators into the stupid
truncations. This avoids inferring local freeness or universal degeneration
from constant fibre dimensions alone. Relative square-zero uses the primitive
coproduct and the independent tensors x_a⊗x_b, and works over nilpotent
characteristic-two bases; fibrewise vanishing alone would not suffice.

## Scope, ownership and tier order

The packet contains an explicit `restructure: rescope` proposal extending A4
beyond RS-02's degree-one boundary. The stage ID and existing milestone remain
stable. The seven added prerequisite/refinement nodes have `realises: []`
pending the independent fix review and maintainer scope decision. RS-02 and its
accepted scope files were not edited. The reader narrows the exclusion to
**full comparison theorems used as unnamed dependencies**; it no longer uses
that exclusion to disclaim the all-degree target.

The round-1 proposal's upward DD.1/DD.2 dependencies are not introduced.
A4, at tier 6, now owns the small ordinary proper-smooth de Rham interface it
needs. Higher-tier DerivedDeRhamCohomology DD.2/DD.5 should import it. General
animated, crystalline and prismatic theories retain their owners. The handoff
records the precise redirection because this job cannot edit the supplier
packets.

The current upstream **JacobianChallenge C** coherent-cohomology contract and
**AlgebraicVectorBundles L0B/L0C/L2A/L2B** operations are reused, rather than
planned again. R09.6 and SF.3's current packets do not supply the ordinary
de Rham formalism attributed to them by the old consumer requests; the first
cohomology and all-degree targets now use the explicit A4 interface. The
unrelated inherited A0/R09.6 mismatch is noted for the maintainer.

## Source checks and retained obligations

All formulations here are original target statements, not source excerpts or
section-by-section summaries. No `excerpt` field remains in the packet.

- **Original attribution:** Berthelot–Breen–Messing II, Proposition 2.5.2, as
  cited by the inspected public sources. That uncleared book was not opened,
  obtained or copied. Its proof is not represented as verified.
- **Kurama, arXiv:2410.14065v2:** §4.1, pp.8–10, Lemma 4.1, Proposition 4.2,
  Lemmas 4.3–4.4. Its base is locally noetherian. The filtered-piece and
  filtered-exterior proofs were read; arbitrary-base closure is not attributed
  to that passage.
- **Anschütz–Le Bras, arXiv:1907.10525v4:** §4.5 setup and Proposition 4.5.1,
  p.53. Its geometric formal-sheaf assertion retains the bounded-prism
  quotient and p-adic completion of an algebraic abelian scheme. A separate
  argument computes the levelwise derived inverse limit from the algebraic
  theorem and finite projective cohomology over a complete ring: split the
  bounded complex, complete its projective summands and use surjective
  transition maps. This does not claim general nonnoetherian formal functions.
- **Milne, Abelian Varieties (2022):** Theorem 15.1, Lemma 15.2 and Remark 15.4,
  pp.27–28. The Hopf criterion is shared by the coherent/de Rham and étale
  arguments. Its cited Borel 1953 Theorem 6.1 has not been independently read.
- **Stacks:** Chapter 50 version ed88ff78, §§50.2–50.3 pp.2–4 (0FL5, 0FM0),
  §50.8 pp.8–9 (0FMC), §50.11 pp.16–18 (projective-space test); Lemma
  15.78.2 (0A1U), statement and proof. Derived perfection is distinguished
  throughout from local freeness of the cohomology sheaves.

`G-exterior` now names the outstanding proof-verification inputs: the Hopf
structure theorem, the degree-one Picard/extension comparison, coherent
Künneth, universal filtered degeneration, the relative alternation argument
and the formal-sheaf/level-limit identification in ALB's exact setting. The
existing related Picard/vector-extension gaps remain. This fixes the missing
**plan**, rather than declaring those proofs done. All seven stages remain
planned, none closed, with fifteen explicit proof/source obligations.

The ALB consumer now names its precise Hodge/exterior/completed targets as
well as the stable aggregate. FKW's route still receives the aggregate's
characteristic-zero mod-p **étale** result (v2 Corollary 2.3.5 pp.17–18 and
Lemma 3.2.2 p.24); that route is not evidence for arbitrary-base de Rham
cohomology. `G-etale-exterior` retains its general étale Künneth,
cohomological-dimension and integral-reduction inputs. No review verdict,
extraction, atlas data or supplier packet was changed.

## Suggested file and validation

At the pinned sources, the exact statements of `ExteriorAlgebra.lift`,
`ExteriorAlgebra.ι_sq_zero`, `exteriorPower.finrank_eq` and `Nat.add_choose_eq`
were read. The reviewed A4 library audit and pinned ordinary sheaf-cohomology
carrier do not provide the missing relative de Rham signatures. Seven exact
omission records therefore accompany the targets. The file gives completed
proofs for Vandermonde, elliptic/surface ranks, the surface Hodge rank sum,
a square-zero exterior generator over Z/2Z, and rank-six second exterior
power of a rank-four module. Those checks do not claim geometric proofs.

The inherited file had sorry-bodied data for degree, characteristic polynomial,
coefficient composition/base change and several Riemann-form operations.
Current WORKERS.md forbids that shape. Those constructions and dependent
signatures remain in the existing mathematical manifest/reader; their data
stubs were removed. The explicit Hermitian formula now has its real body.
No target was dropped from the packet or reader.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AbelianSchemesAndArithmeticModuli.json`: no errors or warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AbelianSchemesAndArithmeticModuli.lean`: passes.
- `lean-check research/blueprint/suggested/AbelianSchemesAndArithmeticModuli.lean`: compiled at Mathlib 082e2d3 / Tau Ceti f790474; only fourteen existing theorem/example `sorry` warnings. New arithmetic/exterior examples have complete proofs.
- Packet/reader/omission-manifest consistency and exact dependency identifiers checked; the existing independent review object is unchanged.
- `git diff --check` and intake deliverable validation: passes.

The independent fix review should start with the A4 scope proposal, the new
proof chain and `G-exterior`, then check the ALB/FKW distinction and tier move.
