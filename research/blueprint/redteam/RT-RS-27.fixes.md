# RT-RS-27: fixes

Fixer: Claude Code, session `cc-c2c06b`, 1 October 2026 (issue #5553, job FIX-RT-RS-27).
- **Findings:** `RT-RS-27.result.json`, four findings (three high, one medium), all confirmed in `RT-RS-27.review.json`.
  All four are applied in the form the verifier gave, including its correction to /2's evidence: polarisations are
  AbelianSchemes A2, torsion and pairings A3, deformation A4, and PEL level data and rigidification PELModuli M1 and M2.
- **Files changed:** `restructure/RS-27.result.json`, and `restructure/RS-27.md`. The .md has updated layer notes and a
  new last section, "Fixes from the red team".
- **Result:** 38 links (34 before), 27 owner records (17 before). The layer decisions are unchanged.
- **Checks.**
  - `check_restructure.py` reports ok for every restructure file.
  - I applied the accepted restructurings to `data/atlas.json` with this file in place of the promoted RS-27
    (`scripts/restructure.py`). All four new links land as stage edges. The only skipped links are the two existing
    MordellLawrenceVenkatesh links, whose roadmap is not in the atlas yet.
- **Independence.** I wrote none of the following:
  - RS-27 (`cc-fb70e5`, PR #3954);
  - its review (`cc-58621d`, PR #4670);
  - the red team (Codex `codex-rtOQ9t`, PR #5312);
  - the verification (Codex `codex-J6LwjP`, PR #5320).
- **Disclosure.** /4 cites a fixes report of mine: I wrote `RT-AREA-algebraicgeometry.fixes.md` (PR #5202).
  - **What /4 relies on.** Its recommendation, under area /1, that SF.1 own algebraic spaces and stacks, with the
    edges SF.1 → R09.3 and SF.1 → R09.4. The red team and the verifier checked this against RS-25 and RS-05
    independently, and this fix follows their wording.
  - **A conflict with that report.** Under area /2 it also suggested an edge R09.6 → A0-extension. That is the opposite
    direction to /3's link A0-extension → R09.6. This fix follows the confirmed /3. My earlier suggestion is superseded:
    adding it now would close a cycle.

## /1 (high, missing): quasi-coherent descent: fixed

- **R09.3's `keeps` restores the module-descent export:**
  - effective fpqc descent of quasi-coherent modules on schemes, that is, the equivalence with descent data, full
    faithfulness and effectivity (Stacks 023T);
  - its functoriality and its coherence with pullback, base change and tensor product;
  - the finite-type, finitely presented, coherent and finite locally free subclasses, under the hypotheses stated in
    each result;
  - quasi-coherent and coherent modules on algebraic spaces through étale presentations, with effective descent of
    coherent modules along étale presentations of algebraic spaces of finite presentation.
- **The affine input.** It is built on Mathlib's `comonadicExtendScalars`
  (`Mathlib/Algebra/Category/ModuleCat/Descent.lean:59` at the pinned 082e2d3), which proves extension of scalars
  along a faithfully flat ring map comonadic. I read the file: its effective-descent corollary for the module
  pseudofunctor is still marked TODO, so the export says this is an affine input only. The text also says the export
  is not obtained from representability of sheaves of sets.
- **Owner.** The finding allowed either R09.3 or a named foundation supplier. Neither SF.1's contract nor RS-25's
  `keeps` names quasi-coherent module descent. SF.1 promises descent only for "explicitly specified effective object
  classes". So R09.3 keeps it, with an owner record (owner R09.3, `formerly` empty) that prevents a second construction.
- **Consumer.** ComplexComparisonPartII C3 asks R09.3 for "effective descent of coherent sheaves through étale
  presentations for proper algebraic spaces". The edge R09.3 → C3 is already in the atlas, so no new link is needed.

## /2 (high, error): specific moduli before their objects: fixed

- **What moved.** R09.4, R09.5 and R09.6 no longer keep the applications to generalised elliptic curves and
  polarised abelian schemes. A0-extension no longer says "verified in every PEL application".
- **What stays upstream.**
  - R09.4: the conditional algebraicity and representability criteria, with their hypotheses, and the elliptic case
    (the stack of elliptic curves through MC 1E's descent, and its comparison with MC 4A's Ell/R).
  - R09.5: the finite-inertia coarse-space theorem, stated for any stack meeting its hypotheses, the Deligne–Mumford
    normalisation, closure and correspondence statements, and the recovery of MC 9D and 9E with 4C's rigidifiers.
- **Owner and forwarding records.** Nothing is deleted: each application gets an owner downstream of its objects.

  | Application | Owner | Formerly |
  |---|---|---|
  | algebraicity and auxiliary level of the generalised-elliptic level stacks, with the representability hypotheses | ModularCurvesPartII R13.2 | R09.4, R09.5, R09.6 |
  | coarse spaces of those stacks, by the finite-inertia quotient | ModularCurvesPartII R13.4a | R09.5 |
  | the stack condition (effective descent) of the PEL moduli problems | PELModuli M1 | R09.4 |
  | PEL algebraicity, verification of the Artin hypotheses, rigidifying auxiliary prime-to-p level | PELModuli M2 | R09.4, R09.5, R09.6, A0-extension |
  | coarse spaces of the PEL stacks at non-rigidifying level | PELModuli M6 | R09.5 |
  | the representability hypotheses for Hilbert–Blumenthal moduli | HilbertModularVarietiesAndShimuraCurves H1 | R09.6, A0-extension |

- **No backward imports.** Every owner already lies downstream of the stage it takes from. I checked the paths in the
  union graph: R09.4 reaches R13.2, R13.4a, M1, M2, M6 and H1, and R09.6 and A0-extension reach M1, M2, M6 and H1.
  R13.2 reaches every ModularCurvesPartII consumer of R09.5 (R12.3, R13.3, R13.4, R13.4a, R13.4b). So no forwarding
  link is needed, and none of the cycle-forming imports R13.1 → R09.4 or A1 → R09.4 is added.
- **The other consumers of R09.4.** EndoscopicTransfer ET.2b (stacks of G-bundles and Hitchin fibrations) and
  InverseGalois IG.5 (Hurwitz spaces) use only the general stack machinery, which stays at R09.4.

## /3 (medium, missing): no supplier for Artin's criterion: fixed

- **A0-extension is the single owner of the criterion.** That covers limit preservation, the representable diagonal,
  deformation and obstruction theory, openness of versality and algebraisation. The new owner record has `formerly`
  R09.6. A0-extension's `keeps` says that it exports the criterion to R09.6 as a conditional theorem with all its
  hypotheses.
- **R09.6** now keeps the conditional representability interface built on the imported criterion, the comparison of
  versal deformations with completed local rings, algebraisation and the 7B/7D check. A0-extension is added to its
  `suppliedBy`.
- **New link A0-extension → R09.6.**
  - It is acyclic: in the union graph there is no path between the two stages in either direction before the link.
  - A0-extension does not depend on R09.6, so no deformation prefix had to be split off.
  - The AdicSpacesPartII F0 and R3 imports of R09.6 are unchanged.

## /4 (high, duplicate): foundations at SF.1 and D0: fixed

- **R09.3 now imports algebraic spaces from SchemeAndStackFoundations SF.1.** That covers quotients of schemes by étale
  and fppf equivalence relations, effective fppf descent of sheaves as algebraic spaces, representable diagonals,
  atlases and atlas independence.
  - **What R09.3 keeps:** quasi-coherent descent (/1), the comparison with MC 0C, 4C and 9A stated for SF.1's
    quotients, Weil restriction as an algebraic space, and polarised moduli descent.
  - **Owner record:** SF.1, `formerly` R09.3 and R09.4. It matches RS-25's record for SF.1's "algebraic-space/stack
    interfaces".
- **R09.4 imports from SF.1 and from DiamondsAndVStacks D0.**
  - **From SF.1:** representable diagonals, smooth and étale atlases, atlas independence, and the distinction between
    moduli functors, stacks, coarse and fine spaces.
  - **From D0:** ordinary prestacks and stacks on a site, with descent data, stackification, 2-fibre products and
    groupoid quotients. RS-05 keeps these at D0. Owner record: D0, `formerly` R09.4.
  - **What R09.4 keeps:** categories fibred in groupoids over (Sch/S)_fppf as instances, algebraic and Deligne–Mumford
    stacks with their properties, quotient stacks, the conditional criteria and the elliptic comparison.
  - **The carrier.** Mathlib's `CategoryTheory.Pseudofunctor.IsStack`
    (`Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`) is named as the existing carrier. The pinned declaration
    index has no algebraic-space or stackification declaration, so nothing else is reused.
- **New links:** SF.1 → R09.3, SF.1 → R09.4 and D0 → R09.4.
  - All three are acyclic, jointly with /3's link.
  - SF.1's suppliers are SF.0, FoundationsAndLibraryIntegration LI.3, MC 0E and StableReduction layer 2. D0's are
    AdicSpaces layer 1 and the ECD base.
  - Every consumer of R09.3 and R09.4 reaches the foundations through these links.
- **No SF.1 or D0 contract is edited.** Both already keep this work under the accepted RS-25 and RS-05, so the single
  owner is the one those reviews accepted.

## Not changed, and notes for the maintainer

- **R09.3's descent of polarisations of abelian schemes** stays in `keeps`, because no finding concerns it. It has
  the same shape as /2: abelian schemes and polarisations are defined downstream, in AbelianSchemes A1–A2. A later
  review should decide whether it becomes PELModuli M1's, as the PEL stack condition now is. AbelianSchemes A6 consumes
  R09.3 and sits upstream of M1, so moving it would also need a check of what A6 uses.
- **Owner stages whose text is narrower than the record.**
  - PELModuli M6 builds the moduli stack at arbitrary level and fine spaces at rigidifying level, but does not yet
    state the coarse space.
  - ModularCurvesPartII R13.2 proves algebraicity "in the precise ranges", without naming auxiliary-level
    rigidification.
  - Both records are forwarding contracts. When these stages are blueprinted they should state those applications,
    using R09.5's and R09.4's general theorems.
- **The roadmap-level `reason`** says "seven layers narrowed". The file narrows eight layers (R09.1–R09.6, R09.7a and
  A0-extension) and keeps R09.7. I left the sentence alone, because no finding concerns it.
