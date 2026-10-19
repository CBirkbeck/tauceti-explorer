# BP-MotivesAndAlgebraicCycles--MC.4 — handoff

Issue #10830. Worker: Claude (Opus 5.5), session `claude-nJ6DFS`, 19 October 2026. This is a
complete target-level planning pass for the follow-up of `MotivesAndAlgebraicCycles:MC.4`. It goes
to independent review and is not a checkpoint. It claims no formalisation.

## Scope

The queue gives this job the scope `MotivesAndAlgebraicCycles:MC.4` only, and the packet's `scope` is
that stage. The full instructions inside the issue still describe the old "part 2 of 2, MC.4–MC.7"
job. MC.5, MC.6 and MC.7 have their own follow-up issues (#10831, #10832, #10833), so this part plans
MC.4 alone.

Of the maintainer-added sources in the issue, none is for MC.4: they are for MC.0, MC.2, MC.6 and
MC.7. The same holds for the two red-team findings handed to the job.

- RT-AREA-iwasawa-3/8 concerns the MC.5–MC.6 Tate localisation and PS.2. FIX-RT-AREA-iwasawa-3~2 to ~4
  have already applied it in the base packet.
- RT-AREA-geomlanglands/17 concerns Tannakian reconstruction at MC.6. FIX-RT-AREA-geomlanglands~2
  addressed it in the base packet.

Neither touches MC.4, and this part changes nothing about them. The MC.6 follow-up (#10832) inherits them.

## What was done

- **Packet** `research/blueprint/packets/MotivesAndAlgebraicCycles--MC.4.json`, part `MC.4`, status
  `complete`. It has 17 new nodes:
  - 11 theorems, 4 constructions and 2 definitions;
  - 57 API items and 25 unit tests;
  - 10 baseline declarations, each read at Mathlib 082e2d3;
  - 1 gap, 4 requests and 5 source issues (E101–E105, new ids after the base packet's E1–E47).

  `TAUCETI_BASELINE=… python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. A node-level
  check shows that no supplier node cited here depends on any MC.4 node. The stage-level loop
  MC.4 → M.7 → … → M.5a predates this part: M.7/beilinson-lichtenbaum cites the base MC.4 nodes.
- **Reader** `research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.4.md`. It has a hand-written
  introduction (conventions, imports, layer structure, acceptance tests, planets, base-packet rewiring,
  gaps and sources). The node sections are rendered from the packet, so the two agree.
- **Suggested Lean** `research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.4.lean`, 657 lines,
  `import Mathlib` only.
  - It elaborates with `lean-check` at the pinned build (Mathlib 082e2d3, Tau Ceti f790474): exit 0, no
    errors, and 77 warnings, all `declaration uses 'sorry'`.
  - Every API item and unit test name of the packet occurs in the file.
  - Statements whose carriers are not at the pins appear as comments naming the README target. These are
    the moving lemma (effective cycles of bounded degree, Chow varieties), the smooth blow-up triangle and
    blow-up formula (blow-ups), and a few unit tests that need SF.5 Chow groups.
  - Resolution of singularities appears as `[CharZero k]`. Quasi-projectivity appears as `[IsAffine …]` in
    one statement, since Mathlib has no quasi-projectivity predicate at the pin.

## How the base packet's remaining items are handled

The base coverage of MC.4 listed four items.

1. **Friedlander–Voevodsky, Bivariant cycle cohomology, Theorems 8.2 and 8.3.** Obtained (IAS preprint)
   and planned:
   - `bivariant-cycle-cohomology` (definition);
   - `equidimensional-cycle-localisation`, `bounded-family-moving-lemma` (with Friedlander–Lawson, author's
     copy), `projective-duality-for-equidimensional-cycles` and `duality-for-equidimensional-cycles`;
   - `naive-bivariant-comparison`, `bivariant-duality` (8.2) and `bivariant-suspension-and-gysin` (8.3).

   `hom-into-motives-with-compact-support` (Voevodsky 4.2.3–4.2.8) then proves MVW 16.22 and 16.24, which
   the base nodes `bivariant-shifting-theorem` and `friedlander-voevodsky-duality` cite. Duals, rigidity
   and the Chow comparison follow.
2. **Voevodsky, Triangulated categories of motives.** Obtained (IAS preprint) and planned:
   - `smooth-blow-up-triangle` (3.5.2, with Cohomological theory 5.18–5.21, from a Wayback copy of K-theory
     preprint 0368);
   - `blow-up-formula-over-a-perfect-field` (3.5.3 and g_Z);
   - `gysin-triangle-over-a-perfect-field` (3.5.4), which includes the layer's acceptance test at a closed
     point of a curve over any perfect field;
   - `chow-motives-functor` (2.1.4, with full faithfulness through 4.2.6).
3. **Relative cycles and Chow sheaves.** Obtained (IAS preprint).
   `equidimensional-cycles-transfers` plans the transfers, pushforward, flat pullback, base change,
   exterior product and duality embedding of `z_equi` from SV §§3.6–3.7. That replaces MVW Exercise 16.3.
4. **Delete cancellation-over-a-perfect-field and nisnevich-versus-etale-and-rational-coefficients.** These
   are no longer in the base packet. Nothing to do.

**The base packet must still be rewired.** The base nodes keep citing their gaps or the resolution
hypothesis until a fix of `MotivesAndAlgebraicCycles.json` applies the replacements listed in this
packet's `restructure` (kind `base-node-rewiring`) and coverage `remaining`:

- `gysin-triangle` is superseded by `gysin-triangle-over-a-perfect-field`.
- `blow-up-smooth-centre-and-gysin-map` is superseded by `blow-up-formula-over-a-perfect-field`.
- `friedlander-voevodsky-duality` and `bivariant-shifting-theorem` take
  `hom-into-motives-with-compact-support` and `bivariant-duality` as prerequisites.
- `compact-support-kunneth` takes its map from `equidimensional-cycles-transfers`.
- `chow-motives-into-geometric-motives` takes its functor from `chow-motives-functor`.
- The transfer items of `equidimensional-cycle-sheaves` move to `equidimensional-cycles-transfers`, which
  avoids a cycle.

Consumers of the base `gysin-triangle` (MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum,
MC.4/geometric-motives-generated-by-smooth-projective) should move to the perfect-field node. This is a
packet edit outside this job's deliverables. The assembly ASM-MotivesAndAlgebraicCycles, or a fix job,
must carry it out.

## Requests answered here, and requests made

**Answered here** (made of MC.4 by other packets):

- `PeriodsAndSpecialValues:PS.9` asked for "the Tate-generated subcategory". `tate-motives` plans
  `DTM(k, R)` with its Hom groups. The other half of that request, the rational motivic cohomology/Adams
  K-theory identification, belongs to MotivicEtaleKTheory:M.6b (`rational-motivic-degeneration`), not to
  MC.4.
- `ZagierConjecturePolylogarithms` request MT-1 asked for mixed Tate motives MT(F) over number fields with
  Ext computations. The triangulated part is `tate-motives`. The heart and its Ext groups extend
  PS.9/mixed-tate-z, which already owns MT(Q) and MT(Z), so the request should be redirected to PS.9.
- `LogicAndDefinabilityInNumberTheory:LD.3` asked for a scissor/product realisation into a named localised
  rational Grothendieck ring of motives. This is `grothendieck-ring-of-varieties` plus
  `compactly-supported-motivic-measure`, into `K_0(DM_gm(k, Q))[(1 − [Q(−i)])^{−1}]`, under resolution of
  singularities.

**Made by this packet:**

- `MotivicEtaleKTheory:M.5a`: the cdh topology, the cdh vanishing theorem (FV 5.5 / MVW 13.25),
  Voevodsky 4.1.10, and relative cycles (SV 3.3–3.4, MVW 1A). M.5a's own coverage lists these as remaining.
- `SchemeAndStackFoundations:SF.4`: resolution of singularities as FV Definition 3.4, Hironaka, smooth
  compactification, Nagata.
- `SchemeAndStackFoundations:SF.0`: étale coordinates for smooth pairs (EGA IV 17.12.2).
- `AlgebraicModuliForArithmeticGeometry:R09.1`: Chow varieties and continuous algebraic maps over arbitrary
  infinite fields, and FV Proposition 2.3. R09.1/chow-parameters covers only algebraically closed fields of
  characteristic zero.

## Gap and source issues

- **Gap.** The moving lemma and the duality it gives over finite fields (E101). Friedlander–Lawson need
  infinite or "sufficiently large" finite fields; Friedlander–Voevodsky state the results over any field.
  The nodes are stated over infinite fields. A transfer argument with two coprime finite extensions is
  sketched in the gap, not planned. Friedlander–Lawson use that device only for their Theorem 3.4 (intersection
  products), not for the moving maps.
- **Source issues for the reviewer:**
  - E102: Voevodsky 3.5.3 cites 4.1.3, which needs resolution, instead of 3.5.2.
  - E103: the cycle-class property of g_Z and the normalisation α(P^c, pt) are not proved in the source.
    The plan supplies a route through Chow groups and the deformation to the normal cone.
  - E104: Voevodsky 2.1.4 does not check compatibility with composition.
  - E105: Cohomological theory, Proposition 4.23 asserts Mayer–Vietoris exactness for every cover of a
    semi-local scheme. MVW Lemma 22.10 and the remark after it (pp. 185–186) say it omits the passage to a
    smaller open U, and correct it; Voevodsky also called the proof wrong (IAS page). Homotopy invariance is
    imported from M.5a instead of that paper's Theorem 5.6.

## Planets

No new planets: the base packet's six fill MC.4. The `restructure` entry proposes four sub-layers with
planets for each, moving *Gysin triangle* to the perfect-field node.

## Sources

| source | URL | sha256 | read |
| --- | --- | --- | --- |
| Voevodsky, Triangulated categories of motives | IAS `…/files/s5_0.pdf` | `b15df626…` | §§2–4 |
| Friedlander–Voevodsky, Bivariant cycle cohomology | IAS `…/files/s4.pdf` | `c5edd971…` | §§1–8 |
| Suslin–Voevodsky, Relative cycles | IAS `…/files/s2.pdf` | `4f2cfb71…` | §§3.3–3.4, 3.6–3.7 |
| Voevodsky, Cohomological theory | Wayback copy of K-theory 0368 `s3.pdf` | `5072e58b…` | §§5.2–5.4 |
| Friedlander–Lawson | USC author page, `14.pdf` | `da01bf9a…` | §§0–3 |
| MVW | Clay PDF | `1197e239…` | App. 1A, Lectures 15, 16, 20 |

All full URLs and hashes are in the packet. None of these books is in the cleared library, and none was
needed from it. Voevodsky's Homology of schemes (Selecta 1996), which Triangulated categories of motives
cites for the normalisation step, was not read (E103).

## Checks run

- `python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- `lean-check` on the suggested file: exit 0, no errors, only `sorry` warnings (77).
- Every API item and unit-test name of the packet occurs in the suggested file (script check).
- A Sonnet agent cross-checked all 45 locators (about 125 numbered statements) against the downloaded
  texts. It found three page or wording slips, now corrected (E101's finite-field page, E105's locator,
  the naturality page for g_Z), and no contradiction with a source statement.

## For the review and the follow-ups

- Check E101: does a published correction exist?
- Check the cycle-class route of `blow-up-formula-over-a-perfect-field` step 6.
- Check the precise statement of `hom-into-motives-with-compact-support` (e) for Hom between motives of
  smooth proper schemes.
- After acceptance, a fix of the base packet should apply the rewiring above. The assembly should then
  adopt the sub-layer and planet proposal.
