# BP-FunctionFieldArithmeticPartII--GC.3 — handoff

Issue #8912. Agent: Claude — claude-SbW4Ay. Scope:
`FunctionFieldArithmeticPartII:GC.3` (symmetric local systems), follow-up of
DESIGN-FunctionFieldArithmeticPartII. This is a complete planning pass, not a
checkpoint and not an implementation. Packet status `complete`; GC.3 coverage
`planned`, with four narrow gaps and two requests.

## Delivered

- Thirteen new nodes: one definition, three constructions, three theorems,
  four lemmas and two comparisons; 28 API items, 19 unit tests and one new planet
  (*Cohomology of symmetric powers*), so the stage has six planets with the five
  of the parent. The twelve parent GC.3 nodes are imported unchanged by id in
  `importedTargets`; the parent packet was not edited.
- The parent's four remaining items are answered as follows.
  1. **EXTERIOR-COMP is closed.** `koszul-sign-action` is the sign twist of Tau
     Ceti's `PiTensorProduct.reindexRepresentation`. `antisymmetrization` (with
     `exteriorProjection`, $\pi\circ\alpha=d!$) and `alternating-invariants-exterior`
     identify the Koszul-signed invariants with $\wedge^d$ when $d!$ is a unit,
     naturally (so Frobenius-equivariantly), with $d=0$, $d=1$ and rank $\binom nd$.
     All of this is stated in Lean at the pins.
  2. **PI1, TAME-INERTIA and ST-LISSE.** `root-curve-character-dictionary` states
     the inertia description of local systems on the root curve. Its proof route
     cites accepted nodes (IG.0/etale-fundamental-group, IG.0/adic-local-systems,
     IG.1/tame-and-prime-to-p, IG.1/decomposition-inertia,
     IG.5/finite-cover-image-lemmas), Abhyankar's lemma (Stacks 0EYG) and
     extension in codimension one (Stacks 0H2W).
     `monodromy-symmetric-local-system` builds $\mathbb L_d$ by descent of
     $L^{\boxtimes d}$ along the $S_d$-cover of the distinct-point locus and
     extends it by purity. This is the definition YZ19 uses in the proof of
     Lemma A.8, and it needs no stack pushforward.
  3. **ST-OPS and DUALITY-SCHEME.** The cohomology is computed on the coarse
     space. `symmetric-coarse-model` is $\mathcal M_d=(q_{d*}(j_*L)^{\boxtimes d})^{S_d}$,
     and `rational-coarse-comparison` is $\omega_{d*}\mathbb L_d=\mathcal M_d$ with no higher
     direct images. `symmetric-power-cohomology` is Künneth with Koszul signs, and
     `twisted-curve-cohomology` uses EDC.2's $j_*$ Poincaré duality on the coarse
     curve. Supporting algebra: `averaging-exactness`,
     `finite-group-rational-acyclicity` and `tensor-character-kernel`.
     `pushforward-description-comparison` identifies $\mathbb L_d$ with YZ19's
     $(p_{d,!}L^{\boxtimes d})^{S_d}$.
  4. **LEAN-GEOMETRY.** The algebra is in Lean; the geometric signatures are an
     omission ledger (gap GC3-LEAN-CARRIERS).
- Reader: `readmes/FunctionFieldArithmeticPartII--GC.3.md`, with every new
  target, its API and test tables, proof routes, the imported parent nodes, the
  gaps with their intended owners, and the source qualifications.
- Suggested file: `suggested/FunctionFieldArithmeticPartII--GC.3.lean`, 278
  lines. It contains four real-bodied definitions (`koszulPermAction`,
  `koszulRepresentation`, `antisymmetrization`, `exteriorProjection`), their API,
  `antisymmetrization.bijective`, `invariants_map_surjective`,
  `groupCohomology_isZero_of_invertible`, three tensor-character lemmas, and the
  packet's tests as labelled examples.

## Remaining work

All stack-level inputs are now three precise statements. The owner they are
waiting for is the stacks Part II of EtaleDualityAndPerverseSheaves: route
`EtaleDualityAndPerverseSheavesPartIIStacks` of RT-AREA-etale/3, layers ST.0–ST.6,
grouped into DESIGN-EtaleDualityAndPerverseSheavesPartII. It has no stage ids yet,
so nothing cites it as a prerequisite.

1. `GC3-STACK-PI1` (ST.0, ST.2): Noohi's fundamental group of a connected
   Deligne–Mumford stack, lisse $\overline{\mathbf Q}_\ell$-sheaves as its continuous
   representations, and atlas descent. The accepted IG.5/finite-cover-image-lemmas
   already presupposes this fundamental group. It overlaps the sibling gap
   `GC4-LISSE-ADAPTER` of the GC.4 follow-up (merged while this job ran); the
   assembly should merge the two.
2. `GC3-COARSE-STALKS` (ST.0–ST.2): for a tame Deligne–Mumford stack with coarse
   map $\omega$, the stalk formula $(R^i\omega_*F)_{\bar y}=H^i(G_{\bar y},F_{\tilde y})$
   and Leray, with Frobenius. DeligneWeightsAndPurity (DWP.7) and WeilConjectures
   (WC.6) request the same comparison.
3. `GC3-STACK-PUSHFORWARD` (ST.1): proper base change along proper quasi-finite
   non-representable morphisms. It is needed only for the comparison with YZ19's
   pushforward description.
4. `GC3-LEAN-CARRIERS`: state the geometric declarations when stack and sheaf
   carriers exist.

**Assembly edits** (packet `restructure`, first entry) add prerequisites to the
parent GC.3 nodes:

- `tame-local-systems` ← `root-curve-character-dictionary`;
- `collision-kernel` ← `tensor-character-kernel`;
- `collision-descent` ← `monodromy-symmetric-local-system` and
  `pushforward-description-comparison`;
- `cohomology-vanishing` ← `rational-coarse-comparison` and
  `twisted-curve-cohomology`;
- `koszul-exterior` ← `alternating-invariants-exterior`;
- `exterior-cohomology` ← the coarse route.

They also retire EXTERIOR-COMP and repoint the GC.3 consumers of ST-LISSE and
ST-OPS to the gaps above. They create no cycle. Consumers in GC.4 and GC.5 that
need $L_d$ only as a local system may cite `monodromy-symmetric-local-system`.

**Requests:** SchemeAndStackFoundations:SF.2 for integrating the scheme Künneth,
finite pushforward and proper base change of EtaleCohomologyFoundations
(TauCetiRoadmap pull request #938, §§F.2.1, F.2.6, F.2.7, F.4.5). The citation of
ProfiniteCohomology Layer 10 (`corestriction_comp_res`) is recorded as a request
entry only; no new target is asked of it. No notion moved between roadmaps. The
generic algebra (Koszul action, antisymmetrization comparison, averaging,
acyclicity) is planned here because no roadmap owns it, with a restructure note to
move it to a generic owner if one is designated.

## Source findings

- `EGC3-1` (misprint, new): proof of Lemma A.6, p. 519 (arXiv v2 pp. 85–86) writes
  the cohomology of the root curve over $k$ instead of $\bar k$, twice.
- `EGC3-2` (gap, new): §A.2.1, p. 519, calls $p_d$ finite. It is proper and
  quasi-finite but not representable at collisions of branch points, where the
  stabilizer map is multiplication $\mu_2^m\to\mu_2$.
- `EGC3-3` and `EGC3-4` re-record the parent's E1 (perverse shift) and E3
  ($\chi$ valued in $\overline{\mathbf Q}_\ell^\times$).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.3.json --index <pinned declaration index>`:
  0 errors, 0 warnings. All 25 baseline references were found in the index and
  confirmed by `#check` in the pinned build.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.3.lean`:
  exit 0 at Mathlib 082e2d3 and Tau Ceti f790474, with only the 27 warnings for
  proof placeholders. The admitted-data check `scripts/check_sorry_data.py`
  passes.
- A script compared every packet API and test name with the Lean file (or its
  omission ledger) and the reader; nothing is missing.

## Sources

Read and freely available; no restricted source was used. URLs and SHA-256 values
are in the packet.

- Yun–Zhang, Annals 189 (2019), author-hosted published PDF: Appendix A.1–A.2.1,
  pp. 514–521, with page images of pp. 518–519; arXiv v2 pp. 85–86.
- Stacks Project §§58.21, 58.31, 12.4.
- Noohi, arXiv:math/0201021, §§2, 4, 7.
- Abramovich–Vistoli, arXiv:math/9908167v2, §§2.2–2.3.
- Conrad, *Exterior powers*, §§2–5.
- Milne, *Class Field Theory* v4.03, II §1.
- Etingof et al., arXiv:0901.0827v5, §3.

Upstream roadmaps were read at their heads: TauCetiRoadmap main 350e970
(SchemeAndStackFoundations, ProfiniteCohomology) and pull requests #938, #1040,
#850 and #908. The scratch directory is not needed to continue; everything is in
the four deliverables.
