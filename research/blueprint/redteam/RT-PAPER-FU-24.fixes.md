# RT-PAPER-FU-24: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4975, job FIX-RT-PAPER-FU-24).
- Findings: `RT-PAPER-FU-24.result.json`.
- Verdicts: `RT-PAPER-FU-24.review.json`. All 17 findings are confirmed. The verifier refined most of the
  fixes, and where it narrowed one I followed its version.
- **Files changed.** `papers/PAPER-FU-24.result.json`, `errata/PAPER-FU-24.json`, and
  `papers/PAPER-FU-24.md`, which has a new closing section.
- **Result.** 145 items (13 library, 14 planned, 118 missing). `check_paper.py` and `check_errata.py`
  both report ok. No `dependsOn` dangles, and the item graph has no cycle.
- **Independence.** I did none of the extraction, its review, the errata job or its review, the red
  team or the verification.
- **The published text.** I fetched it (NSF PAR, https://par.nsf.gov/servlets/purl/10625156). Its SHA-256
  is `a6a15856…fd80`, as recorded. It has 30 pages, journal pp. 123–152, according to pdfinfo. I read it at
  the locators of E8–E10 and of the new items.
- **Other sources checked.** I read the pinned declarations at their files and the NE, CC and ALS stage
  texts and packet nodes. Crossref records no correction to the article.

## /1 (medium, duplicate): D(G) and Frommer's theorem had two proposed owners: fixed

- **Route 2's brief** now states the agreement. NoncommutativeAnalyticDistributions supplies, once:
  - D(G,K) and its Banach steps D_r;
  - the Fréchet–Stein property and the coadmissible-module foundations;
  - Frommer's description of D_r over U_r(g).
- **The consumer.** LocallyAnalyticRepresentationsOfLocalGroups imports them. The brief names the
  consumer routes: DL17 route 3 (items 89–90), Ding 25 route 1 (3.1-distribution) and BCGP25 route 34,
  which already imports from here.
- **Both are proposals,** so the brief calls this an agreement, not an existing stage, as the verifier
  asked.
- **The brief also keeps:**
  - the normalisation ‖log g_j‖_{r_n} = p^{n−1};
  - the separate weighted-PBW supplier PadicEnvelopingAlgebras, so there is no analytic-to-algebraic
    cycle.
- **The eight items' notes** carry the single-owner line.
- **logarithm-basis-estimate** records its consistency with DL17/E11: c_h = h − 1.

**For the maintainer.** DL17's route 3 brief should state the same handshake, turning its points (1)
and (2) into imports. That file is outside this job. It matters before
DESIGN-LocallyAnalyticRepresentationsOfLocalGroups runs.

## /2 (medium, duplicate): uniform groups and Iwasawa foundations had three candidate owners: fixed

I followed the verifier's version. It found that converting the three items wholesale to "planned"
would overstate what NE.0 supplies. So I split each item into what NE.0 plans and what is still
missing.

**Planned at NE.0 (new items).**
- uniform-pro-p-group, which is NE.0/uniform-pro-p-group.
- iwasawa-integral-global-dimension: Λ(G) and O[[G]] have global dimension d + 1 and are noetherian.
  These are NE.0/iwasawa-finite-global-dimension and NE.0/iwasawa-noetherian.

**Moved to route 5, as source requests to NE.0.**
- uniform-group-coordinates: DDMS 4.9. Its analytic clause is split off.
- uniform-valuation: Lazard III 2.1.2.
- iwasawa-series. Its note cites NE.0/uniform-graded-polynomial as the planned prefix, meaning the mod-p
  series and the integral graded ring. It keeps as requests the Z_p- and O-coefficient series (DDMS 7.20),
  convolution and bounded-denominator rationalisation.

**Kept on route 2.**
- The new item uniform-analytic-structure (DDMS 8.18), with the Lazard Lie lattice and the analytic
  comparisons.

**What iwasawa-finite-global-dimension still carries.** It stays missing on route 5, for Auslander
regularity (Venjakob 3.26) and gl.dim K[[G]] = d (3.29). It now depends on the planned integral item.

**Briefs.** Route 2's brief imports the group side from NE.0 and constructs only L_G and the analytic
structure. Route 5's reason lists the requests.

**For the maintainer.**
- The NE packet's gap "Lazard's theory of p-adic analytic groups has no owner" should name NE.0 for the
  group side and NoncommutativeAnalyticDistributions for L_G and the analytic structure.
- The node NE.0/auslander-regular-grade, which FIX-RT-AREA-automorphic-1 /3 requested, is still absent
  from the packet.

## /3 (medium, duplicate): route 3's suppliers were not named: fixed

**Route 3's brief now names the suppliers:**
- the Borel–Serre compactification and strata (ALS.2);
- the support triangle and unipotent Hochschild–Serre (ALS.4);
- Poincaré–Lefschetz duality (ALS.5:finite-level-duality), placed before any automorphic comparison.

**What this Part II still proves:**
- the SL_2/F count 2^{r1} dim S_κ at Fu's weight convention, for nontrivial coefficients, with the
  trivial coefficient separate;
- the Bianchi cusp-torus computation with boundary dimensions (1,2,1);
- the bound 3c.

**The Eichler–Shimura–Harder comparison.** The verifier said not to switch owners because of an
unapplied proposal. So the brief records that FIX-RT-AREA-iwasawa-1 /34 requests this comparison only
for GL_2, that the request is unapplied and should be widened to SL_2, and that this route keeps the
comparison until a supplier contract is adopted.

**Marshall's convention** is preserved: his H_c is the interior subspace. The two items' notes name
the same suppliers. bianchi-boundary-estimate's proof steps already imported ALS.2 and ALS.4, as the
verifier observed.

**For the maintainer.** Widen FIX-RT-AREA-iwasawa-1 /34 to SL_2 over F, and add
PAPER-FU-24/cuspidal-support-dictionary as a consumer next to AutomorphicPadicLFunctions:L1.

## /4 (medium, library-claim): the noetherian-domain Ore theorem is library: fixed

**New library item noetherian-domain-ore.** It cites:
- `mathlib:IsNoetherianRing.strongRankCondition`, a named instance at `InvariantBasisNumber.lean:249`,
  which is not in declarations.tsv;
- `mathlib:nonempty_oreSet_of_strongRankCondition` (`Dimension/Localization.lean:298`);
- `OreLocalization.inv` and `OreLocalization.mul_inv_cancel` (`NonZeroDivisors.lean:48`, `:74`). The
  anonymous DivisionRing instance at `OreLocalization/Ring.lean:210` is built from these two.

**skew-rank** now depends on it. It keeps as missing what the verifier listed:
- the right-handed adapter through the opposite ring;
- two-sided flatness (no Flat declaration exists in the pinned OreLocalization directory);
- tensor compatibility;
- the rank API.

**ore-localization-carrier's** sentence now adds the library case S = R⁰.

## /5 (low, library-claim): Tau Ceti's PBW spanning and gl_n Casimir were not cited: fixed

**Cited.** The notes of free-lie-pbw and integral-sl2-pbw cite:
- `tauceti:TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration`
  (`PBW/Ordered.lean:118`);
- `tauceti:TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedMap_surjective`
  (`PBW/Homogeneous.lean:144`).

**What stays missing.** As the verifier warned, not everything reduces to linear independence:
- free-lie-pbw keeps only independence (injectivity of Sym → gr);
- integral-sl2-pbw also keeps the tensor-factor decomposition and the multidegree filtration;
- central-pbw-normal-form reduces spanning to the library theorem plus the h²-reduction, and keeps
  independence.

**integral-central-generators** cites `tauceti:TauCeti.glCasimir` and `glCasimir_mem_center`
(`GeneralLinear/Casimir.lean:81`, `:136`), with the identity Δ = Ω − ½z². It keeps missing the
U(sl_2) → U(gl_2) adapter, which the displayed identity does not supply, and algebraic independence.

**Route 1's brief** imports the four declarations.

## /6 (medium, missing): homology of completed Iwasawa modules had no item: fixed

**New construction iwasawa-group-homology,** missing, on route 5 as a source request to NE.0. It
follows the verifier's contract:
- H_i(G, M) = Tor_i^{K[[G]]}(K, M) with stated left/right conventions;
- the diagonal twist built first on compact lattices, extended to O[[G]] by continuity, proved finitely
  generated, then rationalised with bounded denominators;
- functoriality and long exact sequences;
- the comparison with continuous homology of the compact module, under stated derived-limit or
  exactness hypotheses. A naive limit is not assumed.

Mathlib's discrete `groupHomology`, `Rep.Tor` and `groupHomologyIsoTor` are named as general machinery
only.

**Consumers.** It is now in the `dependsOn` of rank-main-term, higher-homology-bound,
acyclic-regular-coefficients, homological-shifting, hom-coinvariant-dual and
completed-descent-spectral-sequence.

## /7 (low, missing): the homology-to-cohomology step had no item: fixed

**New item homology-cohomology-dimension,** planned at ALS.1, which plans finite chain models and the
universal-coefficient spectral sequence.
- It states dim H^q(Y, V) = dim H_q(Y, V^∨) over a field, and V_k^∨ ≅ V_k.
- It depends on compact-algebraic-irreducibility, for self-duality, and on cohomological-coefficients.
- sharp-global-bound now depends on it.
- The note reads Fu's "Poincaré duality" (published p. 150) as universal coefficients. Degree-reversing
  duality would involve Borel–Moore homology.
- As the verifier said, this is a planning bridge, not a source issue, so no E-record is added.

## /8 (low, error): the split, non-closed field case was not planned: fixed

**field-pbw is split.** It keeps generic PBW over a field, which Layer 3 plans in that generality, as
the verifier noted.

**New item split-field-harish-chandra,** missing, on route 1, as a target of the Part II rather than
a re-plan of the Tau Ceti roadmap. It covers:
- the triangular decomposition, the Harish-Chandra projection with Fu's ρ-convention, and central
  characters, for split g over a characteristic-0 field;
- the root and Borel choices, base change to K̄, descent, and the toral factor in the reductive case.

It does not rest on a faithful-flatness slogan. The explicit sl_2^m centre K[Δ_1, …, Δ_m] is named as
an alternative adapter.

**harish-chandra-character** keeps its planned status for the closed-field construction only. Its note
says that its use over Q_p needs the new item.

## /9 (low, error): the Tau Ceti completed group algebra was not cited: fixed

- **iwasawa-algebra** is planned at `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
  and PadicMeasuresIwasawaAlgebras:L1.
- **Its note** says:
  - Layer 9 plans the carrier completedGroupAlgebra;
  - L1 supplies the O- and adic-coefficient versions compatible with it, as the L1 packet requires;
  - neither exists as a declaration at the pins.
- **Route 2's brief** imports the carrier by name.

## /10 (low, error): the homological descent sequence was not covered by CC.6: fixed

I followed the verifier: split the item rather than only listing two stage ids.
- **completed-descent-spectral-sequence** is planned at CC.4 and CC.6, for the chain model, derived
  coinvariants and descent sequences.
- **New item homological-descent-comparison,** missing, on route 4 as a request to CC.6. It covers the
  hyper-Tor form C_•(Y(GK^p), W_0) ≃ C̃_•(K^p) ⊗^L W_0 with a stable lattice, rationalised to Fu's (38).
  It cites Emerton 2006, Calegari–Emerton 2009 and Marshall 2012 (34)–(36).
- **Route 4's reason** says so.

## /11 (medium, duplicate): E1–E7 were recorded twice, with conflicts: fixed

**The records.**
- **One active record per mistake.** The extraction's E1–E7 keep the published locators and
  REV-PAPER-FU-24's verdicts.
- **The errata file's version is preserved, not dropped.** Each extraction record now carries an
  `errataRecord` with:
  - the errata file's preprint scope, locator, kind and reach;
  - its full review object;
  - a provenance note, for finding 13.
- **The errata file** has an empty `sourceIssues`, which check_errata accepts and which the queue counts
  as a complete errata job. It has a `supersededBy` block naming the result file and the reason, and it
  keeps its seven records unchanged under `supersededRecords`. scripts/errata.py collects only
  `sourceIssues`, so the register lists each mistake once.

**The classifications.**
- **E1** stays an error, since equation (2) as an identity for full compactly supported cohomology is
  false as printed. Its reach becomes "the proof" (was "nothing"), because the proof of Corollary 1.3
  for H_c lacks the boundary bridge. The main bound stands.
- **E2** stays a misprint. The line above (16) defines the completion, so the intended meaning is clear.
- **E5** keeps "a stated result". It is an unproved step at the radii Theorem 5.1 uses, not a
  counterexample.

**For the maintainer.**
- REGISTER.md and data/source-issues.json regenerate through the usual intake.
- `research/blueprint/errata/PAPER-FU-24.md` still explains the seven findings as the errata job wrote
  them. It is not a deliverable of this job, so it is unchanged.

## /12 (low, other): no sourceVersions, a missing archive entry and a page-count clash: fixed

- **The extraction's `sourceVersions`** records what its workers actually read, with hashes:
  - `published`: the NSF PAR copy, read in full by cc-442dc5 on 2026-09-23;
  - `preprint`: arXiv v2, read 2026-09-21.
- **The errata file's `sourceVersions`** records only the preprint its worker read. The date of that
  reading is not recorded, and I did not invent one.
- **`sourceArchives`** gains the NSF PAR entry.
- **The page count.** I fetched the file and checked the hash-identified PDF with pdfinfo: 30 pages,
  journal pp. 123–152. archiveStatus's "31 pages" is corrected to 30, which agrees with
  publishedRead.pages. The count is from the file itself, not a guess about a cover page.
- **The checks.** check_errata now passes on the errata file, which it failed before.

## /13 (low, other): the errata review's independence statement is false: fixed where this job can

`reviews/REV-ERRATA-PAPER-FU-24.md` is not a deliverable of this job. The intake refuses files outside
the deliverables, so its line 3 is unchanged.

As the verifier asked, the correction is recorded in proper fields. `review.by` identifiers are left
as they are. The fields are:
- `reviewProvenance` on each superseded record in the errata file;
- `errataRecord.reviewProvenance` on each extraction record.

They say that cc-442dc5 did not do ERRATA-PAPER-FU-24 (cc-fb70e5) but had completed the extraction,
including its own E1–E7. The independent verdicts are REV-PAPER-FU-24's (cc-d67081). The errata
review's verdicts are kept.

**For the maintainer.** Correct line 3 of `REV-ERRATA-PAPER-FU-24.md` to: "this reviewer did not do
ERRATA-PAPER-FU-24, but completed the extraction PAPER-FU-24 (cc-442dc5, #2102), including its own
E1–E7".

## /14 (medium, duplicate): Banach–Iwasawa duality has a second proposed owner: fixed

**The item stays missing.** The verifier asked to leave it until a supplier contract exists, because
the proposed sub-stage PadicMeasuresIwasawaAlgebras:L1:banach-representations (FIX-RT-AREA-automorphic-1
/17) has no content or atlas stage.
- Its note records the recommended single owner, the early PMIA sub-stage for CC.2, CC.5, R30.2 and
  Fu, and what changes if it is adopted.
- It keeps Banach/Schikhof duality distinct from the locally analytic strong duality of finding 1, and
  it keeps the compact-group hypotheses.
- Route 2's brief says to import it from there if the sub-stage is adopted.

**For the maintainer.** Add "consumed also by PAPER-FU-24/banach-iwasawa-duality
(NoncommutativeAnalyticDistributions)" to /17's stage text when it is applied.

## /15 (low, missing): Theorem 4.2's noetherianity at all real radii: fixed (E8)

- **E8 is new:** kind gap, Theorem 4.2, published p. 138, and arXiv v2 p. 14. I checked the published
  wording today, and it is unchanged.
- **The verifier's correction** is applied. The domain property holds at every interior real radius
  (multiplicative norm, ST03 4.5(i)) and at r = 1/p (Remark 4.6). Only noetherianity outside p^Q is
  unproved.
- **Reach: "a stated result",** where the red team proposed "nothing". Theorem 4.2 as printed claims
  noetherianity at all real radii, and that is not established. This matches how E5 classifies an
  unproved step inside a stated theorem.
- The reason records that nothing downstream uses more than the rational radii, and that no
  counterexample is known.

## /16 (low, missing): the strips in the proof of Theorem 3.2: fixed (E9)

- **E9 is new:** kind gap, proof of Theorem 3.2, published pp. 135–136 and arXiv v2 pp. 10–11. I
  checked in print that the proof treats only k ≥ α.
- **The correction** is the verifier's strip bound, dominated by 2 Σ_i α_i ∏_{j≠i}(k_j + 1). The strips
  are not a finite exceptional set.
- **Reach: "the proof".** The verifier asked for an explicit reach rather than "nothing": the theorem is
  unaffected and the proof is incomplete.
- It cites small-coordinate-strips and explicit-multiaffine-majorant.

## /17 (low, missing): the passage to arbitrary level in §7: fixed (E10)

- **E10 is new:** kind gap, §7 p. 150 with Theorem 1.2 p. 125 (published), and arXiv v2 pp. 2 and 23–24.
  I checked in print that §7 applies (38) only at K_f = GK^p.
- **The correction** is the verifier's version:
  - choose an odd completely split prime outside the bad set;
  - put K′_f = G·K^p ⊂ K_f;
  - use the pullback injection, with a level-dependent constant;
  - handle neatness or finite stabilizers if topology is used.
- **Reach: "the proof".** It cites split-auxiliary-prime.
- It makes no claim about what first appeared only in print. The published Corollary 1.3's "Suppose K_f
  is sufficiently small" is already recorded in publishedRead.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FU-24.result.json`: ok.
- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-FU-24.json`: ok. Before this fix it
  failed with one sourceVersions error.
- `research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Both JSON files keep their own formatting (indent 2).
- No Lean was compiled.
