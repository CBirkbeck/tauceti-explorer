# Handoff: PAPER-GUO-REINECKE-24

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1226).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.** arXiv 2203.09490v3, the referee-revised version, was read in full from its TeX source and PDF. The work was split by section:

- introduction and §2;
- §3–4;
- §5–6;
- §7–8;
- §9–10 with the bibliography.

Every recorded mistake was re-checked against the TeX source. The published Inventiones PDF is paywalled and was not read.

**Deliverables:**

- `research/blueprint/papers/PAPER-GUO-REINECKE-24.result.json`: 274 items (2 library, 52 planned, 220 missing), 9 routes, 14 prerequisites and 35 source issues.
- The report, `research/blueprint/papers/PAPER-GUO-REINECKE-24.md`.

## Judgement calls for the reviewer

**Two Part IIs rather than one.** Faltings' crystalline local systems and the sheaves 𝔹_crys(E) (§2) go to a PadicHodgeTheory Part II. The prismatic theory (§3–§10) goes to a PrismaticCohomology Part II, which imports the first. A single Part II of PrismaticCohomology would also be defensible, but §2 does not use prisms.

**Reused proposals.**

- `ArcTopologyAndDescent`, from the Bhatt–Mathew and Bhatt–Scholze extractions.
- `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry`, from Bhatt et al., for Bhatt's absolute integral closures.

**Source routes that stretch a layer.**

- The Berkovich–Zavyalov trace goes to ClassicalAdicEtaleCohomology H3, whose text covers curves only.
- Coherent duality for smooth proper formal schemes goes to SchemeAndStackFoundations SF.3, whose Serre duality covers curves.

If the reviewer prefers, these two items can move into the prismatic Part II.

**Consolidated external items.** About two hundred citations of Bhatt–Scholze, Bhatt–Lurie, BMS, Scholze and the Stacks project were grouped into about fifty items. Each item names its locators and the planned layers.

## Leads not recorded as source issues

A reader flagged these during the reading, but I could not confirm them conclusively, so they are not in `sourceIssues`:

- **Theorem 4.15 (gluing).** The gluing may also need compatibility along V(I) ⊂ 𝒴°, which Proposition 4.11(ii) seems to supply without being cited.
- **Lemma 3.13.** The module M must be the finitely presented extension given by Stacks Tag 01PI, not an arbitrary submodule.
- **Proposition 7.1.** The citation of [BMS18, Thm 14.5] covers characteristic-0 valuation rings, but the arc-cover also contains characteristic-p ones.
- **Proposition 9.5(i).** Localization does not commute with infinite products; the proof can be repaired using idempotents.
- **Proposition 5.11.** Stacks Tags 07LU and 0DJG are nilpotent-ideal statements, and a limit step is needed. This caveat is recorded in the note of the Stacks item.
- **Lemma 3.4's proof** shows only one of the two inclusions it needs. The other follows at once from φ(d) ≡ d^p mod p.
- **Index slips** in Theorem 10.7 and Construction 10.6.
- **Two further slips:** a "finite étale" that should be "étale" in the proof of Lemma 2.9, and the "Step 3 of Corollary 2.37" reference in Remark 10.14.
- **Remark 8.2** presents the crystalline Frobenius isogeny as a consequence of Theorem 8.1, although Xu's theorem is an input to it.

## Not done

Nothing remains in the extraction. The published version was not compared line by line.
