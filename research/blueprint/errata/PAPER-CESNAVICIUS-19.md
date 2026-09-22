# Mistakes in Česnavičius, *Purity for the Brauer group*

Job ERRATA-PAPER-CESNAVICIUS-19. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The finding is in `PAPER-CESNAVICIUS-19.json` beside this file.

**Paper and version read.** Kęstutis Česnavičius, Duke Mathematical Journal 168 (2019), 1461–1486, DOI 10.1215/00127094-2018-0057.
- Read: arXiv 1711.06456v4 of 1 December 2018 (PDF SHA-256 `a62a12bb…8709`), the latest version and the one the extraction used. §2 was re-read in full.
- Compared: the author's own copy (27 November 2018), which has the same text there.
- Not collated: the published text.

**Earlier work.** The extraction PAPER-CESNAVICIUS-19 (partial) read the whole paper and recorded one point in the source, gap G-NONABELIAN, below. Its other open "gaps" are reading debts on cited sources (Giraud, SGA 2, Gabber–Ramero, Elkik and others), not mistakes in this paper. Its note on numbering in Gabber–Ramero is a version dictionary, not an error.

**Existing corrections.** None was found:
- Crossref registers no erratum;
- v4 is the latest arXiv version;
- the author's copy is unchanged;
- a web search found nothing.

**Effect.** None on the main theorems. The one finding is a gap in the noncommutative case of an auxiliary proposition that the paper only applies to commutative groups.

## E1. Proposition 2.2 for noncommutative G (gap)

**The statement.** Proposition 2.2 asserts, for a finite flat map R → R′ of local rings, an open V ⊂ Spec R with Γ(V, O) = R, and an affine smooth R-group G whose torsors over R are trivial, that H¹(V, G) → H¹(V_{R′}, G) is injective.

**The proof.** Put H = Res_{R′/R}(G_{R′}) and X = H/G. The proof shows that every V-point of the affine R-scheme X comes from R and hence lifts to H(V). Citing Giraud III.3.2.2, it concludes that H¹(V, G) → H¹(V, H) is injective. It then identifies H¹(V, H) with H¹(V_{R′}, G).

**The gap.** Surjectivity of H(V) → X(V) only says that the class of the trivial torsor is alone in its fibre. When G is commutative this is injectivity, since the map is a homomorphism. When G is not commutative, H¹ is a pointed set, and the fibre through the class of a G-torsor P is governed by the twisted forms: it is the orbit set of (^P H)(V) on (^P X)(V) (Giraud III.3.2; compare Serre, *Galois Cohomology* I.5.5, Cor. 2). The proof does not treat these. They are defined only over V, so neither Γ(V, O) = R nor the affineness of X controls their V-points. If P extends over R, it is trivial by hypothesis (2), so the open question concerns exactly the torsors on V that do not extend.

**Effect and correction.** Proposition 2.2 is used twice:
- in Proposition 2.3, with G = Res_{R′/R}(T_{R′})/T;
- in Corollary 2.4, with G = T a torus.

Both groups are commutative, so everything downstream, including the purity theorem, stands. The proposition should be stated for commutative G, or the twisted surjectivity supplied. This record, like the extraction, does not claim the noncommutative statement is false.
