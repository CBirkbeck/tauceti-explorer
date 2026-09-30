# RT-PAPER-KALETHA-16: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4995, job
FIX-RT-PAPER-KALETHA-16).
- Findings: `RT-PAPER-KALETHA-16.result.json`.
- Verdicts: `RT-PAPER-KALETHA-16.review.json`. The red team has thirteen findings, all confirmed.
  This job applies the five the issue lists: the high one (1) and the four medium ones (2–5). The eight
  low findings are not part of this job. Where the verifier corrected a fix, I applied its version.
- **Files changed.**
  - `papers/PAPER-KALETHA-16.result.json`.
  - `papers/PAPER-KALETHA-16.md`:
    - its "Current routes" section and the ledger entries of the changed items are re-rendered from the
      result;
    - the checkpoint's route section is marked "as first proposed";
    - its item count now gives the new total;
    - it has a new closing section.
- **Result.** 159 items (21 library, 26 planned, 112 missing) and seven routes. `check_paper.py` reports
  ok.
- **Independence.** I did none of:
  - the extraction (Codex checkpoints, then cc-442dc5);
  - its review (cc-d67081);
  - the red team;
  - the verification (codex-5ebb6f).
- **What I read.** Kaletha's author version (`ri4.pdf`), which I fetched again. Its SHA-256 1e7e6c31…
  matches the provenance the result records. I read it at:
  - the proof of Corollary 3.7;
  - the proof of Theorem 4.8, the fourth vertical map;
  - §4.7 with Lemma 4.9;
  - Corollary 5.4;
  - Lemma 5.7.

  I did not read Kot86 itself. The real-field clauses of P28 follow the verifier's reading of Kot86
  Theorem 1.2 (printed p.368).

## /1 (high, error): the parent depended on its own Part II: fixed

- **Moved into route 7 (EndoscopicTransferRigidInnerFormsPartII).**
  - D33, T51, T52 and D36 from route 4; their ownerKey is now `rigid`.
  - G05 and G09 from route 4; their ownerKey is now `globalrigid`.
  - D34 from route 3; its ownerKey is now `rigid`.
  - They sit beside their neighbours in route 7's list: D33–D34 after T50, D36 after C02, G05 after G04
    and G09 after G08.
- **P12** (ordinary Tate–Nakayama, planned ET.0) no longer lists R01, the real Weil group. P06's C/R
  fundamental class is enough.
- **Route 7's brief.** The three sentences the verifier named are rewritten:
  - The Part II now owns the rigid factor (5.1), the comparison tori, Proposition 5.6 and (5.10).
    It builds them on ET.1's ordinary factors, Whittaker normalization and product formula, which it
    imports and does not extend.
  - It proves the unconditional adelic rigid product and the mediating functions of §5.7 itself.
  - The file-ownership sentence puts RigidTransferFactors.lean in the Part II.
- **Route 7's reason** now says the Part II exports nothing back to its parent.
- **Routes 3 and 4.** Their reasons are rewritten to say that every item on them has its prerequisites
  at or below ET.0 or ET.1. Route 4 keeps D32 and now carries P18 (see /5), so it is not a planned-only
  route.
- **Checked.**
  - A DFS over all 159 items finds no dependency cycle.
  - No item planned at or routed to ET.0 or ET.1 depends, even indirectly, on a route 7 item.
  - No prerequisite dangles, and every missing item is on exactly one route.

## /2 (medium, duplicate): two proposed owners of the rigid objects: fixed here, handoff for the maintainer

- **Route 7's brief** now makes this Part II the single supplier. It names
  PAPER-HANSEN-KALETHA-WEINSTEIN-22's HeckeStacksAndLocalShtukasKottwitzPartII (items 008–010) as the
  consumer of:
  - D06 (rigid H1);
  - T13 (Corollary 3.8);
  - T44 (Corollary 5.4 on H1_ab, as erratum E05 corrects it);
  - D27 and D35;
  - C01/C02.

  It states them for real and p-adic F and keeps the p-adic refined correspondence conjectural. HKW's
  p-adic application adapters stay in HKW's Part II, including item 010's inverse-limit universal-cover
  interface, as the verifier asked.
- **relatedExtractions.** Route 7 now lists PAPER-HANSEN-KALETHA-WEINSTEIN-22.
- **Not done, following the verifier.** HKW items 008–010 are not marked planned: an accepted paper route
  is not yet an atlas stage. They stay missing and on HKW's route 1.
- **Not done, outside this job.** The HKW22 files are not deliverables here, so they are unchanged.

**For the maintainer.**
- In PAPER-HANSEN-KALETHA-WEINSTEIN-22, add EndoscopicTransferRigidInnerFormsPartII as a prerequisite of
  HeckeStacksAndLocalShtukasKottwitzPartII.
- Have its items 008–010 import this Part II's D06, T13, T44, D27, D35 and C01/C02 once those are
  stages.
- Replace 008's uncorrected "H^1(u → W, Z(G^*) → G^*) ≅ π_0(Z(\hat{\bar G})^+)^*" with the H1_ab form.
  Over p-adic F the two agree.

## /3 (medium, missing): Kottwitz's map: fixed

**New item P28, "Kottwitz's map for local reductive groups",** a theorem planned at ET.0 with ownerKey
`et0`. ET.0's own text plans "abelianized reductive cohomology, localization, Kottwitz invariants", so
P28 is planned there, not routed. I found no Tau Ceti packet for this roadmap. The only Kottwitz map in
the packets is BunGAndNewtonStrata's κ on B(G), which is a different map.
- **Contract, as the verifier refined it:**
  - α_G: H1(F,G) → π0(Z(Ĝ)^Γ)^D, functorial for normal homomorphisms;
  - on a maximal torus S, α_S is Tate–Nakayama (P12), and the restriction square commutes;
  - bijective for p-adic F, where it induces Kottwitz's group structure;
  - for F = R: the fibre over 0 is the image of H1(R,Gsc), the image is the annihilator of the norm
    N_(C/R) of Z(Ĝ), and other fibres follow by twisting, or through H1_ab (P13);
  - the torus-fibre form that Lemma 4.9 uses for every F;
  - explicitly no claim that H1(R,G) is a group or that α_G is bijective over R.
- **Prerequisites of P28:** P12, P13, P11 and P14.
- **P28 is now a prerequisite of** T14, T29, T31, T44 and T54.
- **T44** regains Corollary 5.4's last clause: for Z = {1} the pairing on H1(F,G) is Kottwitz's.
- **T31** regains §4.7's clause. For p-adic F, where H1 → H1_ab is bijective (T15), H1(u→W,Z→G) becomes
  an abelian group, compatibly with Kottwitz's group structure and with Hom(u,Z)^Γ, and the maps of
  (3.6) are homomorphisms. T15 is added to T31's prerequisites.
- **The Kot86 prerequisite's `why`** names Theorem 1.2 and P28.
- **GAP04** no longer defers Kottwitz's theorem.

## /4 (medium, missing): Tate–Nakayama in degree 2: fixed

**New item P29, "Tate–Nakayama for tori in all degrees, and H2 of tori",** planned at ET.0 with ownerKey
`et0`.
- **Prerequisites:** L26, L27, P01, P06, P07, ClassFieldTheory Layer 0 and ClassFieldTheory Layer 3.
- **Its statement** covers:
  - cup product with u_(E/F) as isomorphisms Ĥ^i(Γ_(E/F),X_*(S)) → Ĥ^(i+2)(Γ_(E/F),S(E)) for every i;
    i = −1 is P12 and i = 0 is the Ĥ⁰ → H² map;
  - compatibility with restriction and corestriction;
  - compatibility with inflation only after scaling by [E′:E]. The verifier pointed out that
    ClassFieldTheory Layer 3 forbids unscaled commutativity.
  - injective inflation of H², by Hilbert 90 for the split torus over E (P01);
  - H²(Γ,S) = 0 for anisotropic S;
  - the sign λ ↦ λ ∪ c_k^(−1) of p.587. I checked that sign in the author version's proof of Theorem 4.8,
    where the right vertical map is "the negative of the Tate-Nakayama isomorphism".
- **Its proof steps** import Layer 3's tateIso and Layer 0's tensor-product criterion, and forbid a second
  cup-product or class-formation implementation.
- **P29 is now a prerequisite of** T27, T12 and T28.
- **GAP04** is updated.

## /5 (medium, error): P18 had the wrong owner: fixed

- **P18 moves** from route 5 (AF.1) to route 4 (source → ET.1). ET.1's text constructs "the real
  character/Paley–Wiener … arguments … from AF.1's real representation foundation". P18's ownerKey is now
  `et1`.
- **Route 4's reason** asks for the character theory for all real reductive groups, not only the unitary
  groups ET.1 applies it to, as the verifier asked. It does not credit ET.1 with the real packet
  classification, which stays in route 7.
- **Route 5** keeps only P16. Its reason no longer claims a character foundation, and it points to
  route 4 for P18.
- **Route 7's brief** imports P18 from ET.1.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KALETHA-16.result.json`: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 2, UTF-8).
- The re-rendered report sections match a renderer that reproduces every unchanged ledger entry byte for
  byte.
- No Lean was compiled.
