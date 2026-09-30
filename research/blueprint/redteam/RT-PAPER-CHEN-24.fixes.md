# RT-PAPER-CHEN-24: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4972, job FIX-RT-PAPER-CHEN-24).
- Findings: `RT-PAPER-CHEN-24.result.json`.
- Verdicts: `RT-PAPER-CHEN-24.review.json`, with the report `reviews/REV-RT-PAPER-CHEN-24.md`. All ten
  findings are confirmed. The verifier corrected several fixes, and I applied its versions.
- **Files changed.**
  - `papers/PAPER-CHEN-24.result.json`.
  - `papers/PAPER-CHEN-24.md`, which has a new closing section.
  - `collation/REQUESTS.md`, regenerated with `python3 scripts/collation.py --write`. The data file that
    command also rewrites, `data/collation.json`, is not a deliverable and was restored.
- **Result.** 130 items (5 library, 14 planned, 111 missing), eight routes and 41 source issues.
  `check_paper.py` reports ok, and `check_errata.versions_checked` reports no error.
- **Independence.** I did none of the extraction (cc-7b31c4), its review (cc-39fac3), the red team
  (cc-f805bf) or the verification (Codex).
- **The published text.** I fetched the author-hosted published PDF,
  https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf.
  Its SHA-256 is `9386db34…20ac`, as the verifier recorded, and it has 143 pages. I re-read pp. 310, 359,
  390 and 419.
- **Other checks.** I read the pinned declarations at their files, checked the Landesman–Litt route and
  items, and checked the IG, R09, R13 and Katz–Mazur stage anchors. Crossref confirmed the new
  prerequisites' DOIs.

## /1 (medium, error): finiteness over K is finiteness of j-invariants: fixed

- **New E39.**
  - Kind error, reach "a stated result", known "new".
  - It cites v2 (Theorems 1.2.9 and 5.6.4, pp. 8, 84) and the published text (Theorems 1.2.10 and 5.6.4,
    pp. 310, 419). The claim survives in print, now worded "defined over K".
- **The argument** is the verifier's:
  - M = (AB − BA)/2 makes γ_{−I} inner at trace −2;
  - so quadratic twisting preserves the structures;
  - covers defined over K descend through ι of order 2 or 4, using a fourth-root Kummer twist.
  - The red team's composition with a noncentral deck transformation is not used, since the verifier
    showed it need not stay G-equivariant.
- **Items 16 and 97** now claim finiteness of j-invariants (K̄-isomorphism classes), with notes.

## /2 (medium, other): what was read, and the collation worklist: fixed, following the verifier

**What the verifier found.** The published PDF is public on the author's page. The verifier compared
six passages, and two of those issues are already corrected in print. It asked for:
- structured provenance;
- per-issue version and `known` fields;
- no blanket "published" flag that would hide the uncollated rows.

**What I changed.**
- **`sourceVersions`** has one entry, `preprint` arXiv v2 with its hash, which the extraction read in
  full. With it, `collation.provenance()` returns "preprint", so the paper is back on the worklist with
  its seven stated-result findings.
- **A new `publishedCollation` block** records the published PDF (URL, hash, 143 pages) and the exact
  selected-passage scope. It explains why the PDF is not a `published` sourceVersions entry:
  collation.py would then drop the uncollated findings.
- **E3, E7, E27, E31, E36 and E37** each gain `publishedText`, the comparison at that passage.
  - E3 (the sentence is absent from Corollary 1.1.2, pp. 305–306) and E37 (Proposition 6.1.4, p. 424,
    now assumes a faithful action on the strict local ring) have `known` set to the version of record,
    with `previousKnown` kept.
  - E27 records the changed wording: "injective" is deleted but the hooked arrow remains.
- **The old note** "the published version is behind the journal's paywall and could not be read",
  present in the `searched` list of every issue, is replaced:
  - for the six compared passages, by the collation result;
  - for the rest, by a statement that the passage is not yet collated against the author-hosted copy.
  - `source.version` no longer calls the text paywalled.
- **`collation/REQUESTS.md`** is regenerated and now lists PAPER-CHEN-24 with seven quoted statements.
  The regeneration also brings in current entries for other papers, such as FARGUES-FONTAINE-18 and
  FENG-24, because the file was stale on main.

**For the maintainer.**
- The negative-reading defect in `collation.provenance()` needs a code change. READ_IT matches "could
  not be read", and any declared `published` entry counts as read. RT-PAPER-CESNAVICIUS-19/3 reports the
  same.
- The papers.json link for PAPER-CHEN-24 could point to the author-hosted PDF, so that a collation job
  can open it directly.

## /3 (medium, duplicate): Out(F₂) and the once-punctured torus had two owners: fixed

**New route 7, `new` → MappingClassGroupsAndCanonicalRepresentations.** It uses the same id, title
("Mapping class groups and canonical representations of surface groups") and area (topology) as
PAPER-LANDESMAN-LITT-24's route 1, so the queue merges the two into one design. It carries:
- **item 123**, Nielsen's theorem, restated as the (1,1) case: Out(F₂) ≅ GL₂(ℤ), Out⁺(F₂) ≅ SL₂(ℤ) ≅
  Mod_{1,1}, with γ_{−I} ↦ −I;
- **new item 124**, Nielsen's generators r, s, t of Aut(F₂) (MKS §3; LL/96);
- **new item 125**, Out(Π), Aut⁺(Π) and Out⁺(Π), split from item 107;
- **new item 126**, the once-punctured torus identifications Γ_E ≅ Out⁺(Π) and π₁^top(M(1)^an) ≅ Γ_E,
  split from items 35(5) and 44 (LL/113, LL/11);
- **item 128**, for finding 6.

Following the verifier, the brief requires each (1,1) specialization to be stated explicitly, not
asserted from the general theorem.

**Other changes.**
- **Item 107** keeps only the library part: FreeGroup, FreeGroup.Red and MulAut.
- **Items 35 and 44** keep the elliptic G-structure monodromy and import the rest. Items 8 and 78 note
  their dependence on item 124.
- **Route 6's brief** replaces "Nielsen's theorem …, a new item planned here" with these imports.

## /4 (medium, duplicate): the general Hurwitz stack had three candidate owners: fixed

**What moved to IG.5.** The general-(g,n) statements now go to IG.5 on route 3, as an explicit request
to extend IG.5 to arbitrary marked genus. The verifier stressed that IG.5 does not already have that
generality.
- Items 21, 23 and 33 left route 6 for route 3.
- **New item 127** covers the smooth tame locus of the Hurwitz stack of G-covers of (g,n)-curves, étale
  over M_{g,n}, with Z(G) vertical automorphisms and rigidification by Z(G).

**The verifier's corrections, as applied:**
- Z(G) is the vertical automorphism group of a connected smooth cover over a fixed base, not
  necessarily its full isotropy.
- Étaleness is a smooth-locus statement, since compactified admissible covers ramify at nodes (T ↦ t^e).
- Chen's one-parameter boundary calculation (item 36) is not a general deformation theorem.

**Route 6** keeps the (1,1) G-structure theory, the compactification, cusps and congruences, and
imports the general stack. Route 7's brief asks the MappingClassGroups design to import LL/125's stack
from IG.5 rather than build it.

## /5 (medium, other): the CA.4 imports and the Markoff Part II id: fixed where this job can

**In the extraction.**
- **Route 2's roadmap id** is now ArithmeticDynamicsPartII. Its brief and route 6's name the merged
  design DESIGN-ArithmeticDynamicsPartII (issue #3367) in place of the superseded
  DESIGN-ArithmeticDynamicsPartIIMarkoff.
- **Both briefs** now say that CA.4's blueprint builds only the coefficient-three surface. They list
  what route 1 requests from it:
  - the coefficient-one surface 𝕏 with its moves;
  - the twist ξ(x,y,z) = (3x,3y,3z), an isomorphism over ℤ[1/3] and a bijection on integral points,
    not an isomorphism over ℤ;
  - Markoff's theorem for 𝕏.
  They add that these must be added there before they can be imported.
- **Route 1's reason** records the adapters CA.4 still needs.

**For the maintainer.**
- Refresh the released blueprint issues #1025 (BP-ClassicalArithmeticCompletion), #1013 (BP-InverseGalois…)
  and #1020 (BP-Anabelian…) with `research/blueprint/issues.py` refresh, so this paper's accepted source
  routes reach them.
- Reopen CA.4's coverage for this source and add the three adapter nodes above, derived from
  CA.4/markoff-root-generation. Those files are outside this job's deliverables.

## /6 (medium, error): the stack form of Riemann existence was marked planned: fixed

- **Item 112** keeps the curve form, planned at IG.3 and BelyiMaps Layer 8.
- **New item 128,** missing, covers Riemann existence for Deligne–Mumford stacks (Noohi, Theorem 20.4,
  Corollary 20.5, pp. 80–81). It is stated for the analytic stack M(1)^an, not its coarse j-line, with
  Noohi's hypotheses. It goes on route 7, the shared moduli and topology interface both roadmaps
  consume, as the verifier asked.
- **ComplexComparisonPartII C3–C4** is recorded as not supplying it.
- **Noohi** was already a prerequisite. The item gives it a supply contract.

## /7 (low, missing): prerequisites and two small inputs: fixed

**Prerequisites added:**
- Brumfiel–Hilden 1995 (doi 10.1090/conm/187);
- Deligne 1989, §15 (doi 10.1007/978-1-4613-9649-9_3), with a note that the NC.0 blueprint should take
  it as a source;
- Magnus–Karrass–Solitar, §3;
- Osborne–Zieschang 1981 (doi 10.1007/BF01389191);
- Knudsen 1983 (doi 10.7146/math.scand.a-12001).

**New item 129:** π₁ invariance under extension of algebraically closed fields of characteristic 0 (SGA
1 XIII 4.6), with the GAGA transfer.
- As the verifier asked, nothing is claimed in positive characteristic.
- It is on route 3, whose stages now include IG.0 and IG.1.
- Items 57, 58 and 63 cite it.

**Item 99's note** gains the two group-theoretic inputs of Corollary 5.6.8, in the verifier's version:
- the composition factors of SL₂(ℤ/n) are abelian or PSL₂(F_ℓ) with ℓ ≥ 5, by the Chinese remainder
  theorem, the congruence kernels, the solvable cases ℓ = 2, 3 and the central quotient;
- a subgroup of a noncongruence subgroup is noncongruence.

**Item 77's note** follows the verifier's published-version qualification: plan from the published
invariant-theory repair (pp. 395–396, Appendix 6.2), not the v2 point-invariant argument.

## /8 (low, library-claim): four citation errors: fixed

- **Item 106** now cites `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor`
  (`Galois/Basic.lean:83`). `CategoryTheory.FiberFunctor` does not exist at 082e2d3.
- **Item 107** is split, as in finding 3.
- **Item 109's note** now gives Matrix.SpecialLinearGroup at
  `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`. The module-level group at
  `LinearAlgebra/SpecialLinearGroup.lean:52` is a different object.
- **Item 111's note** now gives `Mathlib/Data/Nat/Totient.lean:39`.

## /9 (low, error): two unrecorded misprints: fixed, with the verifier's version correction

The ids E40 and E41 are fresh: the file had E1–E38, and E39 is finding 1.
- **E40,** misprint, §1.3.2, v2 p. 10: "m_X divides m′_X". The correct chain is m′_X | m_X | 12m′_X.
  - Following the verifier, it is recorded as a preprint misprint already corrected in print. The
    published introduction (pp. 313–314) no longer has the sentence, and p. 359 prints the correct
    chain, which I checked.
  - So `known` names the version of record.
- **E41,** misprint, proof of Corollary 4.12.4, v2 p. 64 and published p. 390, which I checked:
  "(c)" should read the second assertion of (b). Known "new".

## /10 (low, other): route 6's first final theorem and item 2's suppliers: fixed, as corrected

**Route 6's final theorem (1)** now copies the corrected contract of item 52:
- the base is an algebraically closed field of characteristic 0;
- e ≥ 2 is needed for a component R;
- d_X is the degree of the induced map of coarse schemes R → X, not the stacky degree.

**Item 2's suppliers.**
- Item 2 is now planned at:
  - R13.1, for the generalized-elliptic carrier;
  - R09.4, for moduli-stack algebraicity;
  - Katz–Mazur Layer 9E, for the coarse affine j-line.
- The Layer 4 citation is dropped, since that layer disclaims general stack theory.
- The verifier found that Katz–Mazur Layer 10 restricts compactified curves to prime-level diamond
  quotients. So the level-one compactified coarse curve P¹_j is split off as new item 130, missing, on a
  new route 8: a source request to ModularCurvesPartII R13.2, importing Layer 9E. It is not marked
  planned on the strength of a neighbouring layer's title.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CHEN-24.result.json`: ok.
- `check_errata.versions_checked` on the result: no error. It failed before this fix.
- `collation.provenance()` returns "preprint", with seven stated-result findings on the worklist.
- `research/blueprint/intake.py check-files` on the four deliverables: no problems.
- The JSON keeps the file's own formatting (indent 1).
- No Lean was compiled.
