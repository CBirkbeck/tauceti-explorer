# RT-RS-01: fixes

Fixer: Claude, session `claude-jBSCUj`, 7 October 2026. Job FIX-RT-RS-01, issue #5705; the bot confirmed the claim
(comment 6033415041). Base: `origin/main` at `8cb560da`.

- **Findings.** `RT-RS-01.result.json` has 32 findings (4 high, 17 medium, 11 low). `RT-RS-01.review.json` confirms 29
  and rejects 3 (/25, /26, /29). This job applies every confirmed finding. Where the verifier corrected a finding's
  fix, the corrected form is applied. Where a finding left a choice open, or its fix would close a cycle with work
  done since, the choice and its reason are stated below.
- **Files changed (all are deliverables):**
  - `restructure/RS-01.result.json`;
  - `restructure/RS-01.md`, corrected in place, with a new last section, "Fixes from the red team";
  - `reviews/REV-RS-01.md`, with marked corrections of three false claims;
  - `packets/PadicHodgeTheory--P7.json`, node and record edits for /11, /12, /13 and /30;
  - this report.
- **Result.** RS-01 now has:
  - **21 layer records.** CP.0 and CP.5 are still the only narrowed layers. 13 explicit `keep` records are new, and
    6 are rewritten.
  - **31 links.** 3 retained, 16 from the first revision and 12 new. Three link reasons are rewritten.
  - **21 owner records.** The first revision's five are corrected, and 16 are new.
  - **A review object.** The accepted review moves verbatim to `reviewHistory`, and `review` is `pending` for
    REV-FIX-RT-RS-01. A `fix` record names this job.
- **Independence.** I wrote none of the following:
  - RS-01 (ChatGPT Pro, `astra-20260921-f6b2d8`, PR #928);
  - REV-RS-01 (Claude Code `cc-442dc5`, PR #2288);
  - the red team (Claude Code `cc-c2c06b`, PR #5655);
  - its verification (Codex `codex-J6LwjP`, PRs #5660 and #5663);
  - the PadicHodgeTheory P7 blueprint (Claude Code `cc-442dc5`, PR #2917);
  - any of the member blueprints or the related fixes cited below.

## Sources read for this fix

All were read on 7 October 2026. Each file was fetched into the job's scratch directory, never into the repository.

| Source | URL | SHA-256 | Read |
|---|---|---|---|
| Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory*, arXiv v3 | https://arxiv.org/pdf/1602.03148v3 | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` | §4.2 (Lemmas 4.6–4.21 with proofs), §4.4 (the map S → A_inf), Theorem 5.7, Theorem 13.19, Remark 13.20, Propositions 13.21 and 13.23, Theorems 14.3, 14.5 and 14.6 with proofs, the Introduction's S → W(k) |
| Scholze, *p-adic Hodge theory for rigid-analytic varieties*, author's web version | https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf | `73dded06286031066e9d98b638e065d650688f1e36e877f4d711331a3508dee3` | numbering of Definition 4.1 to Corollary 6.6 and Theorem 8.4 |
| Bhatt–Lurie, *Absolute prismatic cohomology*, arXiv v1 | https://arxiv.org/pdf/2201.06120v1 | `0b1beeb20c29424ed8e330c14a66b36c0edcc84255edf5caa0ff9e235139a269` | §2 (Construction 2.7.4, the prismatic logarithm), table of contents of §§7–8 |
| Bhatt–Scholze, *Prisms and prismatic cohomology*, arXiv v4 | https://arxiv.org/pdf/1905.08229v4 | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` | Construction 7.6 to Proposition 7.10, Notation 18.1, Theorem 18.2 |

**Pinned Mathlib `082e2d3` checks** (in the shared baseline tree):
- `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` has 213 lines: `fontaineTheta` is at line 165, and
  `surjective_fontaineTheta` at line 195.
- `Mathlib/RingTheory/Perfectoid/BDeRham.lean` has 98 lines. Its TODO, at lines 26–30, includes "Show that ker θ is
  principal".
- `Mathlib/RingTheory/Extension/Cotangent/Basic.lean`: `cotangentComplex` is at line 61.

## Summary

| Finding | Severity | What changed |
|---|---|---|
| /1 | high | owners[4] split: AI.2 owns the module structure theory (Lemmas 4.6–4.13), AI.5 the complex-level lemmas (4.14–4.21). CP.5 is supplied by AI.5 and AI.2. Links AI.2 → CP.5, CP.6. |
| /2 | high | The good-reduction identification of BMS1 §13.4 moves from CP.3 to CP.2 (owner record). The CP.3 → CP.2 reason is rewritten. |
| /3 | high | Proposition 13.21 moves from CP.2 to CR.3:Frobenius-isogeny (owner record, layer record). Links → AI.5, CP.2, CP.5. |
| /4 | high | AI.3 owns the integral pro-étale package for all locally noetherian adic spaces (owner record, layer record). P8:local-rational keeps the rational sheaves. |
| /5 | medium | AI.0 owns Witt-vector coherence (owner record); added to CP.0's `suppliedBy`. |
| /6 | medium | AI.0 owns the §4.2 specialization objects (owner record). The dictionary keeps only the identifications. |
| /7 | medium | CP.0's `keeps` retains the construction of the Breuil–Kisin uniformizer normalization, with the corrected Frobenius normalization. |
| /8 | medium | Node-level forwarding: CP.0's reason and the report re-point the five CP.5 nodes' CP.0 prerequisites. The review is corrected. |
| /9 | medium | The AI.5 owner record lists each lemma with its hypotheses, including Lemma 4.18. CP.5 keeps the geometric Remarks 14.4/14.7. |
| /10 | medium | The R06.4 interface is withdrawn from CP.5's `keeps`. R07.3 → CP.5 is added for the retained Fontaine–Laffaille comparison. |
| /11 | medium | AI.0:integral owns ε, ξ and the O_C kernel criterion (`formerly` adds R06.1). AI.0:period-comparison is made explicit and disjoint. P7 nodes are edited. |
| /12 | medium | CP.3 owns the constant-coefficient de Rham comparison (owner record). P7's redirect is corrected. |
| /13 | medium | P8:local-rational's early cut owns the primitive comparison (owner record). Link P8:local-rational → AI.5. P7's gap, request and coverage are updated. |
| /14 | medium | Option (a): link CP.3 → AI.6, and AI.6 owns the comparison with CP.3's deformation. |
| /15 | medium | CR.6 owns N φ = p φ N and the change of uniformizer; CP.4 transports them. |
| /16 | medium | Link PR.8 → CP.4. CP.4 owns the agreement of the two semistable routes. |
| /17 | medium | CR.0 builds the envelope and the Witt reduction on the library carriers. AI.0:integral normalizes and applies them. |
| /18 | medium | Alternative fix: DD.4 owns the lci PD comparison (RT-AREA-padic-2/36). DD.0 → CR.0 is not added. |
| /19 | medium | Ledger row PR.4 corrected. PR.4 owns the prismatic logarithm and the first Chern classes. Link PR.4 → CP.6. |
| /20 | medium | PerfectoidSpaces P1 owns BMS1 Lemmas 3.20–3.21; Q0:integral-algebra imports them. |
| /21 | medium | REV-RS-01.md corrected, and the result's new review notes record the correction. |
| /22 | low | Link R06.1 → CP.4. |
| /23 | low | CP.0's twist clause restricted to cohomology and complexes. |
| /24 | low | Reachability statements corrected in RS-01.md and REV-RS-01.md. Direct link CP.3 → CP.5. |
| /25 | low, rejected | No change needed; the AI.5 record lists the hypotheses anyway (/9). |
| /26 | low, rejected | No change. |
| /27 | low | CP.5's `keeps` names the Česnavičius–Koshikawa semistable branch. |
| /28 | low | CP.1 owns the A_inf/prismatic agreement over O_C (owner record). AI.7 keeps its S-valued agreement. |
| /29 | low, rejected | No change of ownership; CP.2's reason now uses its own stage text. |
| /30 | low | Not applied in RS-01: R07-family decision. The ordering constraint is recorded in P7's restructure entry. |
| /31 | low | PR.2 owns BS22 Construction 7.6 and Lemma 7.7 to Proposition 7.10 (owner record). |
| /32 | low | Mathlib line ranges corrected to 118–213 and 1–98. |

## High findings

### /1: the §4.2 lemmas cannot all be AI.5's

**Applied with the verifier's correction.** The verifier asked for the module package through Proposition 4.13 to go to
AI.2 and the complex package to AI.5, with both owners forwarded to CP.5 and CP.6, and without the duplicate AI.2 record
in the finding's fix.

- **owners[4] is replaced by two records.**
  - **AI.2** owns:
    - Lemma 4.6 (Kedlaya) with Lemmas 4.7–4.8;
    - Lemma 4.9, with its three parts and the x-torsion condition;
    - Lemma 4.10 with Remark 4.11;
    - Corollary 4.12;
    - Proposition 4.13 with both freeness criteria.
  - **AI.5** owns Lemma 4.14 to Corollary 4.20 with Remark 4.21. Each lemma's hypotheses are written into the record
    (see /9).
- **The reason.** I checked in BMS1 v3 that Lemma 4.26's proof says "one can formally reduce to the case where M is
  finite free, using Proposition 4.13" (p. 42), and that Proposition 4.13(i) "is immediate from Lemma 4.9" (p. 37). AI.5 requires AI.2,
  so an AI.5 owner would be a node-level cycle.
- **CP.5.** `suppliedBy` is `[AI.5, AI.2]`. Its `keeps`, its reason and the AI.5 record are rewritten as the finding
  specifies.
- **Links.** AI.2 → CP.5 and AI.2 → CP.6 are added, for §15 forwarding. Both are acyclic; AI.2 already reached both.
- **RS-01.md.** Line 62 now says "AI.5/AI.2 supplier material … with Proposition 4.13 at AI.2", and the summary is
  changed to match.
- **Consistency.** These owners are the ones the accepted FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 chose (§4.2 at AI.2,
  with aliases to the AI.2 nodes). They are also those of the AInfCohomology blueprint:
  - AI.2/ainf-module-perfectness, ainf-bounded-torsion, ainf-tor-bounds and ainf-module-structure;
  - AI.5/finite-level-length-bound through cohomology-finiteness-from-periods.

### /2: CP.3 → CP.2 met a CP.3 node that used CP.2

**Applied with the finding's main fix.**

- **The new owner record.** CP.2 owns the good-reduction B_dR^+-lattice identification of BMS1 §13.4, formerly CP.3. It
  covers:
  - Proposition 13.23;
  - its degreewise form, which uses Proposition 13.21's rational freeness;
  - the agreement of Theorem 14.5(i)'s B_crys comparison with Theorem 13.1;
  - the compatibility with Fargues' pair attached to H^i_Ainf.
- **What CP.3 keeps.** Theorem 13.1, Theorem 13.19 and Remark 13.20, stated in a new CP.3 `keep` record.
- **Link reason.** links[18] (CP.3 → CP.2) carries the finding's replacement reason.
- **RS-01.md.** The CP.3 → CP.2 section is corrected: the sentence "CP.3 has no CP.2 prerequisite in the inspected
  contracts" was true only of recorded prerequisites.
- **The source.** I read Proposition 13.23 and its proof (p. 117) and Theorem 14.5(i) with its proof (pp. 120–121). The
  compatibility is "checked on the level of the explicit complexes" between Theorems 12.1 and 13.1, so it needs CP.2's
  B_crys comparison.
- **The verifier's alternative** (splitting CP.2) is not needed: the move makes CP.3's inputs acyclic at node level.

### /3: Proposition 13.21 cannot stay in CP.2

**Applied.** Following the verifier, I chose the owner independently. The candidates were CR.3:Frobenius-isogeny, CR.3
and AI.4. I chose **CR.3:Frobenius-isogeny**, because:

- **The proof's inputs.** The proof (p. 116) reduces the Frobenius isomorphism after inverting p to smooth affine
  k-schemes, and then uses crystalline base change. That is the Frobenius-isogeny substage's subject, and CR.3 is
  upstream of it.
- **Agreement elsewhere.** The accepted PAPER-BHATT-MORROW-SCHOLZE-18 fix and the FIX-RT-AREA-padic-2~3 hand-off made
  the same choice. The AInfCohomology blueprint's AI.5/rational-crystalline-frobenius and the CohomologyComparisons
  blueprint's CP.2/residue-section-descent-adapter both cite CR.3:Frobenius-isogeny.
- **Against AI.4.** AI.4 would place a crystalline base-change theorem in the A_inf roadmap.

**The records.**
- **Owner record.** It states the section-dependent isomorphism, its inputs, and its application with the canonical
  section in the proof of Theorem 14.6(i). The fixed-section versus canonical-section distinction is kept. The CP.2
  node becomes an alias.
- **The CR.3:Frobenius-isogeny `keep` record** says that the stage's scope must include smooth affine, non-proper
  schemes. This is not inferred from the title.

**Links.**
- CR.3:Frobenius-isogeny → AI.5, for the BKF property in Theorem 14.3: "using also Proposition 13.21", p. 120.
- → CP.2, for its own use.
- → CP.5, because the reviewed decomposition's link records that CP.5/lattice-recovery-over-C uses the proposition for
  Corollary 4.20.

All three are acyclic. The CP.2 reason now says CP.2 imports the proposition.

### /4: the integral pro-étale package had no owner in the needed generality

**Applied, with one change of form.**

- **Owner record.** AI.3 owns O_X^+, Ô_X^+, Ô^+_{X♭}, A_inf,X and θ for every locally noetherian adic space over
  Spa(Q_p, Z_p). It cites Scholze 2013 (web version) Definition 4.1, Lemma 4.2, Definition 4.3 to Proposition 4.8,
  Lemma 4.10, Definition 5.9 and Lemma 5.10, and Theorem 6.5. `formerly` is P8:local-rational.
- **Layer records.** AI.3 gets a `keep` record stating the broadened scope.
- **The change of form.** The finding asked for P8:local-rational to be **narrowed**. I give it a `keep` record instead,
  saying that it keeps the rational constructions and imports the integral package.
  - Under /13 the same stage also becomes the owner of the primitive comparison, a target its text does not name.
  - A narrowed layer's `keeps` must state exactly what remains, so it may not add a target (the error of /10).
  - The verifier's requirements ("one early owner, broaden AI.3 explicitly, retain rational constructions in
    P8:local-rational") are met.
- **Already consistent.** The AInfCohomology blueprint's AI.3/completed-integral-sheaf is already stated for "a locally
  noetherian analytic adic X over Spa(Q_p,Z_p)". The P7 packet's request to AI.3 asks for this generality.
- **P7 packet.** Restructure entry 3 and coverage[P8:local-rational] now record the owner.

## Medium findings

### /5, /6, /8: the CP.0 targets without an owner, and node-level forwarding

**Two owner records, both for AI.0:**
- **Coherence (/5).** BMS1 Proposition 3.24, Lemmas 3.25–3.28 and Corollary 3.29, with the CP.0 node as an alias.
  This is the routing of the accepted FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18; the AInfCohomology blueprint has the nodes
  AI.0/witt-coherence and the coherence lemmas.
- **The §4.2 specialization objects (/6).** These are:
  - x;
  - W̃ = colim A_inf/(x^{1/p^n}), with completion W(k) and kernel Q an A_inf[1/p]-module (proofs of Lemmas 4.9(iii)
    and 4.16, pp. 36 and 38);
  - A_inf,(p) a discrete valuation ring with A_inf → W(K♭) flat (proof of Lemma 4.10, p. 36, and the remark after
    Corollary 4.17, p. 39);
  - μ a unit in W(K♭), with the characteristic-0 and roots-of-unity scope the verifier required.

**Why AI.0.** The finding /8 offered AI.2 for the §4.2 objects, and its verifier asked for consistency with /1 and /6.
AI.0 is upstream of AI.2, AI.5 and CP.0, and it holds the coherence lemmas, so every consumer imports from one place.

**CP.0.**
- `suppliedBy` adds AI.0.
- The `keeps` says the coherence node and items (a), (b) and the μ-unit clause of (e) of the dictionary become aliases
  of AI.0 nodes.
- The reason adds the node-level forwarding sentence of /8. The five CP.5 nodes that required CP.0 nodes move to AI.2
  and AI.5 with re-pointed prerequisites:
  - coherence and the §4.2 objects come from AI.0;
  - θ, ξ, μ and the Witt-reduction normalization from AI.0:integral;
  - B_crys^+ from R06.1.

  No new link is needed, since AI.0 reaches AI.2, AI.5 and CP.0.

**Reports.** RS-01.md's consumer paragraph and its decomposition-conservation bullets are rewritten. REV-RS-01.md's
"forward every consumer to every supplier" is corrected to "at stage level".

### /7: the Breuil–Kisin uniformizer normalization

**Applied with the verifier's correction.** CP.0's `keeps` says that CP.0 continues to construct:
- π, π♭ and E(T);
- the map S = W(k)[[T]] → A_inf that sends T to [π♭]^p and is the Frobenius on W(k) (BMS1 §4.4, p. 43);
- the map S → W(k) that sends T to 0 and is the Frobenius on W(k) (Introduction, p. 4).

Both normalizations were checked in the source.

**The comparison with R07.4.** CP.5 imports R07.4, and the comparison with R07.4's Kisin normalization happens there.
CP.5's `keeps` says so.

**Why not PR.0.** The alternative import from PR.0 is not used: PR.0 has the Breuil–Kisin prism only as an
acceptance example.

### /9: Lemma 4.18 and the hypotheses of the AI.5 lemmas

**Applied.** The AI.5 owner record is the finding's text, which /25 also asks for. It names:
- Lemmas 4.14 and 4.15 for any perfectoid K;
- Lemma 4.16 without perfectness, and with x-torsion-freeness of H^{i+1};
- Corollary 4.17 with the two-degree condition;
- Lemmas 4.18–4.20 and Remark 4.21 in characteristic 0 with all p-power roots of unity.

I checked each against pp. 37–40. The generic half of CP.5/crystalline-de-rham-torsionfreeness-equivalence becomes an
alias of the AI.5 node.

**What CP.5 keeps.** The geometric form (Remarks 14.4 and 14.7) and the length-monotonicity observation from the proof
of Theorem 14.5(ii).

### /10: the invented R06.4 interface

**Applied: the preferred fix.**
- " and the R06.4 interface" is removed from CP.5's `keeps`.
- RS-01.md's "comparisons with R07/R06.4" now says the clause was an overstatement and is withdrawn.

**The R07.3 link.** CP.5's own text compares its lattices with "R07's classified integral objects" in both the
Fontaine–Laffaille and the Breuil–Kisin regimes. R07.3, which constructs the Fontaine–Laffaille objects, did not reach
CP.5. So R07.3 → CP.5 is added (acyclic) for this retained target, as the finding's second option also listed.

### /11: R06.1 re-planned the O_C special elements

**Applied, in RS-01 and in the P7 packet.**

**In RS-01:**
- **owners[0] (AI.0:integral):**
  - `formerly` is now `[CP.0, R06.1]`;
  - the target lists ε and its change, μ, ξ = μ/φ^{−1}(μ), ξ̃ and θ̃, the O_C instance of P1's primitive-kernel
    criterion with the nonzerodivisor property, and the theorem that ξ generates ker θ.
- **R06.1's record** says it imports these and proves only what concerns its classical element p♭ and generator
  [p♭] − p, the Galois action and the rational ring theorems. This combines the finding's two variants consistently.
- **owners[3] (AI.0:period-comparison)** is restated as an explicit list, disjoint from R06.1's nodes:
  - the Breuil–Kisin twist and Z_p(1) against Z_p t;
  - the θ̃-specializations;
  - the Frobenius-twisted scalar extension.
- **owners[2] (R06.1)** names what R06.1 keeps:
  - the structure maps and injectivity of A_crys → B_dR^+;
  - t with t/ξ a unit;
  - I^[r]A_inf = μ^r A_inf;
  - the arithmetic-model comparison.

**In the P7 packet**, the finding's three hand-offs, and the PD clause of t-in-acris:
- **R06.1/tilt-of-cp-and-special-elements.**
  - Its statement takes ε from AI.0:integral and keeps p♭ and the Galois formulas.
  - Prerequisite AI.0:integral added.
  - The `uses` entry naming AI.0:integral is removed, since AI.0:integral is upstream.
- **R06.1/explicit-generator-of-ker-theta.**
  - The criterion and nonzerodivisibility are imported. The proof step now computes that the first Witt coordinate of
    [p♭] − p is −1.
  - The node states that [p♭] − p and AI.0's ξ_ε differ by a unit.
  - Prerequisite added.
- **R06.1/frobenius-kernel-ideals-of-ainf.** The "Moreover τ … generates ker θ" clause is restated as an import from
  AI.0:integral. Prerequisite added.
- **R06.1/t-in-acris.** The PD structure on ker θ_cris is stated as CR.0's.
- **New request** to AInfCohomology:AI.0:integral for exactly these items, with its three consumers.

API names and unit tests are unchanged, so the P7 suggested Lean file still agrees with the packet.

### /12: the constant-coefficient de Rham comparison

**Applied.**
- **Owner record.** CP.3 owns, formerly P8:
  - the filtered G_K-equivariant comparison;
  - the Hodge–de Rham degeneration;
  - the Hodge–Tate decomposition;
  - the agreement of the B_dR^+-deformation construction with the period-sheaf construction.
- **Layer records.** A CP.3 `keep` record and a P8 `keep` record say that P8 owns only the extension to de Rham lisse
  sheaves and families.

**P7 packet:**
- Restructure entry 9 no longer redirects "Scholze's de Rham comparison" to P8/R06.5. It names CP.3 and records why a
  P8 owner is cyclic: CP.2 → CP.4 → P8.
- P8/proper-smooth-de-rham-comparison-application states that its identification (a) is CP.3's imported agreement
  theorem.
- The request (a) to CP.3 already asked for exactly this, and stays.

### /13: Scholze's primitive comparison theorem had no owner

**The owner.** The finding left the owner open ("AI.3 or a new early CP sub-stage"); its verifier said "an early owner
such as AI.3 or a new primitive-comparison prefix … do not use late P8". I chose **P8:local-rational's early cut**, for
these reasons.
- **Its inputs.** All are already ancestors of P8:local-rational on the assembled atlas:
  - AI.3;
  - AdicEtaleGeometry A1–A2;
  - ClassicalAdicEtaleCohomology H0;
  - PerfectoidSpaces P0, P3 and P7.

  For AI.3, three of them (A2, H0 and PerfectoidSpaces P7) are not ancestors, and A2 supplies the toric charts.
- **Agreement elsewhere.**
  - The accepted PAPER-BHATT-MORROW-SCHOLZE-18 fix routes the theorem there (route 14).
  - The AInfCohomology blueprint's AI.5/global-etale requests "an early primitive-comparison extension of
    P8:local-rational".
  - FIX-RT-AREA-padic-1 proposes a substage P8:primitive placed *after* P8:local-rational. The owner record says that
    substage takes the record unchanged once it exists.
- **Not a late P8 stage.** P8:local-rational is the early cut.

**The record.** It lists the theorem with its inputs, in the numbering of Scholze's web version:
- Theorem 4.9;
- Lemma 4.12;
- Lemmas 5.3–5.8;
- Theorem 5.1;
- Corollary 5.11;
- Theorem 1.1;
- the almost A_inf and B_dR^+ forms from the first steps of Theorem 8.4's proof.

Its `formerly` is P8, where accepted routes and the P7 packet had put it. The P8:local-rational `keep` record says
that this is a target its text did not name, which is why the layer is not narrowed (see /4).

**The link P8:local-rational → AI.5.** I did not use the link P8:local-rational → AI.4 suggested in the BMS-18
maintainer notes.
- **The use is global.** BMS1 Theorem 5.7 is a statement for proper X, and its use is Theorem 14.3(iv), which is AI.5's
  global μ-inverted comparison. The AInfCohomology blueprint plans it there.
- **The cost of AI.4.** The AI.4 link made P8:local-rational, and through it R06.1, an ancestor of AI.4's local branch,
  of PR.6 and of AI.7. I checked this on the assembled graph.

P8:local-rational → CP.3 already exists.

**P7 packet:**
- **Gap.** "No atlas owner for Scholze's primitive comparison theorem" becomes "owner assigned, nodes not yet written",
  with the next action.
- **Request to CP.3.** Part (b) is withdrawn. The request keeps part (a) and its one consumer.
- **The two P8 nodes that used the theorem** (etale-to-bdr-plus-comparison-for-lisse-sheaves and
  relative-bdr-plus-local-system-comparison) cite the stage P8:local-rational instead of CP.3.
- **Coverage.** P8:local-rational's `remaining` gains the list. P8's `remaining` is updated.
- **Restructure entry 4** (CP.3:primitive) records that it is superseded.
- **Not done here.** P8/affinoid-k-pi-one-for-p-torsion (Theorem 4.9) sits at P8, but the early cut needs it. Moving it
  changes a node id that the reader and other records use, so it is handed to the packet's continuation (below).

### /14: AI.6 and CP.4 against CP.3's deformation

**Applied: option (a), which the verifier accepted.** Option (b) would be cyclic.
- **Link.** CP.3 → AI.6 is added. It is acyclic; AI.6 → CP.4 already exists.
- **Owner record.** AI.6 owns the comparison of semistable A_inf cohomology, and of its log-crystalline specialization,
  base-changed to B_dR^+, with CP.3's canonical deformation. `formerly` is CP.4.
- **CP.4** imports it, as its new `keep` record says.

### /15: N φ = p φ N and the change of uniformizer

**Applied.**
- **Owner record.** CR.6 owns the relation and the change-of-uniformizer computation. `formerly` is CP.4.
- **Layer records.** CR.6 and CP.4 get `keep` records. CP.4 transports the relation and the computation through
  B_st → B_dR and proves the independence of the descended comparison.
- **Ledger.** The CP.4 and CR.6 rows are rewritten.
- **The CohomologyComparisons blueprint already does this.** CP.4/uniformizer-change-and-monodromy translates "CR.6's
  formula" rather than proving it.

### /16: the log-prismatic agreement

**Applied.**
- **Link.** PR.8 → CP.4 is added. It is acyclic, also with every member draft packet's node edges.
- **Owner record.** CP.4 owns the agreement on the standard semistable chart, in PR.8's Cartier-type, perfect-log-prism
  and Kummer-étale scope. `formerly` is PR.8.
- **PR.8's `keep` record** says it keeps its realizations only.
- **The CohomologyComparisons blueprint already does this.** CP.4/log-prismatic-agreement imports five PR.8 nodes.
- **What the link adds.** HodgeTateAndCanonicalSubgroups T6:log-sites, through PR.8, becomes an ancestor of CP.4, CP.6,
  P8, R06.5 and R06.6. This is acyclic, and it is what CP.4's own text ("Compare … with PR.8's log-prismatic maps")
  requires.

### /17: CR.0 and the Witt reduction

**Applied: the verifier's first route** (library carriers).
- **owners[1] (CR.0)** owns the envelope on PreTilt, WittVector and WittVector.fontaineTheta, with:
  - θ_cris;
  - the Witt reduction A_inf → W(k), built with WittVector.map;
  - the induced A_crys → W(k).
- **owners[0] (AI.0:integral)** owns only the normalization of that map (μ ↦ 0, ξ, ξ̃ ↦ p) and the O_C instance of
  the regular-principal envelope.
- **CR.0's reason** gives the order: no CR.0 node may require AI.0*. The explicit envelope is a conditional theorem for
  a generator; AI.0:integral applies it with its ξ.
- **Already consistent.**
  - The CrystallineCohomology blueprint's CR.0/fontaine-envelope already builds A_cris(R) for any p-adically complete R
    from these Mathlib declarations. Its part (d) constructs the map to W(k).
  - AI.0:integral/residue-map and integral-crystalline-ring-interface import it.

### /18: CR.0's derived PD comparison

**Not applied as written. A checked alternative is applied instead.**

**The conflict.** The finding asks for DD.0 → CR.0, so that CR.0 can prove the comparison with the derived PD
construction in the lci range. But the confirmed RT-AREA-padic-2/36 had already decided that this comparison belongs
to DerivedDeRhamCohomology DD.4 (Bhatt, Lemma 3.39, Corollary 3.40, Theorem 3.27), with CR.0 keeping the classical
Lemmas 3.37–3.38. The FIX-RT-AREA-padic-2 rounds handed that decision to both blueprints, and both follow it:
- the CR.0 coverage says the sentence "is realised by DerivedDeRhamCohomology:DD.4/regular-pd-comparison (Bhatt,
  Corollary 3.40), as the red-team finding RT-AREA-padic-2/36 decided";
- DD.4/regular-pd-comparison owns it.

**The cycle.** The draft DerivedDeRhamCohomology packet's DD.0/derived-divided-powers lists CR.0 as a prerequisite. I
checked this with the union of the atlas, all proposals and that packet's node edges. Adding DD.0 → CR.0 closes a
cycle there; without it, the union is acyclic.

**What is recorded.**
- **Owner record.** DD.4 owns the comparison, formerly CR.0.
- **CR.0's reason** says that CR.0 therefore needs no DD.0 input and that DD.0 → CR.0 is not added.
- **The RS-01.md pair row and the negative controls** record the same.

The finding's concern, that CR.0 must not silently build derived divided powers, is met, because CR.0 no longer has
the target.

### /19: the prismatic logarithm and the first Chern classes

**Applied.**
- **Ledger.** The PR.4 row was "Etale comparison, p-adic Tate twists and logarithm/Chern constructions". It now reads
  "Etale comparison and p-adic Tate twists, …", plus the owner record.
- **Owner record.** PR.4 owns, formerly CP.6:
  - the prismatic logarithm log_Δ: T_p(A^×) → A{1} (Bhatt–Lurie, *Absolute prismatic cohomology*, §2,
    Construction 2.7.4);
  - the prismatic, crystalline, syntomic and étale first Chern classes (ibid. §7 and §8.2; checked in the arXiv v1
    contents).
- **Why PR.4.** PR.4's text cites "Bhatt–Lurie §§7–8" and names Chern consumers. The CohomologyComparisons blueprint
  requests these from PR.4.
- **Link.** PR.4 → CP.6 is added. It is acyclic.
- **PR.4's `keep` record** says this is a target its sources cover but its text named only through its consumers.

### /20: BMS1 Lemmas 3.20–3.21

**Applied.**
- **Owner record.** PerfectoidSpaces P1 owns the lemmas, formerly Q0:integral-algebra. It keeps the boundedness
  hypothesis of the converse and the nonzerodivisor of Lemma 3.21.
- **Why P1.** P1 is upstream of Q0:integral-algebra. The PerfectoidSpaces blueprint plans the lemmas as
  P1/integral-perfectoid-comparison and P1/perfectoid-tate-ring-from-integral-perfectoid. The accepted
  PerfectoidQuotients blueprint has no node for them.
- **Ledger and pair row.** The Q0:integral-algebra rows and a new `keep` record say it imports them.

### /21: the review's "only two duplicates"

**Applied.**
- **REV-RS-01.md.** It gets a correction notice at the top, and marked corrections where it was wrong:
  - "The real duplicates" now lists the other stages that re-planned supplier targets, as the finding gives them;
  - the CP.5 bullet notes the AI.2/AI.5 split;
  - the forwarding and reachability claims are corrected (/8, /24);
  - the closing question is qualified.
- **What the corrections do not say.** As the verifier asked, they do not claim that the previous reviewer read no
  relocation gap.
- **The review object.** The accepted review stays verbatim in `reviewHistory`. The new pending review's notes record
  the corrections.
- **`review.corrections`.** The finding asked to set it. That field belongs to the review that REV-FIX-RT-RS-01 will
  write, so this report and the `fix` record list the changes instead.

## Low findings

- **/22.** Link R06.1 → CP.4 is added, for B_st and B_st → B_dR (log p = 0). It is acyclic.
- **/23.** CP.0's `keeps` restricts its twist and scalar-extension comparisons to "the compared cohomology and
  complexes". It imports t versus μ, A_inf{1} versus Z_p(1) and the Frobenius-twisted scalar extension from
  AI.0:integral and AI.0:period-comparison.
- **/24.** RS-01.md's summary and graph-delta paragraph now distinguish the new direct dependency from the four new
  reachable pairs (CP.3 → CP.2, CP.3 → CP.5, P8:local-rational → CP.2, P8:local-rational → CP.5). REV-RS-01.md is
  corrected the same way. The optional direct link CP.3 → CP.5 is added, for CP.5's use of Theorem 13.1's lattice. The
  report also states the reachability that this fix's own links add (Checks).
- **/25 (rejected).** Nothing was needed. The AI.5 owner record now carries each lemma's hypotheses anyway (/9).
- **/26 (rejected).** No change. AI.5's text keeps its §2 regression examples. The accepted
  PAPER-BHATT-MORROW-SCHOLZE-18 fix routes their construction to CP.5, which RS-01 does not contradict.
- **/27.** CP.5's `keeps` names the Česnavičius–Koshikawa §§7–8 branch with its assumptions, factors and functorial
  lattice theorem.
- **/28.** The finding's alternative is applied with the verifier's correction.
  - **Owner record.** CP.1 owns the agreement of the A_inf maps over O_C with the prismatic ones through BS22 Theorem
    18.2 ("End(Δ_{−/A}) = {1}", v4). `formerly` is AI.7.
  - **PR.6** keeps the generic theorem.
  - **The AI.7 and CP.1 ledger and pair rows** say that AI.7 proves only the agreement of its own S-valued
    specializations.
- **/29 (rejected).** No ownership change. CP.2's rewritten reason uses CP.2's own wording ("the period invariants
  needed to identify D_cris"; R06.2 owns the admissibility theorems). This is the harmless clarification the verifier
  allowed.
- **/30.** Not applied in RS-01. Both owners lie in the R07/R06 interface outside RS-01's family, and the verifier
  showed that the finding's reversal is cyclic. The P7 packet's restructure entry "Fontaine–Laffaille Theorem 8.4
  belongs to R06.4" now records the ordering constraint:
  - R07.3/fl-lattice-correspondence requires fl-admissibility, and R07.3 → R06.4 is an edge;
  - so either R07.3 keeps the proof with R06.4 as interface, or R07.3 is split.

  The decision is referred to the R07 family restructuring.
- **/31.** Owner record: PR.2 owns BS22 Construction 7.6 and Lemma 7.7 to Proposition 7.10 (checked in v4). `formerly`
  is Q2. Q2's pair and ledger rows say it imports them.
- **/32.** RS-01.md's locators are now FontaineTheta.lean 118–213 and BDeRham.lean 1–98, checked at the pinned commit.

## Checks

- **`python3 scripts/check_restructure.py research/blueprint/restructure/RS-01.result.json`:** ok.
- **Application to the atlas.** I applied the accepted restructurings to `data/atlas.json` with this revision in place
  of the promoted RS-01 (`scripts/build.py` assemble, `scripts/restructure.py`).
  - All 28 new links are applied, and none is skipped.
  - The stage graph grows from 10,689 to 10,701 edges and stays acyclic.
- **Union graphs.** Each check adds this fix's 12 links.
  - Assembled atlas, plus the links of every `RS-*.result.json` (accepted or pending), plus every link map: acyclic.
  - The same, plus the node-level prerequisite edges of one member draft packet at a time, for each of AInfCohomology,
    CohomologyComparisons, PadicHodgeTheory P7, CrystallineCohomology, PrismaticCohomology, DerivedDeRhamCohomology,
    PerfectoidQuotients, PerfectoidSpaces P0, FiniteFlatGroups and HodgeTateAndCanonicalSubgroups T6: no link closes a
    cycle.
  - The rejected DD.0 → CR.0 does close one with the DerivedDeRhamCohomology draft (/18).
- **Reachability added by the 12 links.** 41 new reachable pairs between member stages, listed by origin in
  RS-01.md. Counting decomposition-node vertices and other roadmaps' stages, there are 1,508 new pairs, all downstream
  propagation of the imports.
- **`TAUCETI_BASELINE=… python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeTheory--P7.json`:** 0
  errors and 0 warnings, before and after; the packet has 29 requests.
- **`research/blueprint/intake.py check-files`** on the five changed files: see the pull request.
- **Lean.** No Lean file is a deliverable of this job, so none was compiled. The P7 suggested file is unaffected, since
  no API item or test changed.

## Hand-offs: node-level work for the member blueprints

The owner records bind the member blueprint jobs. The points below are the node-level consequences I found while
checking the drafts, for the revision jobs that the needs-changes reviews of 7 October will queue.

- **CohomologyComparisons** (packet complete; REV-CohomologyComparisons says needs_changes).
  - **`supplierRecords` and `importAliases`.** All of them name AI.5, following RS-01's first revision. They must be
    re-pointed:
    - coherence to AI.0;
    - perfectness/Tor and the module structure theorem to AI.2;
    - the complex-level lemmas to AI.5;
    - Proposition 13.21 to CR.3:Frobenius-isogeny, not bare CR.3.
  - **CP.5/length-monotonicity-under-torsion-cokernel** is CP.5's own (/9). It must become a CP.5 node, not an AI.5
    supplier record.
  - **The §13.4 identification.** CP.3/good-reduction-bdr-lattice-identification and CP.3/integral-rational-bdr-map-agreement
    fall under the new CP.2 owner record (/2). CP.2/rational-crystalline-comparison-over-C must then cite them as CP.2
    nodes.
  - **CP.5/small-weight-integral-interface** cites R06.4, which is not upstream of CP.5. The corrected RS-01 gives CP.5
    no R06.4 interface; take the conventions from CP.0 and R07.3/R07.4.
  - **CP.0/twist-frobenius-filtration-normalization** cites the stage AI.2, which is not an ancestor of CP.0.
- **AInfCohomology** (packet complete; needs changes).
  - **The §4.2 specialization objects** (W̃, Q, A_inf,(p), μ a unit in W(K♭)) have no AI.0 node yet.
  - **AI.5/rational-crystalline-frobenius** restates Proposition 13.21. It should be an import adapter of the
    CR.3:Frobenius-isogeny node.
  - **AI.6** needs the comparison with CP.3's deformation, importing CP.3.
  - **AI.7** keeps only its S-valued agreement.
  - **Stage-level cycles in the draft.** The packet's node edges, projected to stages, contain three, all independent of
    RS-01:
    - AI.5/proper-perfectness cites the stage CP.1, which requires AI.5;
    - AI.0/witt-almost-ideal cites AI.0:integral/residue-map, at a stage that requires AI.0;
    - an AI.1 ⇄ CR.4 pair.
- **CrystallineCohomology** (packet partial; needs changes). CR.3:Frobenius-isogeny/rational-frobenius is stated for
  proper smooth schemes over a noetherian PD base. Proposition 13.21 needs the base A_crys, which is not noetherian, and
  the smooth affine non-proper case. The stage must add a node for it.
- **PrismaticCohomology** (packet PR.0–PR.7, needs changes).
  - PR.4 must plan the prismatic logarithm and the first Chern classes (Bhatt–Lurie §2, §7, §8.2).
  - PR.8's future blueprint keeps its realizations only.
- **PadicHodgeTheory P7** (packet partial; continuation #968).
  - **Write the §5 nodes at P8:local-rational,** and move Theorem 4.9 (P8/affinoid-k-pi-one-for-p-torsion) there. Then
    point the two P8 nodes that now cite the stage P8:local-rational at those nodes.
  - **Bring the reader in line with this job's packet edits.** The reader and the suggested Lean file are not
    deliverables here. The P7 reader `readmes/PadicHodgeTheory--P7.md` is now out of date in these fields:
    - the statements of R06.1/tilt-of-cp-and-special-elements, R06.1/explicit-generator-of-ker-theta,
      R06.1/frobenius-kernel-ideals-of-ainf, R06.1/t-in-acris and P8/proper-smooth-de-rham-comparison-application;
    - their changed proof steps and prerequisites, and those of the two P8 nodes;
    - the new request to AI.0:integral, and request (b) to CP.3, which is withdrawn;
    - the primitive-comparison gap;
    - the P8:local-rational and P8 `remaining` items;
    - restructure entries 3, 4, 9 and 12.

    No API name or test changed, so the suggested Lean file needs no change.
- **For the maintainer.**
  - PAPER-BHATT-MORROW-SCHOLZE-18 route 5 places item 092 (BMS1 Theorem 5.7) at AI.4, and its maintainer note
    suggests P8:local-rational → AI.4. With this fix the primitive comparison is imported by AI.5, where Theorem 5.7's
    use (Theorem 14.3(iv)) is. Either move item 092 to AI.5, or add that link when the route is next revised.
  - PAPER-SCHOLZE-13 route 1 still names [P8, P8:local-rational]. Restrict it to P8:local-rational, as the BMS-18 fix
    already noted.
