# BP-CrystallineCohomology--CR.0 — classical PD filtration

Codex — codex-7e92bd. Refs #704. Own-job follow-up to merged checkpoint
#3148; the packet remains partial with the same seven stages.

The nine additions specify the weighted-product ideal filtration, its zeroth
and first steps, decreasingness, multiplication, ordinary-power inclusion,
preservation under PD morphisms, equality for surjective PD maps with exact
ideal image, and equality with ordinary powers over rational algebras.
They use the existing Ideal and DividedPowers carriers.

Current totals: **84 nodes, 91 API items, 82 tests, 11 planets, 79 baseline declarations, 10 gaps, 1 request, 0 closed stages**. Node kinds:
9 definition, 53 lemma, 17 construction, 5 theorem.
All 75 preceding node objects and every existing supplier request are
unchanged. Every existing source finding retains its locator, correction and
evidence; seven no-correction markers are normalized to the protocol token
new, preventing the register from describing them as published corrections.
This token records the bounded search result, not exhaustive novelty.
Only the PD-filtration portion of the CR.0 remaining
list and its associated gap is narrowed; no stage is closed.

Three API entries and three definition tests accompany the filtration. The
tests cover the empty word at degree zero, vanishing positive stages on the
zero ideal, and 2∈F²(2) but 2∉(2)² in the 2-adic integers. The last test prevents
replacing divided-power degree by ordinary ideal degree. Independent rational
arithmetic checked 561 divided-power values and 1,377 multiplication identities;
these finite checks are evidence for the examples, not general theorem proofs.

The complete suggested file compiled with **0 errors and 217
warnings, all proof placeholders**. Its 2,101 actual
transitive Mathlib imports were byte-matched to the pin. The two TauCeti modules
were reused only after checking their pinned-source, fresh-object and sidecar
hashes. Signature elaboration is not a formalization claim. The inherited
comment-only forms, API entries and tests remain outside that compilation claim.

Stacks60.6 was read including local comments. The exact definition is the
unnumbered paragraph between 60.6.2 and 60.6.3. Current chapter PDF pages 12–14
were visually checked; TeX SHA-256 `466c0634a5e8e3899b157a42a4b4bb5f4357199f96708caf5854f5a92be58054`,
PDF SHA-256 `d1cad9f56d1e30b8311d95ea00f9b3e784341fcaf3e69083ccbc8dc786e10041`. Three pending findings record the remaining
quotient-parentheses occurrence in 60.6.3 and the grammar/tensor-base slips
in 60.6.6. The earlier partial correction was checked at its actual patch; no
finding carries an independent-review verdict or exhaustive novelty claim.

The blueprint checker with the pinned declaration index reports zero errors
and zero warnings; the four-file intake reports zero problems. The new packet,
reader and signatures agree; the internal graph is acyclic. Fresh main
`8f6fe5b8ff79f514c6c42a430b1813e4eae48ea5` matched all 52 captured inputs and all four
predecessor outputs. The issue body and latest winning own claim 5851266210
were unchanged; #704 was available and review #379 remained unclaimed.
No independent-review verdict was added.

Continue with the full divided-power stability bound γ_m(FⁿI)⊆F^(mn)I, including
its finite-sum and iteration argument, PD nilpotence and exact quotient and
completion contracts. Canonical divided powers on Γ, PD polynomial algebras,
universal envelopes and localization/transitivity remain separate targets.
Import derived powers and completion from DD.0/1. Preserve all crystalline
site, duality, strict-completion and full-source obligations below.

The preceding checkpoint handoff follows as a historical record. Its counts
and compile digest describe that checkpoint; current counts are above.

---

# BP-CrystallineCohomology--CR.0 — finite Verschiebung quotients

Codex — codex-7e92bd. Refs #704. Claim5851263620 was confirmed by the bot in
5851266210. The issue was read before and after confirmation. Snapshot main:
`3afa71d3a9569f304631d4eff9b94eca591c927b`. This continues merged checkpoints
#3125 and #3127 from the same session, preserving their 38 mathematical statements and
six source findings. Thirty-seven node objects are unchanged; the completion
aggregate gains its exact finite supplier dependencies and an updated gap note. Exactly the issue's four deliverables are changed.

## What is specified

The packet has 75 nodes: eight definitions, seventeen constructions,
forty-five lemmas and five theorems. There are 88 API entries, 79 tests,
ten planets and 66 pinned baseline references. Thirty-seven nodes are added,
including eighteen API promotions that reuse a single Lean declaration.
No stage is closed; ten gaps and one supplier request remain.

The finite CR.4 tranche supplies morphisms on the actual cochain-map carrier,
V naturality, N_r=im(V^r)+im(dV^r), its decreasingness and differential/operator
stability, and the actual quotient cochain complexes W_r. It supplies their
projections and restrictions, the graded finite F/V maps, FV=VF=p, p^r
annihilation, the restriction-kernel/p-torsion theorem, the finite Frobenius
lifting theorem and functoriality. The source's prime-p convention is stated;
the signatures use only the saturation hypotheses needed by their algebra.

All cochain degrees are integers, r=0 is explicit, and the differential uses
its incoming degree n−1. F and V remain graded maps with dF=pFd and Vd=p dV;
they are not silently declared cochain maps. The degree objects are existing
submodule quotients, with their actual quotient-induced differential.

The finite-support integer subcomplex of BLM Example2.5.7 is specified in the
reader and checked computationally. It demonstrates that im(dV^r) is essential
and that the unscaled differential relations fail. A named Lean construction
of the model and its coordinate equivalences remains needed when proving the
three existential tests. Other tests include Z/8 at level3,p=2, vanishing level
zero, rational vanishing and a morphism that ordinary cochain maps would admit
but Frobenius compatibility excludes.

## Where to resume

1. Construct the inverse limit of these actual finite complexes, its compatible
   graded F/V maps, the unit and its functoriality. Use finite Frobenius lifting
   and ker(R)=p-torsion in Proposition2.6.5's argument for saturation. Do not
   assume an arbitrary family of Frobenius lifts is compatible: apply a
   restriction to the lifts as the source does.
2. Close the η/Bockstein comparison and Proposition2.7.1, then the finite-level
   comparison W_r(M)→W_r(W(M)), strictness and universal completion property.
   The proof of2.7.7 begins beyond this pass's reading. Preserve the original
   seven CR.4 identifiers; three aggregate node signatures, seven API entries
   and six tests remain comment-only. Finite-level signatures do not close
   the inverse-limit portion of the completion aggregate.
3. Supply the underived η filtered-colimit contract requested from AI.1.
   The derived Lη statement alone does not provide it. Finish torsion reduction,
   saturation universal property and Cartier-type comparison. Generic η is
   not an input to the finite-level tranche delivered here.
4. Continue BLM's strict algebra/universal de Rham–Witt and classical comparison
   theory, and Langer–Zink's relative theory with full R/F/V/Teichmüller/dlog
   relations. Do not identify saturated and classical complexes on every
   singular input.
5. On CR.0, construct the canonical augmentation PD structure on the existing
   Γ carrier, free monomial basis, flatness and compatible PD polynomial
   algebra. The retained augmentation intersection lemma supplies the gluing
   hypothesis once both PD structures exist. Build universal envelopes,
   quotient presentations and exact base change with Stacks60.2.6–7's Tor,
   flatness and generation hypotheses. Complete PD filtrations, regular
   immersions, DD completion/derived comparison and the shared A_cris.
6. Complete the crystalline site, coefficient/connection equivalence with
   quasi-nilpotence, PD Poincaré and embedding-independence proofs, descent,
   proper perfectness, derived base change, and Frobenius-isogeny statements.
   For the Stacks site convention require p locally nilpotent on T without
   adding uniform ordinary nilpotence of the whole PD ideal. Individual
   crystalline cohomology groups may have torsion.
7. Retain the exact classical-duality source gate: acquire Berthelot LNM407
   VI–VII or establish the Ekedahl-to-crystalline trace comparison. Neither
   BO7–8 nor BMS1§14 supplies this missing duality proof. The other full source
   coverage obligations and the accepted RS01 ownership boundaries remain.

## Sources and checks

Freshly downloaded BLM arXivv3 matches the recorded158-page PDF hash.
Read pp.13–15 and19–25, through the statement of2.7.7. The publisher PDF was
reused after hash verification; printedpp.22–23/PDFpages30–31 were read and
rendered. The new findings E7/E8 are editorial slips in the published proofs
of2.6.2 and2.6.5 and also occur in the preprint. The bounded register, version
history and publisher/author-page screen found no correction; novelty is not
established. All preceding reading ranges and E1–E6 remain unchanged.

The source/owner inputs from the preceding same-session work were byte-checked:
only the global source register changed. The two upstream models and the
binding protocols were unchanged. The accepted AUDIT36 review was reread;
there are still no CrystallineCohomology entries in library-coverage.json.
The pin has generic quotients and cochain complexes, not the finite Dieudonné
quotient theory. Searches of other packets/decompositions found no rival
supplier for these declarations.

Exact arithmetic checks use 190 finite-support representatives in the explicit
unbounded-basis model, with 1,900 level/degree cases. They include both
non-chain witnesses. These are acceptance checks, not general proofs.

The complete suggested file compiled with Lean4.34.0-rc2: zero errors and
203 warnings, all proof placeholders. It contains 135 distinct named
declarations and 73 typed examples. All added nodes/API/tests are typed;
three inherited node forms, seven API entries and six tests remain comment-only.
The eight printed dependency-sensitive telescopes were inspected explicitly.
No proof or implementation claim follows from elaboration.

All 2,101 reached Mathlib source files were byte-matched to the pin. Two
Tau Ceti modules reuse the earlier pinned build after source, object and
sidecar hash checks. The import scanner excludes documentation examples.
The indexed blueprint checker reports zero errors and zero warnings; the
four-file intake reports zero problems. Preservation, API/test parity,
source-finding/version and mutation checks pass. The internal graph has
152 edges and is acyclic; the three external prerequisites are the retained
AI.1 node/stage inputs. This is not a global atlas-stage closure certificate.
The reader has 15,510 words.

The final publication guard matched 52 captured inputs and all four
predecessor outputs at main `29cfc321142494445972e8f8851ad2d963cc780f`, with the issue body and winning claim
unchanged. The two global source-issue files were refreshed; all 25 changed
records were read and the register was screened for the focal source and
locators. No changed correction affects this tranche. Exactly four files are
submitted through Git Data REST; no git commands were used.
