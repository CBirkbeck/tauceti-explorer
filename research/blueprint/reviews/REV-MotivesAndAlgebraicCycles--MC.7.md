# Independent review of MC.7

**Accepted after corrections, 19 October 2026.** Reviewer: Claude, session
`claude-0tXYQo`, job `REV-MotivesAndAlgebraicCycles--MC.7`, issue #10804. The
plan was written by the different session `codex-JD3HRJ` (#10833, PR #11076).

The verdict covers the [packet](../packets/MotivesAndAlgebraicCycles--MC.7.json),
the regenerated [reader](../readmes/MotivesAndAlgebraicCycles--MC.7.md) and the
[suggested file](../suggested/MotivesAndAlgebraicCycles--MC.7.lean). The packet
stays `complete` and MC.7 stays `planned`: 50 nodes (16 definitions, 24
theorems, 5 comparisons, 5 applications), 72 API items, 48 unit tests, four new
planets plus the two retained ones, nine baseline declarations, twelve gaps and
thirteen requests (sixteen before the review). Nothing is closed or
implemented. No node was added; 38 nodes were corrected and 12 verified without
change, each with its own entry in `review.checked`.

## What was checked, and how

- **Sources.** All fourteen public sources were fetched; every PDF hash and the
  Stacks HTML hash match the packet. Each node was checked at its locator. The
  Kleiman scan has no text layer, so pp.11–18 were read as rendered pages. Pages
  where text extraction loses symbols were rendered before any verdict:
  Benoist–Wittenberg p.59 (the Campedelli map), Li–Liu pp.5–7 and 52 (Theorem 1.5,
  the C_r constant and the proof). Locator retrieval for the long sources was
  delegated to retrieval agents. Every flag they raised was decided here at the
  page, and about a third of them were rejected as extraction artefacts (for
  example a lost overline on F̄_p in Totaro's preprint).
- **Baseline.** All nine declarations were read at Tau Ceti `f790474` and Mathlib
  `082e2d3`: `HodgeStructureOn`, `piece`, `mem_conjF_iff`, `IsMorphism`,
  `IsMorphism.map_piece_le`, `tate`, `tate_piece`, `TStructure` and
  `TStructure.heart`. Each exists under that name and gives what its citing
  node needs. None was removed.
- **Ownership.** The current TauCetiRoadmap main (`2b35f483`) was read.
  AlgebraicVectorBundles names the Hodge Conjecture interface only as
  successor-roadmap motivation, so MC.7 duplicates no Tau Ceti roadmap. The
  current Tau Ceti (`a91d3aaf`) has rational Hodge substructures but no
  type-(p,p) rational subspace. The reviewed library audit has no MC.7 entry.
- **Closure.** Every prerequisite id resolves. Every bare stage citation is now
  covered by a request whose consumers cite it. An all-packet node-level
  strongly-connected-component scan, with and without the atlas stage
  `requires`, finds no cycle through MC.7. The cycle the T6 review recorded
  runs through R28.4 → MC.7, so MC.7 must not be cited upstream of it. That
  cycle stays closed.
- **Checker and Lean.** `check_blueprint.py` reports 0 errors and 0 warnings.
  `lean-check` of the suggested file exits 0, with the three expected
  admitted-proof warnings only (diagonal membership, functoriality,
  off-diagonal vanishing).

## Corrections made in place

1. **Li–Liu statements.**
   - Theorem 1.5 is printed (author copy p.5) with the set condition
     R_π⊆R and |R∩V_F^spl|≥2. The node's statement carried the text-extraction
     corruption |R\V_F^spl|>2, which its own Check warned about. Corrected.
   - Hypothesis 4.5 quantifies over every open compact level, not only neat
     ones; its codimension is m=r.
   - Hypothesis 6.6 now has the source's exact condition on π̃∞: standard base
     change at almost all unramified places, in situation (b) of Lemma 3.15.
2. **Kleiman.**
   - The register entry B1 dropped the hypothesis of Proposition 4.3(2)(b) on
     surfaces (dim H¹ = 2 dim Pic⁰); restored, with stability under products and
     hyperplane sections.
   - The register omitted the Hodge standard conjecture for surfaces in every
     characteristic (§5 p.17); added as Hdg2. It follows from SF.5/hodge-index
     once R-SF5 identifies numerically and homologically trivial divisors.
   - The B node now says that its inverse-Lefschetz form is Kleiman's θ(X),
     equivalent to B(X) by Theorem 4.1(3).
3. **Other statements.**
   - BW2 Proposition 7.7 is for Fano threefolds over the real numbers.
   - BW Proposition 5.2 has no dimension restriction; the node now says so
     while keeping d≥3.
   - The motivic t-structure node records that Beilinson works over any field:
     the field restriction is MC.4's domain. The unit-in-heart condition is made
     explicit, as Beilinson uses it in §1.3.
   - Murre's conjecture now carries Jannsen's standing assumption that the
     Künneth components are algebraic.
4. **Seventeen locators.**
   - Kleiman: A(X,L) is on p.14; D(X) is in §5 p.17; B and C made page-exact.
   - Deligne: the divisor case is §2 Remarks (iii) p.2, not §4.
   - Benoist–Wittenberg: Definition 2.2 p.37; Proposition 2.13 pp.41–42;
     Lemma 2.14 and (2.2)–(2.3) p.42; Proposition 2.15 p.43; Proposition 3.9 p.51;
     Theorem 3.16 p.55; Examples 4.5–4.6 p.60; Examples 4.7–4.8 pp.60–61;
     Proposition 5.2 p.66; Remarks 5.3 p.67; Questions 2.16 p.44 and 4.9 p.61.
   - Totaro's preprint: Theorem 2.1 and its proof are on p.3. It treats
     bidegree (3,4); BW apply the argument to (4,4).
   - Jannsen: the proof of Theorem 5.2 ends on p.296.
   - Li–Liu: Lemma 11.1 is on p.49 and the proof of Theorem 1.5 on p.52.
5. **Exact supplier nodes.** Several sibling packets were merged on 19 October
   after the plan was written; these and older accepted packets now supply
   exact nodes for many stage citations:
   - MC.0: universal CH₀ support, diagonal decomposition, supported and real
     vanishing, quartic universal support, intermediate index.
   - MC.2: Betti and l-adic realizations, the étale–Betti comparison,
     realization quotients; also the base packet's `MC.2/weil-pushforward`.
   - The base packet's MC.4 nodes: DM_gm, rigidity, Chow embedding, dual of
     M(X).
   - ComplexComparisonPartII `C5/proper-pure-hodge`,
     `C5/multiplicative-period-interface` and `C3/proper-gaga-equivalence`.
   - SchemeAndStackFoundations: SF.5 Chow group, pushforward, pullback,
     intersection, ample, adjunction, surface pairing, Hodge index; SF.3
     Picard–Brauer; SF.2 Kummer; SF.4 resolution of curves.
   - `DWP.9/hard-lefschetz-4-1-1`, and the two R28.4 nodes for Faltings's Tate
     homomorphism and semisimplicity.

   The targets now cite these nodes directly.
6. **Requests.**
   - Withdrawn, because exact nodes now supply them: R-MC0, R-MC4 and
     R-FALTINGS.
   - R-MC2-EARLY now asks only for the tensor triangulated Betti and l-adic
     realizations of DM_gm used by the two t-structure nodes.
   - R-C5 now asks for Hodge–Riemann, Betti hard Lefschetz and the
     (equivariant) exponential sequence.
   - R-SF2 and R-SF5 dropped the parts that exact nodes supply. R-SF4 notes that
     MC.0 requests the same imposed-point Bertini statement (MC0-R2), so SF.4
     should supply it once.
   - Consumer lists were rebuilt from the prerequisites. Before, nineteen
     consumer entries did not cite the stage, and nine stage citations had no
     request.
7. **Bookkeeping.**
   - The unused SF.5 stage citation of the Enriques node was removed: its
     classification input is the gap G-COMPLEX-THREEFOLD.
   - The coverage `remaining` list, the conventions (the hard Lefschetz owners),
     the restructure proposal for MC.2, the upstream audit and the validation
     notes now match.
8. **Suggested file.** Added `rationalClassesOfType_wrong_weight`, the API
   item that makes vanishing off the diagonal bidegree a stated target. The API
   item `rationalClassesOfType_ext` only restated `Submodule.ext`, so it was
   replaced by the membership simp lemma `mem_rationalClassesOfType`, proved by
   `Iff.rfl` in the file. Every API name of the one Lean-backed definition now
   occurs in the file. The two proved examples are labelled with their packet
   test names; the third test stays a README target.
9. **Reader.** Regenerated from the corrected packet. A renderer reproduced
   every original node, request and gap section byte for byte from the original
   packet. It was then applied to the corrected packet, and the prose counts,
   conventions and source-edition lines were patched to agree.

## Mathematical spot checks

These were recomputed rather than taken from the plan:

- the Campedelli obstruction (weights (1,7,2,6,3,5,0); weight spaces of
  dimension 4/3; T²=−1 on the weight-4 quadrics; Koszul twist);
- the Stacks 0FH9 multinomial coefficient ((n−1)!)^n n!;
- the d=1 counterexample behind BW Theorem 3.16 (finding E1): a real curve of
  odd genus with a real point has split Picard descent and no even-genus curve;
- the k=0 exclusion for constant classes (E2);
- the Lefschetz fixed-point trace giving rank 30 for the real-empty quartic
  threefold;
- the valuation argument over k̄((t));
- the sign (−1)^j in the Hodge standard conjecture against Hodge–Riemann;
- the projectors π_{2j}=h₁^{d−j}h₂^j on P^d and the pointed-curve projectors;
- the P¹×P¹ test for conjecture D.

## Source issues

- **MotivesAndAlgebraicCycles/E-MC7-1 (Stacks 0FH9):** confirmed. The tag
  displays ((n−1)!)^n n^n = (n!)^n where the product of n square-zero classes
  survives n! times. Any nonzero integer gives the torsion conclusion.
- **No new source mistakes were found.** The paper findings referenced in
  `sourceIssueReferences` belong to their extraction files and were not
  re-reviewed, apart from the spot checks of E1–E3 above. Li–Liu's set condition
  is an extraction artefact, not a misprint.

## Questions for the orchestrator

1. **Missing owners.** The proposed owners behind G-TOPOLOGY (equivariant
   semialgebraic cohomology), G-QUADRATIC (quadratic forms over real function
   fields) and G-AIP (unitary arithmetic inner product, Kudla–Rapoport cycles, RSZ
   models) are still unregistered. MC.7's real and Li–Liu chains cannot close
   until they exist.
2. **R-MC2-EARLY.** It asks MC.2 for realizations of DM_gm(k,Q). MC.2 plans
   realizations of Chow motives only, and MC.5 gives a Betti realization over Q
   through Nori motives. Decide whether MC.2, MC.4 or MC.5 owns the triangulated
   realizations.
3. **One Bertini extension.** SF.4 receives the same imposed-point Bertini
   extension from MC.0 (MC0-R2) and MC.7 (R-SF4). It should be planned once.
4. **MC.0's gap G1.** The adapter from varying to fixed CH₀ supports now sits
   under `real-unramified-cycle-defect` and `quartic-threefold-torsion` through
   the MC.0 nodes they cite.
